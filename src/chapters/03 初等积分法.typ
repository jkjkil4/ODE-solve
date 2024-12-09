#import "../definitions.typ": *

= 初等积分法

== 变量分离方程

#thm-method[
  如果你能将某个方程改写成
  $
    X(x) dif x + Y(y) dif y = 0
  $
  的形式，那么可以对两项分别积分求解
  $
    integral X(x) dif x + integral Y(y) dif y = C
  $
] <method-变量分离>
#thm-explain[
  例如，$display(difyx) = y^2 cos x$ 当 $y!=0$ 时可以改写为
  $
    1/y^2 dif y = cos x dot dif x
  $

  等号两边积分得到 $display(integral 1/y^2) dif y = display(integral) cos x dif x$，即 $display(-1/y = sin x + C)$

  于是原方程的*通解*为
  $
    y = (-1) / (sin x + C)
  $

  注意，由于我们一开始假定了 $y!=0$，进而求得*通解*；\
  所以，我们也要考虑当 $y=0$，由于它不符合通解表达式，于是 $y=0$ 是一个*特解*
]

#thm-example[
  求解微分方程
  $
    difyx = x y + 4y + 3x + 12
  $
]
#thm-solve[
  方程可以改写成
  $
    difyx = (x+4)(y+3)
  $

  当 $y+3!=0$ 时，改写为
  $
    1/(y+3) dif y = (x+4) dif x
  $

  积分得到
  $
    ln abs(y+3) = (x+4)^2 / 2 + C_1
  $
  $
    e^(ln abs(y+3)) = e^((x+4)^2 \/ 2 + C_1)
  $
  $
    y+3 = plus.minus e^(C_1) dot e^((x+4)^2 \/ 2)
  $

  由于 $C_1$ 是任意常数，所以不妨用新的常数 $C=plus.minus e^(C_1) (!=0)$ 简化，得到*通解*
  $
    y = -3 + C e^((x+4)^2 \/ 2), quad C!=0
  $

  由于 $y+3=0$（即 $y=-3$） 时，如果允许 $C = 0$，那么*特解* $y=-3$ 也包含在上式中，所以
  #result[$
    y = -3 + C e^((x+4)^2 \/ 2)
  $]

  即表示了方程的解
]

#thm-example[
  求解微分方程
  $
    difyx = x^2 / (y (1+x^2))
  $
]
#thm-solve[
  #v(-1em)
  $
    y dif y = x^2 / (1+x^2) dif x quad
  $
  $
    y dif y = (1 - 1/(1+x^2)) dif x
  $

  #result[$
    1/2 y^2 = x - arctan x + C
  $]
]

#thm-example[
  求解微分方程
  $
    difyx = 1 + x + y^2 + x y^2
  $
]
#thm-solve[
  #v(-1em)
  $
    difyx = 1+x + (1+x)y^2
  $
  $
    difyx = (1+x)(1+y^2)
  $
  $
    1/(1+y^2) dif y = (1+x) dif x
  $
  #result[$
    arctan y = 1/2 (1 + x)^2 + C
  $]
]

#pagebreak()

== 齐次方程

#thm-method[
  如果方程可以表示为
  $
    difyx = P(x,y) / Q(x,y)
  $

  并且 $P(x,y)$ 和 $Q(x,y)$ 都是 $x$ 和 $y$ 的同次齐次函数\
  （举个例子，比如 $x^3 y$ 和 $x^2 y^2 + y^4$ 都是 4 次齐次的）

  那么，方程就可以表示为 $display(difyx = Phi(y/x))$ 的形式，并通过换元 $u = display(y/x)$，以及
  $
    difyx #text(gray)[$= dif(u x) / (dif x) = (dif u) / (dif x) dot x + u dot (dif x) / (dif x)$] = (dif u) / (dif x) dot x + u
  $
  #align(center)[（灰色部分是推导过程）]

  转为使用 @method-变量分离 计算 $u$ 与 $x$ 的变量分离方程，解出后代入 $display(u=y/x)$ 即可
] <method-齐次方程>
#thm-explain[
  #show math.equation: math.display
  例如，求解方程
  $
    difyx = e^(y\/x) + y/x
  $
  该方程本身已经是 $difyx = Phi(y/x)$ 的形式了，令 $u=y/x$，则
  $
    (dif u) / (dif x) dot x + u = e^u + u
  $
  得
  $
    e^(-u) dif u = 1/x dif x
  $
  积分得
  $
    e^(-u) + ln abs(x) = C
  $
  代回 $u=y/x$ 得*通解*
  $
    e^(-y\/x) + ln abs(x) = C
  $

  如果方程右侧不是 $Phi(y/x)$ 的形式，例如 $3 (y^2 - 2x^2) / (2x y + x^2)$，那么可以同除 $x^2$ 得到 $3 ((y/x)^2 - 2)/(2 y/x + 1)$，这样就可以进行换元然后求解了
]

