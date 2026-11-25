@echo off
rem ============================================================
rem  priesttech-sync.bat  (лежит в BepInEx, синхронизирует именно её)
rem  Синхронизация локальной сборки с GitHub-репозиторием.
rem  Самодостаточный: при отсутствии git скачивает портативный
rem  MinGit + git-lfs в .tools\ и работает через него.
rem  Если git поднять не удалось — синхронизирует по HTTP (ZIP+LFS).
rem
rem  Ключи: --no-launch --force --dry-run --http --portable --help
rem ============================================================
chcp 65001 >nul
setlocal EnableExtensions
set "REPO_SELF=%~f0"
set "REPO_ROOT=%~dp0"
set "REPO_ARGS=%*"
set "REPO_PS=%TEMP%\priesttech-sync.ps1"

powershell -NoProfile -ExecutionPolicy Bypass -Command "$s=[IO.File]::ReadAllText($env:REPO_SELF,[Text.Encoding]::UTF8); $m='#__PS_START__#'; $i=$s.LastIndexOf($m); if($i -lt 0){ Write-Host 'Не найден блок PowerShell в батнике' -ForegroundColor Red; exit 2 }; [IO.File]::WriteAllText($env:REPO_PS, $s.Substring($i+$m.Length), (New-Object Text.UTF8Encoding($true))); & $env:REPO_PS; exit $LASTEXITCODE"

set "RC=%ERRORLEVEL%"
if not "%RC%"=="0" (
  echo.
  echo Завершено с кодом %RC%.
)
exit /b %RC%

#__PS_START__#
$ErrorActionPreference = 'Stop'
try { [Console]::OutputEncoding = [Text.Encoding]::UTF8 } catch { }
try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 } catch { }
$ProgressPreference = 'SilentlyContinue'

if ($PSVersionTable.PSVersion.Major -lt 3) {
    Write-Host 'Нужен PowerShell 3.0 или новее (в Windows 10/11 он есть по умолчанию).' -ForegroundColor Red
    exit 2
}

$Owner      = 'Tech3434'
$Repo       = 'tech-repo-build'
$Branch     = 'main'
$SteamAppId = '3241660'

$root = $env:REPO_ROOT
if (-not $root) { $root = (Get-Location).Path }
$root = [IO.Path]::GetFullPath($root).TrimEnd('\')
$remoteUrl = "https://github.com/$Owner/$Repo.git"

$opt = @()
if ($env:REPO_ARGS) {
    $opt = @([regex]::Matches($env:REPO_ARGS, '"[^"]*"|\S+') | ForEach-Object { $_.Value.Trim('"') })
}

if ($opt -contains '/?' -or $opt -contains '--help' -or $opt -contains '-h') {
    Write-Host ""
    Write-Host "tech-repo-sync — синхронизация локальной сборки с https://github.com/$Owner/$Repo"
    Write-Host ""
    Write-Host "Использование: priesttech-sync.bat [ключи]"
    Write-Host ""
    Write-Host "  --no-launch   только обновить, не запускать игру"
    Write-Host "  --force       отбросить локальные правки и взять версию из репозитория"
    Write-Host "  --dry-run     показать, что изменится (только для режима без git)"
    Write-Host "  --http        не использовать git, синхронизировать по HTTP"
    Write-Host "  --portable    всегда использовать портативный git из .tools\"
    Write-Host "  --help, /?    эта справка"
    Write-Host ""
    Write-Host "По умолчанию: git pull (или автозагрузка портативного git), затем запуск игры."
    Write-Host "Если git поднять не удалось, включается резервная синхронизация по HTTP."
    Write-Host ""
    exit 0
}

$launch   = -not ($opt -contains '--no-launch')
$force    = $opt -contains '--force'
$dry      = $opt -contains '--dry-run'
$httpOnly = $opt -contains '--http'
$portableOnly = $opt -contains '--portable'

$toolsDir = Join-Path $root '.tools'

# ---------------- общие утилиты ----------------

function Write-Head($text) { Write-Host ""; Write-Host $text -ForegroundColor Cyan }

function Get-Json([string]$url) {
    $wc = New-Object Net.WebClient
    $wc.Headers.Add('User-Agent', 'tech-repo-sync')
    $wc.Headers.Add('Accept', 'application/vnd.github+json')
    return ($wc.DownloadString($url) | ConvertFrom-Json)
}

function Save-Url([string]$url, [string]$dest) {
    if ($script:curl) {
        & $script:curl -fL --retry 3 --retry-delay 2 --silent --show-error -o $dest $url
        if ($LASTEXITCODE -ne 0) { throw "curl завершился с кодом $LASTEXITCODE" }
    } else {
        $wc = New-Object Net.WebClient
        $wc.Headers.Add('User-Agent', 'tech-repo-sync')
        $wc.DownloadFile($url, $dest)
    }
}

function Expand-Zip([string]$zip, [string]$dest) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem | Out-Null
    [IO.Compression.ZipFile]::ExtractToDirectory($zip, $dest)
}

