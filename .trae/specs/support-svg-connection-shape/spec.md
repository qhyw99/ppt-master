# 支持 SVG 吸附连接线特性 Spec

## Why
目前 `svg_to_pptx` 转换器将所有 SVG 线条（`<line>`, `<path>`）统一转换为 PPT 的独立普通形状（`<p:sp>`），不支持连接线的吸附功能（Glue Points）。通过引入 SVG 自定义属性 `data-cxn-*`，可以让确定性程序生成的 SVG 指定连接逻辑，从而在生成的 PPT 中将其解析为原生的连接符（`<p:cxnSp>`），实现高级连接与吸附特效。保留 SVG 作为中间媒介的好处。

## What Changes
- 修改 `skills/ppt-master/scripts/svg_to_pptx/drawingml_converter.py` 文件，在解析线条类型元素（`<line>`, `<path>`）时，检测是否包含连接属性。
- 具体的自定义属性包括：`data-cxn-start-target`（起点目标ID），`data-cxn-start-idx`（起点连接索引），`data-cxn-end-target`（终点目标ID），`data-cxn-end-idx`（终点连接索引）。
- 若包含以上属性，生成 `<p:cxnSp>` 而非 `<p:sp>` 结构。
- 在 `<p:cxnSp>` 结构中通过 `<a:stCxn>` 和 `<a:endCxn>` 关联目标形状在 PPT 中的内部 ID。由于 SVG 的 ID 为字符串，而 PPT 为自增数字 ID，转换器需要维护并映射 SVG ID 与 PPT ID 之间的关系。

## Impact
- Affected specs: SVG 解析逻辑、DrawingML `<p:cxnSp>` 生成逻辑。
- Affected code: `skills/ppt-master/scripts/svg_to_pptx/drawingml_converter.py` 以及可能负责遍历与 ID 分配相关的上下文管理器。

## ADDED Requirements
### Requirement: 解析 SVG 自定义连接属性
The system SHALL 识别 `<line>` 和 `<path>` 中的 `data-cxn-*` 属性并将其映射到 DrawingML 的 `<p:cxnSp>` 元素。

#### Scenario: 成功生成吸附连接符
- **WHEN** 解析器遇到带有 `data-cxn-start-target` 等属性的线条节点。
- **THEN** 解析器查找到目标对象的 PPT 内部 ID，生成 `<p:cxnSp>`，并在其内部注入 `<a:stCxn>` / `<a:endCxn>` 节点实现对象绑定。