#thm-example[
  求解微分方程
  $
    difyx = (y^6-2x^2)/(2x y^5 + x^2 y^2)
  $
]
#thm-solve[
  #show math.equation: math.display
  虽然这个不是齐次方程，但是可以令 $z=y^3$，并且可知 $(dif z) / (dif x) #text(gray)[$= dif(y^3) / (dif x)$] = 3 y^2 difyx$，于是
  $
    (dif z) / (dif x) = 3 (z^2 - 2x^2) / (2x z + x^2)
  $

  令 $u = z/x$，那么
  $
    u + x (dif u) / (dif x) = 3 (u^2 - 2) / (2u + 1)
  $

  $u^2-u-6!=0$ 时，整理得
  $
    (2u+1)/((u-3)(u+2)) dif u = 1/x dif x
  $

  即
  $
    ( (5/7)/(u-3) + (3/5)/(u+2) ) dif u = 1/x dif x
  $

  积分得
  $
    7/5 ln abs(u-3) + 3/5 ln abs(u+2) = ln abs(x) + tilde(C)
  $

  即
  $
    (u-3)^7 (u+3)^3 = C x^5, quad C = plus.minus e^(5 tilde(C))
  $

  将 $u=y^3/x$ 代入得*通解*
  
  #result[$
    (y^3-3x)^7 (y^3+2x)^3 = C x^15
  $]

  可以发现 $u^2-u-6=0$ 所得的解也包含在其中，于是不用另外区分*特解*
]

#thm-method[
  #show math.equation: math.display
  当微分方程有类似
  $
    difyx = f((a x + b y + c) / (m x + n y + l))
  $
  的形式时，注意这里的常数项 $c$ 和 $l$，如果没有这两个，那么就是齐次方程，可以直接按 @method-齐次方程 的方法求解，但是这里的 $c$ 和 $l$ 阻碍了我们.

  为了使其齐次化，我们可以通过换元消去常数项
  
  具体来说，我们需要求出 $cases(
    a x + b y + c = 0,
    m x + n y + l = 0
  )$ 的解 $cases(
    x = alpha,
    y = beta
  )$，从而通过 $cases(
    x = xi + alpha,
    y = eta + beta
  )$ 得到 $xi$ 与 $eta$ 关联的方程
  #v(-1em)
  $
    (dif eta) / (dif xi) = f((a xi + b eta) / (m xi + n eta))
  $
  这样就化为可以通过 @method-齐次方程 求解的齐次方程.
]
#thm-explain[
  可以具象为，虽然两个直线的交点不位于原点，但我们通过变换挪到原点的位置.
]

#thm-example[
  求解微分方程
  $
    difyx = (2x-y+1)/(x-2y+1)
  $
]
#thm-solve[
  #show math.equation: math.display
  由
  $
    cases(
      2x-y+1=0,
      x-2y+1=0
    )
  $
  解得 $x=-1/3, y=1/3$，所以令 $cases(
    x = xi - 1/3,
    y = eta + 1/3
  )$，则原方程变为
  $
    (dif eta) / (dif xi) = (2xi - eta) / (xi - 2 eta)
  $
  
  不再赘述齐次方程的求解，得到
  $
    xi^2 - xi eta + eta^2 = C
  $
  
  代回原变量得到*通解*
  
  #result[$
    (x+1/3)^2 - (x+1/3)(y-1/3) + (y-1/3)^2 = C
  $]
]

