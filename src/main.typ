#import "@preview/ctheorems:1.1.3": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/equate:0.2.1": equate

#set text(font: "Noto Serif CJK SC", lang: "zh", region: "CN")
#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif CJK SC"))
#show math.equation: set block(breakable: true)
#set par(leading: 0.8em, justify: true)
#show heading.where(level: 1): it => [
  #pagebreak(weak: true)
  #block(
    align(center, it),
    width: 100%,
    fill: gradient.linear(white, blue.lighten(70%), white),
    above: 2em,
    below: 1em
  )
]
#show heading.where(level: 2): it => {
  block(
    it,
    width: 100%,
    fill: gradient.linear(blue.lighten(80%), white, white),
    stroke: (left: blue),
    inset: (left: 6pt, top: 3pt, bottom: 3pt),
    above: 2em,
    below: 1em
  )
}
#set heading(numbering: numbly("{1:I}.", "{2:1}."))

#show: thmrules.with(qed-symbol: $square$)

#show ref: equate

#include "chapters/01 outline.typ"

#pagebreak()
#set page(numbering: "1")

#include "chapters/02 写在前面.typ"

#pagebreak()

#include "chapters/03 初等积分法.typ"

#include "chapters/04 线性微分方程组.typ"

#include "chapters/05 高阶线性微分方程.typ"
