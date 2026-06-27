# Request
请绘制 PPT Master 的完整生成流水线架构图。
这是一个严格串行的多角色协作工作流，将源文档（如 PDF/DOCX/URL/Markdown）转换为高质量的可编辑 PPTX。

核心角色与阶段：
1. **Source Content Processing (源内容转换)**
   - 输入：PDF, DOCX, XLSX, PPTX, Web URL, Markdown 等。
   - 动作：统一转换为标准 Markdown 结构文本。提取分析 PPTX 的源资产（source_profile.json）。
2. **Project Initialization (项目初始化)**
   - 动作：创建项目结构，导入源文件，并根据可选用户输入载入 Template（Brand, Layout, Deck）。
3. **Strategist Phase (策略师阶段 - 核心决策)**
   - 动作：进行 Eight Confirmations（八项确认：画布、页数、受众、风格、配色、图标、字体、图片策略）。
   - 产出：输出 `design_spec.md` (设计规范) 和 `spec_lock.md` (机器可读执行契约)。
4. **Image Acquisition (图片获取 - 条件触发)**
   - 动作：根据策略，调用 AI 生成图片 (Image_Generator) 或通过 Web 搜索获取图片 (Image_Searcher)。
5. **Executor Phase (执行师阶段 - SVG生成)**
   - 动作：开启 Live Preview（实时预览）。逐页重读 `spec_lock.md` 以防止上下文漂移。
   - 产出：严格连续逐页生成带有绝对坐标的纯前端 SVG 代码，保存至 `svg_output/`。生成 Speaker Notes (演讲讲稿)。
   - 校验：通过 `svg_quality_checker.py` 进行严格的质量检查（0 Error 拦截）。对于图表页面运行 `verify-charts`。
6. **Post-processing & Export (后处理与导出)**
   - 动作 6.1：分离讲稿。
   - 动作 6.2：执行 `finalize_svg.py`，进行多行文本压平、SVG 原生图片裁剪、图标内联展开等优化处理。
   - 动作 6.3：执行 `svg_to_pptx.py`，将后处理过的 SVG 逐元素翻译为 PowerPoint 原生对象（DrawingML）。
   - 产出：高保真、可编辑的原生 `.pptx` 文件。

图表结构要求：
- 从上到下的流水线结构。
- 标明核心产物（如 spec_lock.md, svg_output/, pptx）和对应的阶段。
- 凸显各阶段的关键约束（如 Executor 的逐页重读和质量检查，后处理的文本压平和特性翻译）。
- 保持模块和流程间的因果关系和依赖清晰。

# CW
```cw
```