== 一阶线性方程

#thm-definition[
  一阶线性微分方程
  $
    difyx + p(x) dot y = q(x)
  $

  其中 $p(x)$ 和 $q(x)$ 是特定区间上的连续函数
] <def-一阶线性>
#thm-definition[
  一阶*齐次*线性微分方程
  $
    difyx + p(x) dot y = 0
  $

  其中 $p(x)$ 和 $q(x)$ 是特定区间上的连续函数
] <def-一阶齐次线性>
#thm-tip[这里的“齐次”含义与前面“齐次方程”中的含义是不同的]

#thm-method[
  #show math.equation: math.display
  我们可以认为“一阶*齐次*线性方程”是“一阶线性方程”的一种特殊情况，我们将首先考虑“一阶*齐次*线性方程”的求解方法，再进而求解“一阶线性方程”，这种思维在之后的许多方程中都有用到.

  首先求解“一阶*齐次*线性方程” $difyx + p(x) dot y = 0$，显然这是一个变量分离方程
  $
    1/y dif y + p(x) dif x = 0
  $

  可解为
  #eqnum-on[$
    y = C e^(-integral p (x) dif x)
  $ <eq-一阶齐次线性>]

  这就是“一阶*齐次*线性方程”的通解.

  #line(length: 100%, stroke: blue.lighten(50%))

  现在考虑“一阶线性方程” $difyx + p(x) dot y = q(x)$，

  我们使用“常数变易法”将 @eq-一阶齐次线性 的常数 $C$ 换成待定函数 $C(x)$
  $
    y=C(x) dot e^(-integral p(x) dif x)
  $
  
  代入“一阶线性方程”中，可得
  $
    C'(x)e^(-integral p(x) dif x) - C(x) e^(-integral p(x) dif x) p(x) + p(x) dot y = q(x)
  $

  即
  $
    C'(x)e^(-integral p(x) dif x) - p(x) dot y + p(x) dot y = q(x)
  $

  于是
  $
    C'(x) = e^(integral p(x) dif x) q(x)
  $

  从而得
  $
    C(x) = integral q(x) e^(integral p(x) dif x) dif x + C
  $

  所以得到“一阶线性方程”的通解
  #pinit-highlight(1, 2, fill: pinit-c1)
  #pinit-highlight(3, 4, fill: pinit-c2)
  #eqnum-on[$
    y 
    &= C(x) dot e^(-integral p(x) dif x) \
    &= e^(-integral p(x) dif x) (C + integral q(x) e^(integral p(x) dif x) dif x) \
    &= #pin(1)C e^(-integral p(x) dif x)#pin(2) + #pin(3)e^(-integral p(x) dif x) dot integral q(x) e^(integral p(x) dif x) dif x#pin(4)
  $ <eq-一阶线性>]
]
#thm-explain[
  值得注意的是，通解可以分为两个部分
  
  - #box(fill: pinit-c1)[绿色部分]，这其实就是“一阶*齐次*线性方程”的通解

  - #box(fill: pinit-c2)[红色部分]，这部分是“一阶线性方程”的一个特解

  “通解”+“特解”的结构在后面也经常会出现，这里暂时不作详细说明.
]

#thm-tip[
  有时为了方便，常把通解 @eq-一阶线性 中的不定积分写成变上限的定积分
  #let intx0x = $integral_(x_0)^x$
  #pinit-highlight(5, 6, fill: pinit-c1)
  #pinit-highlight(7, 8, fill: pinit-c2)
  $
    y
    &= e^(-intx0x p(t) dif t) (C + intx0x q(s) e^(intx0x p(t) dif t) dif s) \
    &= #pin(5)C e^(-intx0x p(t) dif t)#pin(6) + #pin(7)e^(-intx0x p(t) dif t) dot intx0x q(s) e^(intx0x p(t) dif t) dif s#pin(8)
  $

  利用这种形式容易得到初值问题的解
]

