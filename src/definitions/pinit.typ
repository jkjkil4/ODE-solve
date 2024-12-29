#import "@preview/pinit:0.2.2": *

#let pinit-c1 = green.transparentize(80%)
#let pinit-c2 = red.transparentize(80%)

#let pinit-highlight-equation-from(height: 2em, pos: bottom, fill: rgb(0, 180, 255), highlight-pins, point-pin, body) = {
  let body = rect(
    inset: 0.5em,
    stroke: (bottom: 0.12em + fill),
    {
      set text(fill: fill)
      body
    }
  )
  pinit-highlight(..highlight-pins, dy: -0.9em, fill: rgb(..fill.components().slice(0, -1), 40))
  context pinit-point-from(
    fill: fill, 
    pin-dx: 0em, 
    pin-dy: if pos == bottom { 0.5em } else { -0.9em }, 
    body-dx: 0pt, 
    body-dy: -measure(body).height, 
    offset-dx: 0em, 
    offset-dy: if pos == bottom { 0.8em + height } else { -0.6em - height },
    point-pin,
    body
  )
}
