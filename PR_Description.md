此次合并的核心目的是在 SVG 到 PPTX 的转换过程中添加对原生连接线（Connector）的支持。通过在转换上下文中映射形状 ID，并解析 `data-cxn-*` 属性生成 `<p:cxnSp>` 元素，从而保留了图形间的连接语义信息。

| 文件 | 变更 |
|------|---------|
| skills/ppt-master/scripts/svg_to_pptx/drawingml_context.py | - 在 `ConvertContext` 中添加 `svg_id_to_shape_id` 字典以映射 SVG 元素 ID 与形状 ID<br>- 更新 `spawn_child` 方法以支持跨子上下文同步 ID 映射状态 |
| skills/ppt-master/scripts/svg_to_pptx/drawingml_converter.py | - 在元素转换期间提取并保存分配的形状 ID 到上下文中<br>- 在生成最终 XML 时通过正则替换将 `{SVG_ID:xxx}` 占位符转换为真实的形状 ID |
| skills/ppt-master/scripts/svg_to_pptx/drawingml_elements.py | - 添加 `_build_cxn_xml` 辅助函数以解析 `data-cxn-*` 连接点属性<br>- 修改 `_wrap_shape` 函数以支持生成包含起止连接点信息的 `<p:cxnSp>` 元素<br>- 更新 `convert_line` 和 `convert_path` 函数以应用连接线转换逻辑 |
| test_pptx_cxn.py | - 新增生成带连接线的 PPTX 文件的 Python 基础验证脚本 |