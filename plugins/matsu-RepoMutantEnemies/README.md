# R.E.P.O. Mutant Enemies 2.0.5

日本語の説明は英語のあとにあります。

Familiar enemies can spawn as mutants with new attacks, traps, and ways to hunt your crew. Look for their colored auras and pay attention to the windups. A Clown can pull you into a kick, an Animal can leave a web across your escape route, and the teammate helping with the cart might be a decoy.

**2.0.5 makes the Headgrab mutant's (Necromancer) fake player AI smarter so disguises explore rooms, open doors, and carry loot more naturally.** Since 2.0.3, the default mutation chance starts at 5% on level 1 and gains 5 percentage points per displayed level, up to 50%. The 2.0 overhaul features 26 mutants, including Quackback, Fusebell, Statues and Switchblade. The original 1.x versions of the retired mutants are excluded from natural spawns and the House Edge wheel. Wesley's Enemies integration is unavailable.

## Send me a mutant idea

I'm looking for ideas for the next mutants. Pick a base enemy and tell me what you want it to do. A one-line idea is plenty, and you can leave a name for credits if you like. The form opens without an account. **[Submit a mutant idea](https://docs.google.com/forms/d/e/1FAIpQLScYAr475ggIn5U0tJoI60s2wt0xXZdOShS8bCSTTinbksLmlA/viewform)**

If you're reporting a bug or suggesting a change to an existing feature, use the separate feedback form. Include the game version, mod version, affected mutant, and what happened just before the issue if you can. [Bug reports and feedback](https://docs.google.com/forms/d/e/1FAIpQLSfl7f-oNiwjXjd7mUkfQoqBIhbJhQhhfV-ZmovjJVQ9orwuYQ/viewform)

## Mutants in 2.0.3

| Base enemy | Mutant | What to watch for |
| --- | --- | --- |
| Apex Predator (Duck) | **Quackback** | Its quacks send out shockwaves that shove bystanders and attract nearby enemies. The player it follows is protected from the shove. Sprinting while followed charges an alarm at the last sprint spot. Crouch to drain its charge faster. |
| Bella | **Fusebell** | Reads your route, tosses timed charges ahead, and rings its bell to ignite a charge when you approach its blast lanes. The cross-shaped blasts can ignite other charges and shove loose loot and carts. Step out of the marked lanes and watch for a follow-up ram. |
| Shadow Child | **Statues** | Listen for three knocks ahead of your cart. You can move while its back is turned. Once it looks around, its tendril catches whatever moved the most in sight. It can drag a teammate or lift one side of a rolling cart. Toss a cheap piece of loot across its view to draw the grab. |
| Chef | **Switchblade** | Watch which cleaver it reverses as it crouches. It can hook that blade into a pillar, a table edge or an open door along your escape route. The clang gives you 0.7 seconds before the other knife swings in a half-circle for 22 damage. The blade can bat loose loot aside. Push the door to turn the swing away from a teammate or make the Chef hit a wall and fall stunned. Out in the open it uses its usual jump. |
| Animal | **Silkweaver** | Webs slow you, reveal your position, speed up the Animal, and stay after it dies. It spits sticky silk and can pull players in a white cocoon. Cocoons on fallen heads stay wrapped until torn open by a weapon or hard impact. On its own web, it can tear up the web to shorten a stun. |
| Clown | **Ringmaster** | Throws chains that pull targets into a kick or propel the Clown toward a wall. Its full-circle beam pulls targets and sends more chains from wall anchors. Bear traps remain after death, and its final volley still pulls targets. |
| Robe | **Threadwraith** | Leaves breakable dolls along routes and can trade places with them when players linger nearby. Its black doubles move like Robe. Chasing and getting stunned charge a second way to summon a double. |
| Banger | **Big Bang** | A single oversized raid boss with its own moves and a team-size health scale. It makes one last attack before dropping its orb. |
| Gambit | **House Edge** | The roulette uses a different color for each available mutant and summons the selected enemy nearby. Defeating House Edge sets off its interrupt blast. |
| Tick | **Power Leech** | Blue links drain batteries within 5m by default. A wall breaks the connection. An orange line and a 1.7-second warning mark where it will shock. Sidestep or take cover. Its remaining charge drops as a usable crystal. |
| Peeper | **Deathgaze** | Sustained eye contact charges a Clown-style beam. Defeating it drops a Duct Taped Grenade from above. |
| Elsa | **Fenrir** | Freezes the floor as it moves. The ice makes players, enemies, valuables and carts slide, and Fenrir runs faster over it. Traffic and fire can clear it. |
| Pony | **Wrangler** | Launches a volley of Human Adventure Cables that can catch, wrap, and fling players. Break the cables or interrupt Pony to get away. |
| Gnomes | **Hooligan** | Each Gnome uses Rugrat behavior. They pick up valuables ahead of time and throw what they're carrying when they find a target. |
| Oogly | **Abductor** | Hunts by sound as well as sight. It attacks while carrying a player away, sometimes dropping them near another enemy or close to a pit. |
| Heart Hugger | **Heartbreak** | Grows flowers and vines. Its gas can give valuables, carts, and tools wings and pull them in for a bite. Cut the vines to stop affected flowers. |
| Headgrab | **Necromancer** | Fog mutes nearby in-game voice chat and hides decoys that look like your crew. They can help carry loot, then turn on you. They copy appearances and use game sounds. |
| Rugrat | **Railgun** | Uses held objects to guard against incoming attacks. It can throw valuables, gear, and carts along a path that tracks its target early in flight. |
| Loom | **Mirrorbound** | Seals an exit while occupying a room with multiple entrances. The mirror projects a translucent copy that mirrors Loom's movements and can hit players. |
| Hidden | **Hijacker** | Kidnaps and teleports a player, or physically drags a nearby cart away from the extraction point. |
| Huntsman | **Reverb** | Fires visible ricocheting shots that attack along the recorded bounce path a second time. Noise mines call attention to whatever steps on them. |
| Trudge | **Rupture** | Sweeps the ground with shockwaves, can leap into a slam, and uses walls to carry the impact farther. Its attacks can shove loose objects. |
| Birthday Boy | **Boomday Boy** | Sets more balloons and warns before throwing grenades while hostile. Defeating it gives a short warning before the balloon chain and scatters eight grenades on staggered fuses. |
| Cleanup Crew | **Blast Crew** | Throws a volley of explosive heads and produces three heads on defeat. |
| Reaper | **Ronin** | Uses samurai-inspired windups, slash effects, and afterimages. |
| Bowtie | **Singularity** | Uses a gravity field and pulls in nearby players and objects before scattering them in its death burst. |