function Get-Sha256([string]$path) {
    $sha = [Security.Cryptography.SHA256]::Create()
    $fs = [IO.File]::OpenRead($path)
    try { $hash = $sha.ComputeHash($fs) } finally { $fs.Dispose(); $sha.Dispose() }
    return ([BitConverter]::ToString($hash) -replace '-', '').ToLower()
}

function Get-ArchName {
    $a = $env:PROCESSOR_ARCHITECTURE
    if ($env:PROCESSOR_ARCHITEW6432) { $a = $env:PROCESSOR_ARCHITEW6432 }
    switch ($a) {
        'ARM64' { return 'arm64' }
        'AMD64' { return '64-bit' }
        'x86'   { return '32-bit' }
        default { return '64-bit' }
    }
}

function Get-ArchLfs {
    switch (Get-ArchName) {
        'arm64'  { return 'arm64' }
        '32-bit' { return '386' }
        default  { return 'amd64' }
    }
}

# ---------------- портативный git ----------------

function Test-GitUsable([string]$exe) {
    if (-not (Test-Path -LiteralPath $exe)) { return $false }
    $exeDir = Split-Path -Parent $exe
    $env:PATH = $exeDir + ';' + $env:PATH
    $prev = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        & $exe --version *> $null
        $okVer = ($LASTEXITCODE -eq 0)
        $okLfs = $false
        if ($okVer) { & $exe lfs version *> $null; $okLfs = ($LASTEXITCODE -eq 0) }
    } finally { $ErrorActionPreference = $prev }
    return ($okVer -and $okLfs)
}

function Install-PortableGit([string]$dir) {
    Write-Head 'Портативный git не найден — скачиваю MinGit и git-lfs...'
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
    $gitRoot = Join-Path $dir 'git'
    $tmp = Join-Path $env:TEMP ('tech-repo-tools-' + [Guid]::NewGuid().ToString('N').Substring(0, 6))
    New-Item -ItemType Directory -Path $tmp -Force | Out-Null
    try {
        $arch = Get-ArchName
        $rel = Get-Json 'https://api.github.com/repos/git-for-windows/git/releases/latest'
        $url = $null
        foreach ($a in @($rel.assets)) {
            if ($a.name -match ('^MinGit-[0-9.]+-' + [regex]::Escape($arch) + '\.zip$')) { $url = $a.browser_download_url; break }
        }
        if (-not $url) { throw "в релизе git-for-windows нет MinGit для архитектуры $arch" }
        Write-Host ("  MinGit {0}" -f (Split-Path $url -Leaf))
        $zip = Join-Path $tmp 'mingit.zip'
        Save-Url $url $zip
        if (Test-Path -LiteralPath $gitRoot) { Remove-Item -LiteralPath $gitRoot -Recurse -Force }
        Expand-Zip $zip $gitRoot

        $archLfs = Get-ArchLfs
        $relL = Get-Json 'https://api.github.com/repos/git-lfs/git-lfs/releases/latest'
        $urlL = $null
        foreach ($a in @($relL.assets)) {
            if ($a.name -match ('^git-lfs-windows-' + [regex]::Escape($archLfs) + '-v[0-9.]+\.zip$')) { $urlL = $a.browser_download_url; break }
        }
        if (-not $urlL) { throw "в релизе git-lfs нет сборки для архитектуры $archLfs" }
        Write-Host ("  git-lfs {0}" -f (Split-Path $urlL -Leaf))
        $zipL = Join-Path $tmp 'lfs.zip'
        Save-Url $urlL $zipL
        $lfsDir = Join-Path $tmp 'lfs'
        Expand-Zip $zipL $lfsDir
        $found = Get-ChildItem -LiteralPath $lfsDir -Recurse -Filter 'git-lfs.exe' | Select-Object -First 1
        if (-not $found) { throw 'git-lfs.exe не найден в архиве' }
        Copy-Item -LiteralPath $found.FullName -Destination (Join-Path $gitRoot 'cmd\git-lfs.exe') -Force
    } finally {
        Remove-Item -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue
    }
    return (Join-Path $gitRoot 'cmd\git.exe')
}

