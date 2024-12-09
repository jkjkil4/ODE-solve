#[
  #set align(center)
  #box[
    #set align(right)
    #text(size: 1.5em)[*常微分方程计算指南*]\
    #text(size: 0.7em)[
      Author: bilibili\@jkjkil-jiang\
      github\@jkjkil4\
      Cooperator: bilibili\@百里朝歌\_
    ]
  ]
]

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,
  outline(title: none, indent: 1em),
  {
    let l(t) = box(width: 12pt, height: 12pt * t, fill: luma(92%))
    stack(
      dir: ltr,
      spacing: 12pt,
      l(22),
      l(36),
      l(28),
      l(16),
      l(18),
      l(12),
      l(4),
      l(5),
      l(4)
    )
  }
)