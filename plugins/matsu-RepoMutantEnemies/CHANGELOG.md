# 2.0.5

- Made the Headgrab mutant's (Necromancer) fake player AI smarter. Disguises now explore rooms on their own, look around, open closed doors, and handle valuables and obstacles more naturally instead of standing idle behind a player.

## 日本語

- ヘッドグラバー変異体（ネクロマンサー）の偽プレイヤーAIを賢くしました。プレイヤーの後ろで棒立ちせず、自分で部屋を見回って探索したり、閉まったドアを開けたり、貴重品や障害物をより自然に扱うようになりました。

## 2.0.4

- Fixed Fenrir leaving no ice on real level floors. It measured its footing 0.4 m above the floor, so the trail never started.
- Abductor no longer pulls a player's camera or plays its "spotted" shriek through walls. A sound heard through cover starts a quiet approach. The camera pull still applies once Abductor can see you.
- Abductor no longer gives up partway through long carries. Its clearance check treated walls and door frames it was already brushing, and the held player's own body, as obstacles ahead, so it braked to a stop and let go.
- Necromancer disguises now finish loading valuables into the cart. They used to get stuck holding one. Their own Necromancer's body, the item in their hands, or the cart handle could pin them in place, and items let go while still swinging could miss the basket. Disguises now pass through their Necromancer and the item they carry. They lift the item in from where they stop and let go once it is still over the basket. They drop it after 15 seconds if it still won't go in.

## 日本語

- フェンリルが実際のステージで氷を残さない不具合を修正。足元を床より0.4m上で判定していたため、氷が出ていませんでした。
- アブダクターが壁越しに視点を引き寄せたり、発見の叫び声を上げたりしないようにしました。壁の向こうの物音には静かに近づきます。姿が見えたときの視点の引き寄せは従来どおりです。
- アブダクターが長い距離を運ぶ途中で手放してしまう不具合を修正。すでに触れている壁や扉の枠、運んでいるプレイヤー自身を前方の障害物と判定して止まっていました。
- ネクロマンサーの偽者が、貴重品を持ったままカートに入れられず止まってしまう不具合を修正。自分のネクロマンサーの体、手に持った品物、カートの持ち手に引っかかって動けなくなったり、揺れている品物を手放してカゴの外に落としたりしていました。偽者は自分のネクロマンサーと運んでいる品物をすり抜け、止まった位置から持ち上げて入れ、品物がカゴの上で止まってから手放すようにしました。15秒入れられなければ手放します。

## 2.0.3

- Normal mutation chance now starts at 5% on level 1 and rises by 5 percentage points per displayed level, up to 50%. `ChancePerLevel` defaults to 0.05 and `MaxChance` defaults to 0.5.
- Every fifth level gives guaranteed rolls by default. The six-body limit and disabled-mutant list also apply on surge levels.

## 日本語

- 通常の変異率はレベル1で5%、表示レベルごとに5ポイント上がり、最大50%になります。`ChancePerLevel` の初期値は0.05、`MaxChance` は0.5です。
- 初期設定では5の倍数のレベルは確定抽選です。確定抽選でも1フロア6体の上限と除外設定が適用されます。

## 2.0.2

- Added Quackback, an Apex Predator mutant with quack shockwaves and an alarm that draws enemies to a followed player's last sprint spot. Quack shockwave idea by FaltineLord.
- Added Fusebell, a Bella mutant with its own pursuit AI, directional timed charges, bell-triggered ignition, and a ram after the chain finishes. Walls and gaps cut off the marked blast lanes.
- Added Statues, a Shadow Child that knocks three times near your route. After it turns, a single tendril catches the most mobile visible target. You can brake the cart, break sight or throw a decoy.
- Added Switchblade. The Chef hooks one of its own cleavers into nearby scenery and swings around it with the other. Pushing the open door it grabbed redirects the slash. A wall collision stuns the Chef for 2.1 seconds.
- Power Leech drains within 5m by default and shares a 10-point-per-second budget across one player's tools. Orange warnings mark its locked shock path 1.7 seconds ahead of time. Shocks deal 25 HP within 9m and require a warning on the target's client.
- Boomday Boy warns before throws and throws at least four seconds apart. Contact balloons deal 32 damage. Death balloons warn for 1.25 seconds, then detonate in sequence. Eight death grenades keep their directions and detonate in four waves.
- Walls block Boomday explosions, and each player gets a short recovery window between damage from its blasts.
- Updated the config to list current settings. Renamed `Redline` and `MeltdownCrew` to `Ronin` and `BlastCrew`, and removed retired options.
- Increased the default normal mutation chance by 25%. It rises by 3.125 percentage points per displayed level, capped at 31.25%.