function Resolve-Git {
    $localGit = Join-Path $toolsDir 'git\cmd\git.exe'
    if (Test-GitUsable $localGit) { return @{ Exe = $localGit; Portable = $true } }
    if (-not $portableOnly) {
        $sys = Get-Command git.exe -ErrorAction SilentlyContinue
        if ($sys -and (Test-GitUsable $sys.Source)) { return @{ Exe = $sys.Source; Portable = $false } }
    }
    $fresh = Install-PortableGit $toolsDir
    if (Test-GitUsable $fresh) { return @{ Exe = $fresh; Portable = $true } }
    return $null
}

# ---------------- синхронизация через git ----------------

function Invoke-Git([string]$git, [string[]]$gitArgs) {
    $prev = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $out = & $git -C $root @gitArgs 2>&1
        $code = $LASTEXITCODE
    } finally { $ErrorActionPreference = $prev }
    $text = (@($out) | ForEach-Object { [string]$_ }) -join "`n"
    return @{ Code = $code; Out = $text.Trim() }
}

function Invoke-GitSync([string]$git) {
    Write-Head ("Синхронизация через git: {0}" -f (Invoke-Git $git @('--version')).Out)

    $top = Invoke-Git $git @('rev-parse', '--show-toplevel')
    $topPath = ''
    if ($top.Code -eq 0) {
        $topPath = [IO.Path]::GetFullPath($top.Out.Trim().Replace('/', '')).TrimEnd('')
    }
    $ownGit = Test-Path -LiteralPath (Join-Path $root '.git')
    $isRepo = $ownGit -or (($top.Code -eq 0) -and [string]::Equals($topPath, $root, [StringComparison]::OrdinalIgnoreCase))
    if (-not $isRepo -and $topPath) {
        Write-Host ("  папка вложена в другой git-репозиторий ({0}) — работаю с отдельным" -f $topPath) -ForegroundColor DarkGray
    }
    if (-not $isRepo) {
        Write-Host '  папка ещё не git-репозиторий — инициализирую'
        if ((Invoke-Git $git @('init', '-b', $Branch)).Code -ne 0) { throw 'git init не удался' }
        if ((Invoke-Git $git @('remote', 'add', 'origin', $remoteUrl)).Code -ne 0) { throw 'не удалось добавить remote' }
        if ((Invoke-Git $git @('fetch', 'origin', $Branch)).Code -ne 0) { throw 'git fetch не удался' }
        $co = Invoke-Git $git @('checkout', '-f', '-B', $Branch, "origin/$Branch")
        if ($co.Code -ne 0) { throw ("git checkout не удался: {0}" -f $co.Out) }
    } else {
        $remote = Invoke-Git $git @('remote', 'get-url', 'origin')
        if ($remote.Code -ne 0 -or -not $remote.Out) {
            Invoke-Git $git @('remote', 'add', 'origin', $remoteUrl) | Out-Null
        }
    }

    Invoke-Git $git @('config', 'core.autocrlf', 'false') | Out-Null
    Invoke-Git $git @('config', 'core.longpaths', 'true') | Out-Null
    Invoke-Git $git @('lfs', 'install', '--local') | Out-Null

    if ($force) {
        Write-Host '  --force: локальные правки отбрасываются'
        Invoke-Git $git @('fetch', 'origin', $Branch) | Out-Null
        $r = Invoke-Git $git @('reset', '--hard', "origin/$Branch")
        if ($r.Code -ne 0) { throw ("git reset --hard не удался: {0}" -f $r.Out) }
    } else {
        $p = Invoke-Git $git @('pull', '--rebase', '--autostash', 'origin', $Branch)
        if ($p.Code -ne 0) {
            Write-Host $p.Out -ForegroundColor DarkGray
            Invoke-Git $git @('rebase', '--abort') | Out-Null
            throw 'не удалось обновить: локальные правки конфликтуют с репозиторием. Запустите с --force или сначала отправьте изменения priesttech-push.bat'
        }
    }

    $lp = Invoke-Git $git @('lfs', 'pull')
    if ($lp.Code -ne 0) { Write-Host '  предупреждение: git lfs pull завершился с ошибкой' -ForegroundColor Yellow }

    $tracked = (Invoke-Git $git @('lfs', 'ls-files', '--name-only'))
    $bad = 0
    foreach ($f in ($tracked.Out -split "`r?`n" | Where-Object { $_ })) {
        $p = Join-Path $root ($f -replace '/', '\')
        if (-not (Test-Path -LiteralPath $p)) { continue }
        $fi = Get-Item -LiteralPath $p
        if ($fi.Length -lt 300) {
            $head = [IO.File]::ReadAllText($p)
            if ($head -like 'version https://git-lfs.github.com/spec*') { $bad++; Write-Host ("  указатель вместо файла: {0}" -f $f) -ForegroundColor Yellow }
        }
    }
    if ($bad -gt 0) { throw ("файлов LFS не скачано: {0}. Проверьте квоту Git LFS или наличие git-lfs" -f $bad) }

    $short = (Invoke-Git $git @('rev-parse', '--short', 'HEAD')).Out
    Write-Host ("  версия репозитория: {0}" -f $short) -ForegroundColor Green
    return $true
}

# ---------------- резервная синхронизация по HTTP ----------------

function Get-LfsPointer([string]$path) {
    $fs = [IO.File]::OpenRead($path)
    try { $buf = New-Object byte[] 300; $n = $fs.Read($buf, 0, $buf.Length) } finally { $fs.Dispose() }
    $txt = [Text.Encoding]::ASCII.GetString($buf, 0, $n)
    if ($txt -notlike 'version https://git-lfs.github.com/spec*') { return $null }
    $oid = $null; $size = [int64]0
    if ($txt -match 'oid sha256:([0-9a-f]{64})') { $oid = $Matches[1] }
    if ($txt -match 'size (\d+)') { $size = [int64]$Matches[1] }
    if (-not $oid) { return $null }
    return [pscustomobject]@{ Oid = $oid; Size = $size }
}

function Invoke-HttpSync {
    Write-Head 'Синхронизация по HTTP (git не используется)'
    $metaFiles = @('.gitignore', '.gitattributes', 'priesttech-sync.bat', 'priesttech-push.bat')
    $stateDir  = Join-Path $root '.repo-sync'
    $manifest  = Join-Path $stateDir 'installed.txt'

    $tmp = Join-Path $env:TEMP ('tech-repo-http-' + [Guid]::NewGuid().ToString('N').Substring(0, 8))
    New-Item -ItemType Directory -Path $tmp -Force | Out-Null
    $added = 0; $updated = 0; $same = 0; $removed = 0; $bytes = [int64]0
    $errors = @()

    try {
        Write-Host 'Загружаю список файлов репозитория...' -NoNewline
        $zip = Join-Path $tmp 'repo.zip'
        Save-Url "https://codeload.github.com/$Owner/$Repo/zip/refs/heads/$Branch" $zip
        Write-Host ' готово' -ForegroundColor Green

        $unpack = Join-Path $tmp 'unpack'
        Expand-Zip $zip $unpack
        $srcDir = Get-ChildItem -LiteralPath $unpack -Directory | Select-Object -First 1
        if (-not $srcDir) { throw 'не удалось распаковать архив репозитория' }

        $entries = @()
        Get-ChildItem -LiteralPath $srcDir.FullName -Recurse -File | ForEach-Object {
            $rel = $_.FullName.Substring($srcDir.FullName.Length + 1).Replace('\', '/')
            if ($metaFiles -notcontains $rel) { $entries += [pscustomobject]@{ Rel = $rel; Src = $_.FullName } }
        }
        $entries = $entries | Sort-Object Rel
        Write-Host ("Файлов в репозитории: {0}" -f $entries.Count)

        $current = New-Object 'System.Collections.Generic.List[string]'
        $dlTmp = Join-Path $tmp 'download.bin'

        foreach ($e in $entries) {
            $rel = $e.Rel
            $current.Add($rel)
            $dest = Join-Path $root ($rel.Replace('/', '\'))
            $destDir = Split-Path -Parent $dest
            $pointer = Get-LfsPointer $e.Src
            $needDownload = $false; $expectHash = $null; $expectSize = [int64]0

            if ($pointer) {
                $expectHash = $pointer.Oid; $expectSize = $pointer.Size
                if (Test-Path -LiteralPath $dest) {
                    $fi = Get-Item -LiteralPath $dest
                    if ($fi.Length -eq $expectSize -and (Get-Sha256 $dest) -eq $expectHash) { $same++; continue }
                }
                $needDownload = $true
            } elseif (Test-Path -LiteralPath $dest) {
                $fi = Get-Item -LiteralPath $dest
                $srcInfo = Get-Item -LiteralPath $e.Src
                if ($fi.Length -eq $srcInfo.Length -and (Get-Sha256 $dest) -eq (Get-Sha256 $e.Src)) { $same++; continue }
            }

            $isNew = -not (Test-Path -LiteralPath $dest)
            if ($dry) {
                Write-Host ("  [dry] {0} {1}" -f $(if ($isNew) { 'добавить ' } else { 'обновить ' }), $rel) -ForegroundColor DarkGray
                continue
            }

            try {
                if (-not (Test-Path -LiteralPath $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
                if ($needDownload) {
                    $url = "https://media.githubusercontent.com/media/$Owner/$Repo/$Branch/" + (($rel -split '/' | ForEach-Object { [Uri]::EscapeDataString($_) }) -join '/')
                    Write-Host ("  загрузка  {0} ({1} МБ)" -f $rel, [math]::Round($expectSize / 1MB, 1)) -ForegroundColor DarkCyan
                    if (Test-Path -LiteralPath $dlTmp) { Remove-Item -LiteralPath $dlTmp -Force }
                    Save-Url $url $dlTmp
                    $got = Get-Item -LiteralPath $dlTmp
                    if ($got.Length -ne $expectSize) { throw ("размер не совпал: {0} != {1}" -f $got.Length, $expectSize) }
                    if ((Get-Sha256 $dlTmp) -ne $expectHash) { throw 'SHA256 не совпал с указателем LFS' }
                    Copy-Item -LiteralPath $dlTmp -Destination $dest -Force
                    $bytes += $expectSize
                } else {
                    Copy-Item -LiteralPath $e.Src -Destination $dest -Force
                    $bytes += (Get-Item -LiteralPath $e.Src).Length
                }
                if ($isNew) { $added++; Write-Host ("  + {0}" -f $rel) -ForegroundColor Green }
                else { $updated++; Write-Host ("  ~ {0}" -f $rel) -ForegroundColor Yellow }
            } catch {
                $errors += ("{0}: {1}" -f $rel, $_.Exception.Message)
            }
        }

        if ((Test-Path -LiteralPath $manifest) -and -not $force) {
            foreach ($p in (Get-Content -LiteralPath $manifest)) {
                $p = $p.Trim()
                if (-not $p -or $current.Contains($p)) { continue }
                $dest = Join-Path $root ($p.Replace('/', '\'))
                if (-not (Test-Path -LiteralPath $dest)) { continue }
                $full = [IO.Path]::GetFullPath($dest)
                if (-not $full.StartsWith($root + '\', [StringComparison]::OrdinalIgnoreCase)) { continue }
                if ($dry) { Write-Host ("  [dry] удалить {0}" -f $p) -ForegroundColor DarkGray; continue }
                Remove-Item -LiteralPath $full -Force
                $removed++
                Write-Host ("  - {0}" -f $p) -ForegroundColor Magenta
            }
        }

        if (-not $dry) {
            if (-not (Test-Path -LiteralPath $stateDir)) { New-Item -ItemType Directory -Path $stateDir -Force | Out-Null }
            Set-Content -LiteralPath $manifest -Value ($current | Sort-Object)
        }

        Write-Host ""
        Write-Host ("Итог: добавлено {0}, обновлено {1}, удалено {2}, без изменений {3}" -f $added, $updated, $removed, $same)
        if ($bytes -gt 0) { Write-Host ("Загружено: {0:N1} МБ" -f ($bytes / 1MB)) }
        if ($errors.Count -gt 0) {
            Write-Host ""
            Write-Host 'Ошибки:' -ForegroundColor Red
            $errors | ForEach-Object { Write-Host ("  {0}" -f $_) -ForegroundColor Red }
            throw ("не удалось синхронизировать файлов: {0}" -f $errors.Count)
        }
    } finally {
        Remove-Item -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue
    }
}

# ---------------- main ----------------

$curl = $null
$curlCmd = Get-Command curl.exe -ErrorAction SilentlyContinue
if ($curlCmd) { $curl = $curlCmd.Source }
$script:curl = $curl
$env:GIT_TERMINAL_PROMPT = '0' 

Write-Host ""
Write-Host "tech-repo-sync  ->  $root" -ForegroundColor Cyan

if (Get-Process -Name 'REPO' -ErrorAction SilentlyContinue) {
    Write-Host "R.E.P.O. уже запущена. Закройте игру и запустите обновление снова." -ForegroundColor Yellow
    exit 3
}

$gitInfo = $null
if (-not $httpOnly) {
    try { $gitInfo = Resolve-Git } catch { $gitInfo = $null; Write-Host ("git недоступен: {0}" -f $_.Exception.Message) -ForegroundColor Yellow }
}
if ($gitInfo -and $gitInfo.Portable) { Write-Host "git: портативный (.tools\git)" -ForegroundColor DarkGray }
elseif ($gitInfo) { Write-Host "git: системный" -ForegroundColor DarkGray }

try {
    if ($gitInfo) {
        Invoke-GitSync $gitInfo.Exe | Out-Null
    } else {
        Write-Host 'Портативный git поднять не удалось — работаю без git (HTTP).' -ForegroundColor Yellow
        Invoke-HttpSync
    }
} catch {
    Write-Host ""
    Write-Host ("Ошибка синхронизации: {0}" -f $_.Exception.Message) -ForegroundColor Red
    exit 1
}

if (-not $launch) {
    Write-Host "Готово." -ForegroundColor Green
    exit 0
}

Write-Host ""
Write-Host "Запускаю R.E.P.O. через Steam..." -ForegroundColor Cyan
try {
    Start-Process "steam://rungameid/$SteamAppId"
} catch {
    $exe = Join-Path (Split-Path $root -Parent) 'REPO.exe'
    if (Test-Path -LiteralPath $exe) { Start-Process -FilePath $exe -WorkingDirectory $root }
    else { Write-Host 'Не удалось запустить игру.' -ForegroundColor Red; exit 1 }
}
exit 0
