#import "@preview/numbly:0.1.0": numbly
#import "@preview/ctheorems:1.1.3": *

#let thm-numbering = numbly("", "{1:I}.{2}")

#let thm-definition = thmbox("thm-definition", "定义", stroke: blue, base_level: 1).with(numbering: thm-numbering)

#let thm-method = thmbox("thm-method", "基本方法", fill: blue.lighten(90%), base_level: 1).with(numbering: thm-numbering)
#let thm-explain = thmplain("thm-explain", [*说明*]).with(numbering: none)

#let thm-example = thmbox("thm-example", "例", fill: green.lighten(90%), base_level: 1).with(numbering: thm-numbering)
#let thm-solve = thmplain("thm-solve", [*解*]).with(numbering: none)

#let thm-tip = thmbox("thm-tip", "注", fill: orange.lighten(90%)).with(numbering: none)

#let thm-note = thmplain("thm-note", [*注*]).with(numbering: none)
