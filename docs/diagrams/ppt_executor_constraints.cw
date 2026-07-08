# session_id: 2eada24d-ece5-404a-ac31-2717ad6c952c
direction: down
# 全局标题
title: "Executor 三重滤镜（约束）执行管线" {
  shape: text
  style.font-size: 28
  style.bold: true
  style.font-color: "#2c3e50"
}
# ── 宏观基调层 ──
layer1: Layer 1 | 全局设定: Mode & Visual Style {
  style.stroke: "#8e44ad"
  style.stroke-width: 3
  style.border-radius: 8
  source: Input: User Config {
    shape: parallelogram
    style.fill: "#f39c12"
    style.font-color: white
    style.bold: true
  }
  mode: Mode {
    shape: hexagon
    style.fill: "#8e44ad"
    style.font-color: white
    style.bold: true
  }
  visual_style: Visual Style {
    shape: hexagon
    style.fill: "#9b59b6"
    style.font-color: white
    style.bold: true
  }
  rule1: 规则：
  极简风 / 科技蓝 / 禁止投影
  全局贯穿所有页面 {
    shape: code
    style.fill: "#2c3e50"
    style.font-color: "#ecf0f1"
    style.font-size: 12
  }
  # 连接
  source -> mode: 指定模式
  source -> visual_style: 指定视觉基调
  mode -> rule1
  visual_style -> rule1
}
# ── 单页骨架层 ──
layer2: Layer 2 | 单页骨架: Page Layouts & Charts {
  style.stroke: "#2980b9"
  style.stroke-width: 3
  style.border-radius: 8
  decision: 是否存在模板？ {
    shape: diamond
    style.fill: "#e74c3c"
    style.font-color: white
    style.bold: true
    style.stroke-width: 2
  }
  inherit: 模板继承 {
    shape: parallelogram
    style.fill: "#2980b9"
    style.font-color: white
    style.bold: true
    tooltip: "物理克隆模板的坐标骨架与占位符"
  }
  free: Free Design {
    shape: parallelogram
    style.fill: "#27ae60"
    style.font-color: white
    style.bold: true
    tooltip: "无预设骨架，自由布局"
  }
  skeleton: 输出：坐标骨架 + 占位符 {
    shape: code
    style.fill: "#2c3e50"
    style.font-color: "#ecf0f1"
    style.font-size: 12
  }
  # 分支
  decision -> inherit: 是 → 继承骨架
  decision -> free: 否 → 自由模式
  inherit -> skeleton
  free -> skeleton
}
# ── 单页细节层 ──
layer3: Layer 3 | 单页填肉: Page Rhythm {
  style.stroke: "#16a085"
  style.stroke-width: 3
  style.border-radius: 8
  rhythm: 页面节奏 {
    shape: oval
    style.fill: "#16a085"
    style.font-color: white
    style.bold: true
    style.font-size: 14
  }
  dense: dense（密集） {
    shape: rectangle
    style.fill: "#e67e22"
    style.font-color: white
    style.font-size: 13
    style.bold: true
  }
  breathing: breathing（呼吸感） {
    shape: rectangle
    style.fill: "#1abc9c"
    style.font-color: white
    style.font-size: 13
    style.bold: true
  }
  dense_rules: 允许画网格卡片
  多元素密集排列 {
    shape: code
    style.fill: "#2c3e50"
    style.font-color: "#ecf0f1"
    style.font-size: 11
  }
  breathing_rules: 强制大留白
  禁止多卡片网格 {
    shape: code
    style.fill: "#2c3e50"
    style.font-color: "#ecf0f1"
    style.font-size: 11
  }
  rhythm -> dense: 选择密集
  rhythm -> breathing: 选择呼吸感
  dense -> dense_rules
  breathing -> breathing_rules
}
# ── 最终输出 ──
output: 最终输出：完整 SVG 页面 {
  shape: cylinder
  style.fill: "#c0392b"
  style.font-color: white
  style.bold: true
  style.font-size: 16
  style.shadow: true
}
# ── 层间降维连接（控制流） ──
(layer1 -> layer2): {
  label: "全局基调 → 约束表型"
  style.stroke: "#8e44ad"
  style.stroke-width: 2
  style.font-color: "#8e44ad"
  style.font-size: 11
  style.bold: true
}
(layer2 -> layer3): {
  label: "骨架约束 → 填肉规则"
  style.stroke: "#2980b9"
  style.stroke-width: 2
  style.font-color: "#2980b9"
  style.font-size: 11
  style.bold: true
}
(layer3 -> output): {
  label: "三重约束合成 → 渲染"
  style.stroke: "#16a085"
  style.stroke-width: 2
  style.font-color: "#16a085"
  style.font-size: 11
  style.bold: true
}
# ── 横向数据流：每个层的规则产物向下游传递 ──
# layer1 产物
layer1.rule1 -> layer2
# layer2 产物
layer2.skeleton -> layer3
# layer3 产物
layer3.dense_rules -> output
layer3.breathing_rules -> output