#thm-example[
  求解微分方程
  $
    difyx + 1/x y = x^3, quad x!=0
  $
]
#thm-solve[
  #show math.equation: math.display
  相应齐次线性方程
  $
    difyx + 1/x y = 0
  $

  的通解是 $y = C / x$，于是把 $C$ 替换为待定函数 $C(x)$，设原方程有如下形式的解
  $
    y = C(x)/x
  $

  将此形式代入原方程，得 $C'(x) = x^4$，即 $C(x) = 1/5 x^5 + C$

  从而，所求的通解为
  
  #result[$
    y = 1/5 x^4 + C/x, quad x!=0
  $]

  也可以试着直接代入最终表达式
  $
    y
    &= e^(-integral p(x) dif x) (C + integral q(x) e^(integral p(x) dif x) dif x) \
    &= e^(-ln x) (C + integral x^3 e^(ln x) dif x) \
    &= x^(-1) (C + 1/5 x^5) \
    &= 1/5 x^4 + C/x, quad x!=0
  $
  结果是一样的
]

== Bernoulli 方程

#thm-method[
  考虑微分方程
  $
    difyx+p(x) dot y=q(x) dot y^n
  $

  当 $n=0$ 或者 $n=1$ 时，\
  该方程退化为前面提到的“一阶齐次线性微分方程”或者“一阶线性微分方程”.

  如果 $n!=0$ 和 $1$，\
  此时我们称之为 Bernoulli 方程，我们也可以找到方法化为一阶线性微分方程进行求解.

  #line(length: 100%, stroke: blue.lighten(50%))

  对于 Bernoulli 方程，两边同乘 $(1-n) y^(-n)$，得到
  $
    (1-n) y^(-n) (dif y) / (dif x) + (1-n) p(x) dot y^(1-n) = (1-n) q(x)
  $
  （这是为了消掉 $q(x)$ 旁的 $y$，并且凑系数）

  由于 $(y^(1-n))' = (1-n) y^(-n)$，所以
  $
    dif(y^(1-n)) / (dif x) + (1-n) p(x) dot y^(1-n) = (1-n) q(x)
  $
  
  再令 $z=y^(1-n)$，就有
  $
    difzx + (1-n) p(x) dot z = (1-n) q(x) 
  $

  于是，我们就化为关于未知函数 $z$ 的一阶线性方程，利用上节的常数变易法，\
  再将 $z = y^(1-n)$ 代入即可得到方程的通解
  $ 
    y^(1-n)=e^(-(1-n)integral p(x) dif x) dot (C+(1-n)integral q(x)e^((1-n)integral p(x) dif x) dif x) 
  $
]

#thm-example[
    求解微分方程
  
    $ difyx = 6y/x - x y^3 $
  ]
  #thm-solve[
    #show math.equation: math.display
    观察这个式子，不难发现他就是一个 $n=3$ 的Bernoulli方程
    $
      difyx - 6/x y = -x y^3
    $
    
    且 $p(x) = -6/x$，$q(x)=-x$
  
    假设 $y!=0$，所以我们对方程两边同乘 $-2y^(-3)$，再令 $z = y^(-2)$, 则
  
    $ difzx = -12/x z + 2x  $
  
    此时这个方程就变为了关于 $z$ 的一阶线性微分方程，我们对他使用常数变易法，求解后将原变量 $y$ 代入，可得*通解*
  
    #result[$ y^2 = 7x^12/(C+x^14) $]
    
    因为 $n=3>0$，我们前面计算过程中乘上 $-2y^(-3)$ 时假设了 $y!=0$，\
    所以我们也要考虑 $y=0$ 的情况，即 $y=0$ 是一个*特解*
  ]

// #import "@preview/modpattern:0.1.0": modpattern
// #block(
//   width: 100%,
//   fill: modpattern(
//     (30pt, 30pt),
//     line(
//       start: (100%, 0%),
//       end: (0%, 100%),
//       stroke: 10pt + orange.transparentize(90%),
//     ),
//   )
// )[
//   #thm-definition[
//     Bernoulli方程
  
