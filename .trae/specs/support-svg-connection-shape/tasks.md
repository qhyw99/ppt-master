# Tasks
- [x] Task 1: 准备测试数据: 在 `projects/test_cxnsp_ppt169_20260701/svg_output/` 下创建新的复杂 SVG 测试用例。
  - [x] SubTask 1.1: 补充 `data-cxn-start-target` 等自定义属性到连线中。
  - [x] SubTask 1.2: 确保所有目标图形（`<rect>`、`<g>` 等）都拥有可被引用的 `id` 属性。
- [x] Task 2: 修改转换器逻辑以支持 `<p:cxnSp>`: 更新 `skills/ppt-master/scripts/svg_to_pptx/drawingml_converter.py`。
  - [x] SubTask 2.1: 在形状转换前，先遍历所有节点建立 `SVG ID -> PPT ID` 的映射表。
  - [x] SubTask 2.2: 在解析 `<line>` 和 `<path>` 时，检测 `data-cxn-*` 属性。
  - [x] SubTask 2.3: 根据属性存在与否，切换生成 `<p:cxnSp>` 或 `<p:sp>`。
  - [x] SubTask 2.4: 正确生成 `<a:stCxn>` 和 `<a:endCxn>` 节点绑定目标对象。
- [x] Task 3: 验证导出: 运行导出脚本，生成 PPT。
  - [x] SubTask 3.1: 使用转换脚本处理测试用例。
  - [x] SubTask 3.2: 验证生成的 PPT 文件能够正常打开且连线带有吸附效果。

# Task Dependencies
- [Task 2] depends on [Task 1]
- [Task 3] depends on [Task 2]