Quackback's quack shockwaves were suggested by **FaltineLord**.

## Spawns, rewards, and settings

- On normal levels, each eligible enemy or group rolls once at the displayed level times `ChancePerLevel` (default **0.05**), capped at `MaxChance` (default **0.5**). That gives **5% on level 1, 20% on level 4, 45% on level 9, and 50% on level 11**. Hosts can set either value between 0 and 0.5. Every fifth level is a surge with guaranteed rolls. The disabled-mutant list and default limit of **six mutant bodies per level** apply to surge levels too.
- Most mutants start at **1.5×** their base enemy's health. Big Bang scales separately as a raid boss. Dropped mutant orbs sell for **1.5×** their original rolled value and have a visual effect unique to the mutant.
- The lobby host's spawn chance, surge interval, cap, and list of mutants excluded from natural spawns apply to everyone. The configuration file is `BepInEx/config/com.matsu.repomutations.cfg`.
- **Updating backs up the previous Mutant Enemies configuration and restores defaults on the first launch of the new build.** Look in `BepInEx/config/com.matsu.repomutations.backups/` for the previous settings.
- The file contains settings used by the current build, including `PowerLeech`, `Ronin`, and `BlastCrew`. The orb price multiplier is fixed at 1.5×.
- Mutant names and Battery Crystal text follow the in-game English or Japanese language setting.

## Installing and playing together

