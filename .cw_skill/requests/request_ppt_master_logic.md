# Request
请绘制 PPT Master 中 Executor 生成每一页 SVG 时，三种软约束（Mode & Visual Style、Page Layouts & Charts、Page Rhythm）是如何融汇生效的架构逻辑图。

核心逻辑与结构：
1. **输入源**：`spec_lock.md`（执行锁），包含三层约束定义。
2. **第一层滤镜（全局设定）**：`Mode & Visual Style`（模式与视觉风格）。
   - 特性：必有属性，全文件统一（如 swiss-minimal）。
   - 机制：Agent Prompt 上下文注入（软约束）。
   - 作用：决定全局建筑规范和外立面材质（美学基调）。
3. **第二层滤镜（单页骨架）**：`Page Layouts & Charts`（模板继承）。
   - 特性：非必有属性，部分页面特权。
   - 机制：读取模板文件进行物理克隆（硬约束）；若无则进入 Free Design 模式。
   - 作用：提供预制承重墙模块（坐标与物理骨架）。
4. **第三层滤镜（单页填肉）**：`Page Rhythm`（页面节奏）。
   - 特性：必有属性，单页各异（dense / breathing / anchor）。
   - 机制：Agent 排版行为指令（软约束）。
   - 作用：决定房间的软装密度与留白规则。
5. **执行引擎**：`Executor`（执行者 Agent）。
   - 动作：接收上述三重滤镜，执行“宏观基调 → 单页骨架 → 单页细节”的降维渲染。
6. **最终产出**：`SVG Page`（单页幻灯片）。

请通过清晰的有向图展示这三层滤镜如何按顺序作用于 Executor，最终输出完美统一的 SVG 页面。要求关系显式化，同构可读。

# CW
```cw
```
