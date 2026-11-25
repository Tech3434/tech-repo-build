# ShopItem Trash Box MOD / 商店物品垃圾桶模组

## Introduction / 简介
A trash box that can destroy excess shop items and recover part of their value.
一个可以销毁多余商店物品并返还部分价值的垃圾桶。

## Description / 说明

### 1. Basic Function / 基本功能
- A trash box will automatically spawn in the truck after the run starts.
- 游戏开局后，一个垃圾桶会自动在卡车内生成。
- You can put extra ShopItems into it.
- 你可以将多余的商店物品放入其中。
- Items inside the trash box will smoothly scale down to half size instead of changing size instantly.
- 物品进入垃圾桶后会平滑缩小到原本体积的一半，而不是瞬间变大变小。
- After the collect window ends, the trash box will close, process all items together, and then return one money bag.
- 收集窗口结束后，垃圾桶会统一关盖、处理所有物品，并返还一个钱袋。
- The trash box only spawns in normal run levels, not in tutorial, shop, or lobby menu levels.
- 垃圾桶只会在正常关卡生成，不会在教程、商店或大厅菜单关卡生成。

### 2. Money Return Logic / 金钱返还逻辑
- The returned money bag value is based on the value of the ShopItems you destroy.
- 返还的钱袋价值基于你所销毁的商店物品价值。
- However, the calculation is now done **per item**, not by rolling once on the total value.
- 但是，当前版本的计算方式是**按每个物品单独结算**，而不是对总价值只随机一次。
- Each item first reads its own value, then rolls a random recovery ratio, and finally all item results are added together into one final money bag.
- 每个物品会先读取自己的价值，再单独随机一个回收比例，最后把所有物品的结果累加成一个最终钱袋。
- Default config range:
- 默认配置区间：
    - `RecoveryRatioMin = 0.3`
    - `RecoveryRatioMin = 0.3`
    - `RecoveryRatioMax = 0.8`
    - `RecoveryRatioMax = 0.8`
- Example:
- 例如：
    - Item A: `3000 x 0.31`
    - 物品 A：`3000 x 0.31`
    - Item B: `3000 x 0.67`
    - 物品 B：`3000 x 0.67`
    - Item C: `3000 x 0.48`
    - 物品 C：`3000 x 0.48`
    - Final money bag value = sum of all item results
    - 最终钱袋价值 = 所有单件回收结果之和
- The final money bag value is rounded to the nearest hundred and will not be lower than `1000`.
- 最终钱袋价值会按百位取整，并且不会低于 `1000`。

### 3. AssetBundle Loading / 资源包加载说明
- `TrashBox.dll` and the `trashbox` AssetBundle file must be placed in the **same folder** under `BepInEx/plugins`.
- `TrashBox.dll` 和 `trashbox` 资源包文件必须放在 `BepInEx/plugins` 下的**同一个目录**里。
- The folder name does not matter.
- 目录名本身不重要。
- As long as the DLL and AB file exist together in any subfolder under `plugins`, the mod can load correctly.
- 只要 DLL 和 AB 文件同时存在于 `plugins` 下任意同一个子目录，模组就能正确加载。

### 4. Multiplayer Synchronization / 多人同步说明
- Tested and works correctly in single-player.
- 单人模式下测试可正常使用。
- In multiplayer, item destruction and value calculation are executed by the host.
- 多人模式下，物品销毁和回收金额计算由主机执行。
- Lid open/close animations are synchronized through RPC.
- 垃圾桶开盖与关盖动画通过 RPC 同步。
- **Important**: For best results, this MOD should be installed by the **host AND all clients**.
- **重要**：为了获得最佳效果，此模组建议由**主机以及所有客户端**都安装。

### 5. Config / 配置项
- `RecoveryRatioMin`
- `RecoveryRatioMin`
    - Minimum recovery ratio rolled for each item.
    - 每个物品单独结算时使用的最小回收比例。
    - Default: `0.3`
    - 默认值：`0.3`
- `RecoveryRatioMax`
- `RecoveryRatioMax`
    - Maximum recovery ratio rolled for each item.
    - 每个物品单独结算时使用的最大回收比例。
    - Default: `0.8`
    - 默认值：`0.8`
- If both values are set to the same number, every item will use a fixed recovery ratio.
- 如果把两个值设为相同数字，那么每个物品都会按固定比例回收。

## Author / 作者
小海 XiaoHai  
BiliBili: https://space.bilibili.com/2055787437

 ## ChangeLog
 - 1.0 Initial release
 - 1.0 正式版本发布
 
 - 1.1 Added automatic half-scale when items overlap the trash collider; fixed bug causing destroyed items to respawn in later levels
 - 1.1 新增自动体积缩放功能；修复销毁的物品在后面的关卡会重新生成的 BUG

 - 1.2 Fixed the issue where the initial position of the trash box was not synchronized between the host and clients
 - 1.2 修复了主机和客户端之间垃圾桶初始位置不同步的问题

 - 1.3 Updated for latest game API compatibility; improved AssetBundle loading so DLL and AB can be placed in any subfolder under plugins; changed item scaling to smooth transitions; changed recycle logic to roll a random recovery ratio for each item individually and sum all results
 - 1.3 适配最新版本游戏 API；调整 AB 加载逻辑，只要 DLL 和 AB 位于 plugins 下任意同一子目录即可加载；将物品缩放改为平滑过渡；将回收逻辑改为每个物品单独随机回收后再累加