1. Update `matsu-RepoMutantEnemies` in your R.E.P.O. mod manager profile. The package requires BepInExPack and REPOLib 4.5.1. [REPOLib 4.5.1](https://thunderstore.io/c/repo/p/Zehs/REPOLib/v/4.5.1/)
2. Update every player in the lobby to the same build and launch with **Modded**. For manual installs, put `Matsu.MutantEnemies.dll` in that profile's `BepInEx/plugins` folder and remove any older Mutant Enemies DLL from the profile.
3. To verify a manual install, look for `[Mutation Sync] Ready` in `BepInEx/LogOutput.log`. The host log also reports whether each participant announces the same build.

Release testing covered solo play, one authenticated host in a private room, and server-delivered events exercised with guest authority. A two-PC playtest is still pending.

## 日本語

おなじみのR.E.P.O.の敵が、専用の攻撃・罠・追跡AIを持つ変異体として出現します。変異体は色付きのオーラが目印です。ピエロは鎖で引き寄せて蹴り、アニマルは帰り道にクモの巣を張り、仲間のふりをした偽物がカートのそばに現れます。

**2.0.5ではヘッドグラバー変異体（ネクロマンサー）の偽プレイヤーAIを賢くし、部屋の探索やドアの開閉、貴重品の運搬などをより自然に行うようになりました。** 2.0.3から、通常の変異率はレベル1で5%、表示レベルごとに5ポイント上がり、最大50%です。「鳴き返し」「導火鈴」「だるまさん」「返し刃」を含む全26種類が出現します。未改修の旧変異は通常出現とハウスエッジのルーレットの対象外です。Wesley’s Enemies連携は未対応です。

### 変異体の案を募集中！

「あの敵がこう動いたら面白そう」と思ったら、ぜひ送ってください。**元になる敵と、やってほしいことの2つだけ**で送れます。短い案も歓迎です。クレジット名は任意です。フォームはログインなしで開けます。 **[変異体案を送る](https://docs.google.com/forms/d/e/1FAIpQLScYAr475ggIn5U0tJoI60s2wt0xXZdOShS8bCSTTinbksLmlA/viewform)**

不具合や既存の仕様への要望は、別のフォームで受け付けています。ゲームとMODのバージョン、対象の変異体、直前の状況が分かると調べやすいです。 [不具合・要望フォーム](https://docs.google.com/forms/d/e/1FAIpQLSfl7f-oNiwjXjd7mUkfQoqBIhbJhQhhfV-ZmovjJVQ9orwuYQ/viewform)

### 2.0.3の収録変異体

| 元の敵 | 変異体 | 主な能力 |
| --- | --- | --- |
| アヒル | **鳴き返し** | 鳴き声で近くの敵を呼び、追従相手以外を衝撃波で押し出します。追従中にダッシュすると警戒が溜まり、予告後に最後に走った地点へ敵を呼びます。しゃがむと警戒が早く下がります。 |
| ベラ | **導火鈴** | 専用AIでプレイヤーの先回りを狙い、時限式の爆弾を投げます。爆発の範囲に入りそうな相手を見つけると、ベルで起爆を早めます。十字の予告から外れ、誘爆とその後の突進に注意してください。爆風は置いてある貴重品やカートを押し出します。 |
| シャドウチャイルド | **だるまさん** | カートの進路の先で壁を3回ノックします。背を向けている間は動けます。振り返った瞬間、視界でいちばん動いたものに触手を伸ばし、人なら引き寄せ、転がるカートなら片側の縁を持ち上げます。安い貴重品を目の前に投げると、おとりにできます。 |
| カエルシェフ | **返し刃** | 構えたとき、片方の包丁を逆手に持ちます。逃げ道にある柱やテーブルの縁、開いた扉にその刃を引っ掛けると、金属音から0.7秒後、もう片方で半円を描いて斬り返します。命中すると22ダメージで、刃に当たった小物も弾かれます。刺さった扉を押せば仲間から刃をそらせます。壁にぶつけるとシェフが転んでスタンします。支点がない広間では本編と同じ跳びかかりを使います。 |
| アニマル | **繭織り** | 地面に巣を張り、踏んだプレイヤーを減速させて位置を察知します。糸弾や白い繭で拘束し、倒れた仲間の頭も包みます。頭の繭は時間でほどけず、武器や強い衝撃で裂けます。巣は討伐後も残り、繭織りが巣の上でスタンした場合は巣を引き裂いて早く復帰します。 |
| ピエロ | **座長** | 鎖で引き寄せて蹴り、壁へ鎖を投げて高速移動します。360°ビームと壁からの追撃、討伐後も残るトラバサミに加え、最期のビーム乱射にも引き寄せ効果があります。 |
| ローブ | **影縫い** | 通路などに壊せる人形を置き、近くに留まった相手を人形との位置交換で襲います。追跡やスタンで溜まった力で黒い分身も出します。 |
| ドクロ | **ビッグバン** | 専用AIと複数の攻撃を持つ巨大な単体レイドボスです。討伐時は最後のあがきのあとにオーブを落とします。 |
| ギャンビット | **ハウスエッジ** | 色で分かれたルーレットで、出目に対応する変異体を召喚します。討伐時は中断時と同じ爆発が起きます。 |
| ダニ | **パワーリーチ** | 青い糸で標準5m以内の電池を吸電します。壁で遮れます。橙色の線と予告が出たら電撃まで1.7秒。横へ外れるか、壁の裏に隠れてください。残った電力は充電に使える結晶になります。 |
| のぞき魔 | **デスゲイズ** | 視線を受け続けると目からビームを放ち、倒されると天井側からダクトテープ付きグレネードを落とします。 |
| エルサ | **フェンリル** | 通った床を凍らせます。プレイヤー・敵・貴重品・カートが滑り、フェンリルは氷の上で加速します。 |
| ポニー | **ラングラー** | 複数のヒューマンアドベンチャーケーブルを放ち、捕まえたプレイヤーを巻き付けて投げ飛ばします。 |
| ノーム | **フーリガン** | 各個体が赤ん坊のように動きます。先に貴重品を拾って持ち歩き、相手を見つけたら投げます。 |
| ウーグリー | **アブダクター** | 音にも反応し、つかんだ相手を攻撃しながら、敵の近くや奈落のそばなどに運びます。 |
| ハートハガー | **ハートブレイク** | ツタと花を育てます。ガスで貴重品・カート・道具にも羽が付いて引き寄せられ、噛みつきの対象になります。 |
| ヘッドグラブ | **ネクロマンサー** | 霧でゲーム内ボイスが遮られ、仲間の姿をした偽物が運搬を手伝うふりをします。 |
| 赤ん坊 | **レールガン** | 持った物で攻撃を防ぎ、貴重品・装備・カートを投げます。投げた物は飛行の途中まで相手を追います。 |
| ルーム | **ミラーバウンド** | 複数の入口がある部屋の出口を鏡で封鎖し、鏡越しに本体と連動する半透明の幻影が攻撃します。 |
| 透明人間 | **ハイジャッカー** | プレイヤーを誘拐して転移させたり、近くのカートを納品所から離れた場所へ物理的に運び去ったりします。 |
| 狩人 | **リバーブ** | 弾が壁や物で跳ね返り、記録した反射経路を通って再攻撃します。通った場所には音響地雷も置きます。 |
| トラッジ | **ラプチャー** | 前方へ衝撃波を放ち、跳躍して叩きつけます。壁へ伝わった衝撃波も運搬物やプレイヤーを押し出します。 |
| バースデーボーイ | **爆誕ボーイ** | 爆発する風船を張り、戦闘中は予告を出してグレネードを投げます。討伐時は予告のあとに風船が順に爆発し、8方向に飛んだグレネードも時間差で爆発します。 |
| 清掃員 | **爆裂清掃員** | 爆発する頭をまとめて投げ、倒すと頭が3つ出ます。 |
| カカシ | **浪人** | 居合風の予告、斬撃、残像を使います。 |
| 蝶ネクタイ | **特異点** | 重力場で引き寄せます。討伐時は周囲のプレイヤーや物を吸い寄せてから一気に弾き飛ばします。 |

鳴き返しの鳴き声と衝撃波の原案は **FaltineLord** さんです。

### 出現ルール・設定・導入

- 通常レベルでは、対象の敵・群れごとに「表示レベル × `ChancePerLevel`」で抽選し、`MaxChance` が上限になります。初期値はそれぞれ **0.05** と **0.5**。**レベル1で5%、4で20%、9で45%、11で50%** です。ホストは両方とも0～0.5の範囲で設定できます。5の倍数のレベルは確定抽選で、除外設定と**1フロア6体まで**の初期上限が適用されます。
- 通常の変異体は本編の敵の1.5倍の体力を持ちます。変異オーブの価格は元値の1.5倍で、変異体ごとに異なる見た目です。ビッグバンの体力は生存人数で決まります。
- 全員が同じビルドを使用してください。出現率・上限・通常出現から除外する変異体はホストの設定が反映されます。`BepInEx/config/com.matsu.repomutations.cfg` で編集できます。
- 更新後の初回起動時に、以前のMUTANT ENEMIES設定を `BepInEx/config/com.matsu.repomutations.backups/` に保存してから初期値へ戻します。
- 設定ファイルには現行版で使う項目が並びます。`PowerLeech`、`Ronin`、`BlastCrew` などを調整できます。オーブ価格は1.5倍固定です。
- 手動で導入するときはBepInExとREPOLibを入れ、使うプロファイルの `BepInEx/plugins` に `Matsu.MutantEnemies.dll` を1本置いて **Modded** で起動します。起動ログの `[Mutation Sync] Ready` で読み込みを確認できます。

ソロとホスト1人の非公開ルームで動作を検証し、サーバー経由のイベントを参加側の権限でも確認しています。別PC同士でのプレイは未確認です。
