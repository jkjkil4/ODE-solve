#import "../definitions.typ": *

= 写在前面

== 注意事项

该讲义仅用于复习ODE计算方法，过度依赖可能导致缺失推导逻辑与思维.

== 使用方法

#thm-definition[
  这里书写的是定义，会使用该框给出一些必要的定义说明
]
#v(-1em)

#thm-method[
  这里书写的是方法，参照这个框里的方法进行求解
]
#v(-1em)

#thm-warn[
  这里书写的是一些注意事项
]
#v(-1em)

#thm-example[
  这里书写的是例题
]
#v(-1em)

#thm-theorem[
  这里书写的是定理（出现得比较少）
]

以上这些框的编号规则为：
#[
  #set align(center)
  #set text(size: 1.5em)
  章节号.该框在章节中的序号
]

#grid(
  columns: (auto, 1fr),
  inset: (left: 8pt, right: 8pt),
  box(inset: (top: 8pt))[例如],
  grid.vline(stroke: gray),
  box[
    #thm-method[]
    #thm-method[]
    #thm-method[]
    #thm-example[]
  ]
)