//     $ difyx+p(x) dot y=q(x) dot y^n $
  
//     其中n为常数且 $n!=1$ 和 $0$
//   ]
//   我们可以注意到，
  
//   当 $n=0$ 时，Bernoulli方程其实就是一阶齐次线性微分方程，
  
//   当 $n=1$ 时，Bernoulli方程其实就是一阶线性微分方程.
  
//   所以我们求解此类方程时会很自然的想到将Bernoulli方程化为一阶线性微分方程进行求解.
  
//   #thm-method[
//     对Bernoulli方程，两边同乘$(1-n)y^(-n)$，再令$z = y^(1-n)$，就有
  
//     $ difzx+(1-n)p(x) dot z = (1-n)q(x) $
    
//     于是，我们就得到了关于未知函数$z$的一阶线性方程，利用上节的常数变易法，再将$z = y^(1-n)$代入即可得到方程的通解
  
//     $ y^(1-n)=e^(-(1-n)integral p(x)d x) dot (C+(1-n)integral q(x)e^((1-n)integral p(x)d x)) $
//   ]
  
//   #thm-example[
//     求解微分方程
  
//     $ difyx = 6y/x - x y^3 $
//   ]
//   #thm-solve[
//     观察这个式子，不难发现他就是一个 $n=3$ 的Bernoulli方程，
//     且 $p(x) = -6/x$，$q(x)=-x$
  
//     所以我们应该对方程两边同乘 $-2y^(-3)$，再令 $z = y^(-2)$, 则
  
//     $ difzx = -12/x z + 2x  $
  
//     此时这个方程就变为了关于$z$的一阶线性微分方程，我们对他使用常数变易法，并将原变量$y$代入，可得
  
//     $ y^2 = 7x^12/(C+x^14) $(其中$C$为任意常数)，且因为$n=3>0$，所以还有一特解$y=0$
//   ]
// ]

== Riccati 方程

== ✨恰当方程及积分因子法✨

前面我们讨论了很多种微分方程的求法，例如分离变量、齐次方程等，以下介绍的是“粗暴方法”，适用于在没有发现前面结构的情况下使用，作为“通用方案”.

#thm-method[
  #show math.equation: math.display  
  考虑一阶微分方程
  $
    P(x,y) dif x + Q(x,y) dif y = 0
  $

  当恒等式 $
  (partial P) / (partial y) (x,y)
  eq.triple
  (partial Q) / (partial x) (x,y)$ 成立（即 $P$ 对 $y$ 的偏导和 $Q$ 对 $x$ 的偏导相等）时，我们称该方程为*恰当方程*.

  此时，该方程可以表示为某个函数 $Phi(x,y)$ 的全微分 $dif Phi(x,y) = P(x,y) dif x + Q(x,y) dif y$，并且 $Phi(x,y) = C$ 就是该微分方程的解，于是我们的目标是求出该 $Phi(x,y)$.

  由于用符号描述方法比较晦涩，于是这里直接给出计算例子
] <method-恰当方程法>

#thm-example[
  求解微分方程
  $
    (y-3x^2) dif x + (x-4y) dif y = 0
  $
]
#thm-solve[
  #show math.equation: math.display
  $P(x,y) = y-3x^2$，$Q(x,y) = x-4y$，由于 $(partial P) / (partial y) = 1 = (partial Q) / (partial x)$，所以这是恰当方程！

  因此我们就需要找出函数 $Phi(x,y)$，使得 $(partial Phi) / (partial x) = P$ 且 $(partial Phi) / (partial y) = Q$，所以，我们先考虑前一个偏导数等式，对其求积分得 
  $
    Phi(x,y) = integral P(x,y) dif x = integral (y-3x^2) dif x = x y - x^3 + psi(y)
  $

  其中 $psi(y)$ 是该积分的常数项，因为这是关于 $x$ 的积分，自然会产生这一项.

  于是，再由后一个等式 $(partial Phi) / (partial y) = Q$ 得
  $
    (partial(x y - x^3 + psi(y))) / (partial y) = x - 4y
  $
  $
    x + psi'(y) = x-4y
  $

  所以 $psi'(y) = -4y$，即 $psi(y) = -2y^2$，这样我们就求出了
  $
    Phi(x,y) = x y - x^3 - 2y^2
  $

  于是恰当方程 $(y-3x^2) dif x + (x-4y) dif y = 0$ 的*通解*为
  $
    x y - x^3 - 2y^2 = C
  $
]

