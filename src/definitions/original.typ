#let result(body) = box(
  width: 100%,
  fill: gradient.radial(green.lighten(90%), white),
  body
)

#let difyx = $(dif y) / (dif x)$
#let difzx = $(dif z) / (dif x)$
#let difyt = $(dif y) / (dif t)$
#let diftx = $(dif t) / (dif x)$
#let eqnum-on(body) = {
  set math.equation(numbering: "1.")
  body
}
#let eqnum-off(body) = {
  set math.equation(numbering: none)
  body
}
#let eqbr-on(body) = {
  show math.equation: set block(breakable: true)
  body
}
#let eqbr-off(body) = {
  show math.equation: set block(breakable: false)
  body
}
