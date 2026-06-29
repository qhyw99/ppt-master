# Request
请绘制 PPT Master 的完整生成流程图（Core Pipeline）。
包含以下核心层级和节点，展示明确的因果与前后置关系：

1. 输入与项目初始化 (Phase 1)
   - 角色：Source Document (源文档 PDF/DOCX/XLSX/URL/Markdown)
   - 动作：转换 (source_to_md 系列脚本) -> 结构化 Markdown
   - 动作：初始化与导入 (project_manager.py init / import-sources) -> 存入 sources/

2. 策略规划阶段 (Phase 2 - Strategist)
   - 动作：按需应用模板 (Brand/Layout/Deck templates)
   - 核心角色：Strategist (策略师) 
   - 动作：八项确认 (Eight Confirmations)，可通过 Confirm UI 交互
   - 产出：design_spec.md (人类可读设计规范) 与 spec_lock.md (机器可读执行契约)

3. 图片获取阶段 (Phase 3 - Image Acquisition, 条件触发)
   - 条件：仅当 spec_lock 包含 ai/web 图片需求时触发
   - 动作：AI 图片生成 (image_gen.py) / 网络搜索 (image_search.py)
   - 产出：图片存入 images/，并生成 image_analysis.csv

4. 执行与构建阶段 (Phase 4 - Executor)
   - 核心角色：Executor (执行师)
   - 动作：逐页读取 spec_lock.md，连续生成所有 SVG 页面 -> svg_output/
   - 并行支持：Live Preview (实时预览 svg_editor/server.py)
   - 强制质量门：Quality Check (svg_quality_checker.py) -> 错误需打回重写
   - 动作：生成完整讲稿 (notes/total.md)

5. 后处理与导出阶段 (Phase 5 - Post-processing & Export)
   - 动作：拆分讲稿 (total_md_split.py)
   - 动作：SVG 后处理 (finalize_svg.py) -> 处理图标嵌入、文本压平、裁剪等
   - 动作：导出 PPTX (svg_to_pptx.py)
   - 最终产出：Native PPTX 文件 (原生可编辑形状) 与 SVG 快照版 PPTX

要求：以系统架构和流程图的形式展示，用不同的颜色或分组区分各个 Phase（如 Phase 1~5），体现单向的严格流水线（Strict Serial Pipeline）特性，并清晰标明阻塞点（如 Confirm UI、Quality Check）和核心产物（spec_lock.md, Native PPTX）。

# CW
```cw
```