## 日本語

- アヒルの変異体「鳴き返し」を追加。鳴き声で衝撃波を放ち、追従相手がダッシュすると予告後にその地点へ敵を呼びます。鳴き声と衝撃波の原案はFaltineLordさんです。
- ベラの変異体「導火鈴」を追加。専用AIで進路に時限式の爆弾を置き、ベルで起爆を早め、誘爆後に突進します。十字型の爆風は壁や床の途切れで止まります。
- シャドウチャイルドの変異体「だるまさん」を追加。通り道の壁を3回ノックして振り返り、最も動いた相手を触手で捕まえます。カートの惰性を止める、遮蔽物に隠れる、物を投げて誘うといった対処ができます。
- カエルシェフの変異体「返し刃」を追加。柱や開いた扉に片方の包丁を刺し、金属音の0.7秒後に反対の刃で斬り返します。扉を押して軌道を変え、壁にぶつけると2.1秒スタンします。
- パワーリーチの吸電は標準5m、電池を複数持っていても1人あたり毎秒10ポイント。橙色の射線と予告が出た1.7秒後に電撃を放ちます。射程9m、ダメージ25。対象の画面に予告が届いた場合に当たります。
- 爆誕ボーイは予告してから投げ、投擲間隔は最短4秒。接触風船は32ダメージ。討伐後は1.25秒の予告から順に風船が爆発し、8個のグレネードは4回に分かれて爆発します。
- 爆誕ボーイの爆風は壁で遮れます。被弾直後の短い間は、同種の爆発ダメージの重複を抑えます。
- 廃止済みの設定項目を整理し、`Redline` と `MeltdownCrew` を現行名の `Ronin` と `BlastCrew` に変更しました。
- 通常レベルの変異率を1.25倍にしました。初期値は表示レベル×3.125%、上限31.25%です。

## 2.0.1

- Natural spawns and the House Edge wheel now use the 22 mutants rebuilt or updated in 2.0.
- Removed Poltergeist, Alpha, Belladonna, Flambé, Resonance, Contagion, Chatterjaw, and Parallax from both pools.
- Disabled Wesley's Enemies integration and its six roulette slots.

## 日本語

- 通常出現とハウスエッジのルーレットを、2.0で作り直した・改修した22種類に統一。
- ポルターガイスト、アルファ、ベラドンナ、フランベ、レゾナンス、コンテイジョン、チャタージョー、パララックスを出現対象から除外。
- Wesley’s Enemies連携と追加の6枠を無効化。

## 2.0.0

- Rebuilt 19 mutants, including Silkweaver, Ringmaster, Threadwraith, and the solo Big Bang raid boss. Kept a 30-variant built-in roster and six optional Wesley variants.
- Updated attack AI, windups, models, and sounds. Added visual effects for each mutant orb and standardized ordinary mutant health and orb prices at 1.5× the native values.
- Added English and Japanese display support, startup build identification, and lobby logging for player builds. Reused identical room settings to reduce per-frame allocations.
- Added an idea form for new mutants. It is separate from the bug and feedback form, and both are linked near the top of the README.
- Silkweaver's head cocoons stay wrapped until broken. Its floor webs remain after it dies.
- Back up the previous Mutant Enemies configuration and restore defaults on the first launch after an update.

### 日本語

- 19種類を作り直し、攻撃AI・予告・見た目・音を更新。通常30種類とWesley向けの追加6種類を収録。
- 変異体固有のオーブ演出、日本語表示、起動ログでのビルド照合を追加。毎フレームの同期設定の割り当てを削減。
- 繭織りの頭の繭は破壊するまで継続。クモの巣は討伐後も残る。
- 変異体案の専用フォームをREADMEへ追加。更新時は旧設定をバックアップしてから初期化する。