#thm-method[
  #show math.equation: math.display
  如果方程
  $
    P(x,y) dif x + Q(x,y) dif y = 0
  $

  不是*恰当方程*，也就是 $
  (partial P) / (partial y)
  eq.not
  (partial Q) / (partial x)$ 时，要怎么办呢？

  此时我们需要找出一个函数 $mu(x,y)$，使得原方程乘上该函数后
  $
    mu(x,y) P(x,y) dif x + mu(x,y) Q(x,y) dif y = 0
  $

  成为*恰当方程*，进而可以使用前述方法进行计算.

  于是我们这里讨论如何找出 $mu(x,y)$（我们称之为*积分因子*）.

  #line(length: 100%, stroke: blue.lighten(50%))

  找出 $mu(x,y)$ 使其成为恰当方程，也意味着，本来原方程 $
  (partial P) / (partial y)
  !=
  (partial Q) / (partial x)$ 让我们无从下手，乘上 $mu(x,y)$ 后，使得 $partial(mu P) / (partial y) eq.triple partial(mu Q) / (partial x)$ 成立，展开得到
  #eqnum-on[$
    Q (partial mu) / (partial x)
    - 
    P (partial mu) / (partial y)
    =
    (
      (partial P) / (partial y)
      -
      (partial Q) / (partial x)
    ) mu
  $ <eq-mu-恰当方程>]

  然而并不是所有情况都方便找出 $mu(x,y)$，这里我们讨论 $mu$ 仅与 $x$ 或 $y$ 相关时的情况

  #import "@preview/kouhu:0.1.1": kouhu
  #let kh = kouhu(length: 400)
  #grid(
    columns: (1fr, 1fr),
    inset: (x, y) => {
      if x == 0 {
        (right: 8pt, top: 4pt, bottom: 4pt)
      } else {
        (left: 8pt, top: 4pt, bottom: 4pt)
      }
    },
    
    [
      当
      #v(-1em)
      $
        G(x) := display(
          (partial P) / (partial y)
          -
          (partial Q) / (partial x)
        ) / Q
      $

      仅与 $x$ 有关，与 $y$ 无关时
      $ mu(x) = e^(integral G(x) dif x) $

      使得
      $
        mu(x) P(x,y) dif x + mu(x) Q(x,y) dif y = 0
      $

      是*恰当方程*
    ],
    grid.vline(stroke: blue.lighten(50%)), 
    [
      当
      #v(-1em)
      $
        H(y) := display(
          (partial P) / (partial y)
          -
          (partial Q) / (partial x)
        ) / (-P)
      $

      仅与 $y$ 有关，与 $x$ 无关时
      $ mu(y) = e^(integral H(y) dif y) $

      使得
      $
        mu(y) P(x,y) dif x + mu(y) Q(x,y) dif y = 0
      $

      是*恰当方程*
    ]
  )
]
#thm-explain[
  可以通过假设 $mu(x,y)$ 仅与 $x$ 或 $y$ 相关，化简 @eq-mu-恰当方程 进而得到上面两个结论.
]

#thm-example[
  求解微分方程
  $
    (3x^3 + y) dif x + (2x^2 y - x) dif y = 0
  $
]
#thm-solve[
  因为
  $
    (partial P) / (partial y)
    -
    (partial Q) / (partial x)
    =
    2(1-2x y)
  $

  所以此方程不是恰当方程，但是
  $
    G(x) := display(
      (partial P) / (partial y)
      -
      (partial Q) / (partial x)
    ) / Q
    =
    -2/x
  $

  是仅与 $x$ 有关的函数，所以可以得到积分因子
  $
    mu(x) 
    = e^(integral - 2/x dif x)
    = 1/x^2
  $

  将其乘原方程，得到恰当方程
  #eqnum-on[$
    (3x^3 + y) / x^2 dif x
    +
    (2x^2 y - x) / x^2 dif y
    =
    0
  $ <eq-example-3x3y2x2yx>]

  于是就可以使用求解恰当方程的 @method-恰当方程法 来求解了，求出

  #result[$
    3/2 x^2 + y^2 - y/x = C
  $]

]
#thm-explain[
  该题也可以通过观察凑全微分来求解，例如可以把 @eq-example-3x3y2x2yx 写成

  $
    3x dif x + 2y dif y
    +
    (y dif x - x dif y) / x^2
    =
    0
  $

  则得
  $
    dif(3/2 x^2 + y^2 - y/x) = 0
  $

  所以也可以得到原方程的通积分.

  这种分组观察的方法需要我们记住一些二元函数的全微分公式：
  $ y dif x + x dif y = dif(x y) $
  $ (y dif x - x dif y) / y^2 = dif(x/y) $
  $ (-y dif x + x dif y) / x^2 = dif(y/x) $
  $ (y dif x - x dif y) / (x y) = dif(ln x/y) $
  $ (x dif y - y dif x) / (x^2 + y^2) = dif(arctan y/x) $
]

#thm-example[
  求解一阶线性方程
  $
    difyx + p(x) dot y = q(x)
  $
]
#thm-solve[
  将方程改写为
  #eqnum-on[$
    (p(x) dot y - q(x)) dif x + dif y = 0
  $ <eq-一阶线性-积分因子>]

  此时 $P = p(x) dot y - q(x)$，$Q=1$，易见
  $
    display(
      (partial P) / (partial y) 
      - 
      (partial Q) / (partial x)
    ) / Q
    =
    p(x)
  $

  是只依赖于 $x$，而与 $y$ 无关的函数，于是 $mu = e^(integral p(x) dif x)$ 就是 @eq-一阶线性-积分因子 的积分因子.

  进而同样可以求出和之前求解“一阶线性微分方程”时一样的结果
  $
    y = e^(-integral p(x) dif x) (
      C +
      integral q(x) e^(integral p(x) dif x) dif x
    )
  $
]

#thm-tip[
  事实上，用积分因子的观点可以统一前面所讲的各种初等积分法.但是比较粗暴，如果能发现先前的那些特殊结构，可以更方便地求解.
]

== 分组求积分因子法 

我不会

== 隐式微分方程

我不会（我是fw qwq）

== 可降阶的高阶方程

本节只介绍三类高阶微分方程的解法，基本思路是降低微分方程的阶数.

#thm-method[
  对于方程
  $
    (dif^n y) / (dif x^n) = f(x)
  $

  直接求积分 $n$ 次即可
]

#thm-method[
  #show math.equation: math.display
  对于不显含未知函数 $y$ 的微分方程
  $
    F(
      x,
      (dif^k y) / (dif x^k),
      dots.c,
      (dif^n y) / (dif x^n)
    ) = 0
  $

  令 $(dif^k y) / (dif x^k) = z$，则将方程降低 $k$ 阶，此时方程变为
  $
    F(
      x,
      z,
      dots.c,
      (dif^(n-k) z) / (dif x^(n-k))
    ) = 0
  $
]
#thm-explain[
  #show math.equation: math.display
  例如方程
  $
    (dif^5 y) / (dif x^5)
    -
    1/x (dif^4 y) / (dif x^4) = 0
  $

  令 $(dif^4 y) / (dif x^4) = z$，则有
  $
    difzx = 1/x z
  $

  积分得 $z = C_1^* x$ 即 $(dif^4 y) / (dif x^4) = C_1^* x$

  再积分，得*通解*
  $
    y = C_1 x^5 + C_2 x^3 + C_3 x^2 + C_4 x + C_5
  $
]

#thm-method[
  对于 $n$ 阶自治微分方程（不显含自变量 $x$）
  $
    F(
      y,
      difyx,
      dots.c,
      (dif^n y) / (dif x^n)
    ) = 0
  $

  我不会 qwq
]
