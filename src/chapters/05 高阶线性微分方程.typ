#import "../definitions.typ": *

= 高阶线性微分方程

== 一般理论

[TODO]

== 常系数高阶线性微分方程

#thm-definition[
  *常系数高阶齐次线性微分方程*
  #eqnum-on[$ y^((n)) + a_1 y^((n-1)) + dots.c + a_(n-1) y' + a_n y = 0 $ <eq-常系数高阶齐次线性微分方程>]

  以及其特征方程
  $ lambda^n + a_1 lambda^(n-1) + dots.c + a_(n-1) lambda + a_n = 0 $
]
#thm-explain[
  由于求解高阶线性微分方程的基解涉及求解特征方程的根，而特征根可能出现重根或复数根，所以我们一步步来，在后续的方法介绍中，我会先从最简单的情况开始说明，并逐步引入更复杂的情况。
]

#thm-method[
  #show math.phi: math.phi.alt
  如果特征方程的根都是实根，并且都不是重根，\
  设这些特征值为 $lambda_1, lambda_2, dots.c, lambda_n$，则原方程 @eq-常系数高阶齐次线性微分方程 的基本解组为
  $
    phi_1 (x) = e^(lambda_1 x),
    wide
    phi_2 (x) = e^(lambda_2 x),
    wide dots.c wide
    phi_n (x) = e^(lambda_n x)
  $

  @eq-常系数高阶齐次线性微分方程 的通解为
  $
    y = C_1 phi_1 + C_2 phi_2 + dots.c + C_n phi_n
  $
]

#thm-example[
  求解方程
  $
    (dif^2 y) / (dif x^2) - 2 difyx - 3y = 0
  $
]
#thm-solve[
  特征方程是
  $
    lambda^2 - 2lambda - 3 = 0
  $

  它有两个特征根 $lambda_1 = -1$，$lambda_2 = 3$. 所以，通解是
  $
    y = C_1 e^(-x) + C_2 e^(3x)
  $
]

#thm-method[
  如果特征方程的某个根 $lambda_0$ 是 $k$ 重根，那么

  $ 
    e^(lambda_0 x), 
    wide
    x dot e^(lambda_0 x),
    wide dots.c wide
    x^(k-1) dot e^(lambda_0 x)
  $
  
  是原方程基解（的一部分）
]
#thm-explain[
  例如，如果某个特征方程的根由 $lambda_1 = 5$（三重根）和 $lambda_2 = 3$（单根），那么原方程的基本解组为
  $
    e^(5x), quad x e^(5x), quad x^2 e^(5x), quad e^(3x)
  $

  从而，通解是
  $
    y = C_1 e^(5x) + C_2 x e^(5x) + C_3 x^2 e^(5x) + C_4 e^(3x)
  $
]

#thm-example[
  求解方程
  $
    (dif^2 y) / (dif x^2) + 2 difyx + y = 0
  $
]
#thm-solve[
  特征方程是
  $
    lambda^2 + 2lambda + 1 = 0
  $

  它有一个二重特征根 $lambda_1 = -1$. 所以，通解是
  $
    y = C_1 e^(-x) + C_2 x e^(-x)
  $
]

#let ui = $upright(i)$

#thm-method[
  如果特征方程的某个根是复值 $alpha + ui beta$，那么必然还有一个根 $alpha - ui beta$，并且
  $
    e^(alpha x) cos beta x, wide e^(alpha x) sin beta x
  $

  是原方程基解（的一部分）
]
#thm-explain[
  因为 $e^((alpha + ui beta)x) = e^(alpha x) (cos beta x + ui sin beta x)$，所以根据实部虚部可以分别作为解，可得结论
]

#thm-example[
  求解方程
  $
    y'' + y = 0
  $
]
#thm-solve[
  特征方程为
  $
    lambda^2 + 1 = 0
  $

  解得特征根 $lambda_1 = ui$，$lambda_2 = -ui$，故 $cos x$ 和 $sin x$ 构成原方程的基本解组，于是通解为
  $
    y = C_1 cos x + C_2 sin x
  $
]

== 非齐次线性方程——常数变易法

#thm-method[
  高阶微分方程
  $ y^((n)) + a_1 y^((n-1)) + dots.c + a_(n-1) y' + a_n y = f(x) $

  有对应的齐次线性方程
  $ y^((n)) + a_1 y^((n-1)) + dots.c + a_(n-1) y' + a_n y = 0 $

  根据特征根求出齐次线性方程的基本解组
  $
    phi.alt_1(x), quad phi.alt_2(x), quad dots.c quad phi.alt_n (x)
  $

  于是齐次线性方程有通解
  $
    y^* = C_1 phi.alt_1(x) + C_2 phi.alt_2(x) + dots.c + C_n phi.alt_n (x)
  $

  将这些常数 $C_1, dots.c, C_n$ 替换为 $C_1(x), dots.c, C_n (x)$，\
  也就是设 $y = C_1(x) phi.alt_1(x) + C_2(x) phi.alt_2(x) + dots.c + C_n (x) phi.alt_n (x)$

  #let elem(a, b) = $C'_1(x) #a _1(x) + dots.c + C'_n (x) #a _n (x) = #b$
  #set math.cases(gap: 0.7em)

  并求解方程组#text(luma(50%))[（该方程组由 $Phi(x) C'(x) = bold(f)(x)$ 得）]
  $
    cases(
      elem(phi.alt, 0),
      elem(phi.alt', 0),
      dots.c dots.c dots.c dots.c,
      elem(phi.alt^((n-2)), 0),
      elem(phi.alt^((n-1)), f(x)),
    ) 
  $
  #text(luma(50%))[（注意观察，这里每往下一行，$phi.alt$ 就多导一次，并且只有最后一行是 $=f(x)$）]

  解得 $C'_1(x), dots.c, C'_n (x)$ 的表达式，再求积分即得 $C_1(x), dots.c, C_n (x)$，\
  代回 $y = C_1(x) phi.alt_1(x) + C_2(x) phi.alt_2(x) + dots.c + C_n (x) phi.alt_n (x)$ 就得到了原方程的*通解*
]

#thm-example[
  求解方程
  $
    y'' + y = 1 - 1/(sin x)
  $
]
#thm-solve[
  #show math.equation: math.display
  特征方程 $lambda^2 + 1 = 0$ 解得 $lambda_1 = upright(i)$，$lambda_2 = -upright(i)$，得到对应齐次线性方程的基本解组
  $
    phi.alt_1(x) = cos x, quad phi.alt_2(x) = sin x
  $

  于是齐次线性方程有通解
  $
    y^* = C_1 cos x + C_2 sin x
  $

  使用常数变易法，把 $C_1$ 和 $C_2$ 替换为待定函数 $C_1(x)$ 和 $C_2(x)$，\
  也就是设 $y = C_1(x) cos x + C_2(x) sin x$

  #v(0.5em)

  由 #[
    #set math.cases(gap: 0.5em)
    $cases(
    C'_1 (x) phi.alt_1(x) + C'_2 (x) phi.alt_2(x) = 0,
    C'_1 (x) phi.alt'_1(x) + C'_2 (x) phi.alt'_2(x) = f(x),
  )$]，并且在该题中非齐次项 $f(x) = 1 - 1 / (sin x)$，得到
  $
    cases(
      C'_1 (x) cos x &+ C'_2 (x) sin x &= 0,
      C'_1 (x) (-sin x) &+ C'_2 (x) cos x &= 1 - display(1/(sin x)),
    )
  $

  解得
  $
    C'_1 (x) = 1 - sin x, quad C'_2 (x) = cos x - (cos x) / (sin x)
  $

  积分得
  $
    C_1 (x) = x + cos x + C_1, quad C_2 (x) = sin x - ln abs(sin x) + C_2
  $

  从而原方程的通解为
  $
    y
    &#text(gray)[$= C_1(x) cos x + C_2(x) sin x$] \
    &= C_1 cos x + C_2 sin x + x cos x + 1 - sin x ln abs(sin x)
  $
]

#thm-warn[
  我们指出：对常系数非齐次线性微分方程，用常数变易法总能将通解表达出来，这是具有一般性的方法. 但在用常数变易法求特解的过程中，还需要计算积分.
  
  有时积分并不容易表达出来，因此对具有某些特殊形式的 $f(x)$ 的微分方程，还可以用其它的方法求其特解，在后续的几节展开介绍.
]

== 非齐次线性方程——待定系数法

现在我们讨论非齐次项 $f(x)$ 的两种特殊形式，以便求解对应的高阶微分方程
#eqnum-on[$
  y^((n)) + a_1 y^((n-1)) + dots.c + a_(n-1) y' + a_n y = f(x)
$ <eq-高阶微分方程>]

#thm-method[
  #set math.cases(gap: 0.7em)
  若 $f(x)$ 具有这样的形式：
  $
    f(x) = P_m (x) e^(mu x)
  $

  其中 $mu$ 为实常数，$P_m (x)$ 表示 $x$ 的 $m$ 次多项式，如 $f(x) = (x^2 - 2x - 1)e^(x)$，$f(x)=e^(2x)$ 等

  那么 @eq-高阶微分方程 有如下形式的特解：
  $
    phi.alt^* (x) = cases(
      &Q_m (x) e^(mu x)\, quad #[当 $space mu$ 不是特征根时],
      x^k&Q_m (x) e^(mu x)\, quad #[当 $space mu space$ 是 $space k$ 重特征根时]
    )
  $

  其中 $Q_m (x)$ 是 $m$ 次待定多项式，我们可以把 $phi.alt^* (x)$ 代回 @eq-高阶微分方程 从而得出 $Q_m (x)$ 的表达式.
] <method-非齐次线性方程-待定系数法1>
#thm-explain[
  这里将 $phi.alt^* (x)$ 分为 $mu$ 是否是特征根进行讨论，不妨思考一下，如果把“不是特征根”的情况看成“$0$ 重特征根”呢？
]

#thm-example[
  求解微分方程
  $
    y'' + 6y' + 5y = e^(2x)
  $
]
#thm-solve[
  特征方程 $lambda^2 + 6lambda + 5 = 0$ 解得 $lambda_1 = -1$，$lambda_2 = -5$，得对应齐次线性方程的基本解组：
  $
    phi.alt_1(x) = e^(-x), wide phi.alt_2(x) = e^(-5x)
  $

  现在用 @method-非齐次线性方程-待定系数法1 求原方程的一个特解，\
  因为 $mu=2$ 不是特征根，故可设特解：
  $
    y^* = A dot e^(2x)
  $
  #text(gray)[
    （这里的系数 $A$ 即为方法中提到的 $Q_m (x)$，因为这里 $P_m (x) = 1$，所以只需设一个常数 $A$）

    （举个例子，如果 $P_m (x) = x + 3$ 就得设 $Q_m (x) = A x + B$ 了）
  ]

  代入原方程，得到
  $
    (A dot e^(2x))'' + 6(A dot e^(2x))' + 5(A dot e^(2x)) = e^(2x)
  $

  即 $4A dot e^(2x) + 12 A dot e^(2x) + 5A dot e^(2x) = e^2x$，解得 $A = 1/21$，所以原方程的一个特解为
  $
    y^* = 1/21 e^(2x)
  $

  #pinit-highlight(1, 2, fill: pinit-c1)
  #pinit-highlight(3, 4, fill: pinit-c2)
  #pinit-highlight(5, 6, fill: pinit-c1)
  #pinit-highlight(7, 8, fill: pinit-c2)
  于是原方程的通解（齐次方程#pin(1)通解#pin(2) + 原方程#pin(3)特解#pin(4)）为
  $
    y = #pin(5)C_1 e^(-x) + C_2 e^(-5x)#pin(6) + #pin(7)1/21 e^(2x)#pin(8)
  $
]

#thm-method[
  #set math.cases(gap: 0.7em)
  若 $f(x)$ 具有这样的形式：
  $
    f(x) = [A_m_1 (x) cos(beta x) + B_m_2 (x) sin(beta x)] e^(alpha x)
  $

  其中 $A_m_1 (x)$ 和 $B_m_2 (x)$ 分别是 $x$ 的 $m_1$ 次和 $m_2$ 次多项式，那么 @eq-高阶微分方程 有如下形式的特解：
  $
    phi.alt^* (x) = cases(
      &[C_n (x) cos(beta x) + D_n (x) sin(beta x)] e^(alpha x)
      \, quad #[当 $space alpha + upright(i) beta$ 不是特征根时],

      x^k&[C_n (x) cos(beta x) + D_n (x) sin(beta x)] e^(alpha x)
      \, quad #[当 $space alpha + upright(i) beta space$ 是 $space k$ 重特征根时]
    )
  $

  其中 $C_n (x)$ 和 $D_n (x)$ 是 $n$ 次待定多项式，$n = max{m_1, m_2}$
] <method-非齐次线性方程-待定系数法2>
#thm-explain[
  因为这里的 $C_n (x)$ 和 $D_n (x)$ 是待定项，所以需要 $n = max{m_1, m_2}$，取最大的次数以便保证可以代入原方程求解，因为我们无法保证更小的数是“足够”的.
]
#thm-explain[
  $f(x) = [A_m_1 (x) cos(beta x) + B_m_2 (x) sin(beta x)] e^(alpha x)$ 的结构是否有点晦涩？

  其实你可以思考一下，这个结构和使用 Euler 公式展开复数幂次
  $
    e^((alpha + upright(i) beta) x) = [cos(beta x) + upright(i) sin(beta x)]e^(alpha x)
  $

  有异曲同工之处.
]

#thm-example[
  求解微分方程
  $
    y'' + y = sin x
  $
] <example-yysinx>
#thm-solve[
  特征方程 $lambda^2 + 1 = 0$ 解得 $lambda_1 = upright(i), lambda_2 = -upright(i)$，得对应齐次线性方程的基本解组：
  $
    phi.alt_1(x) = cos x, wide phi.alt_2(x) = sin x
  $

  现在用 @method-非齐次线性方程-待定系数法2 求原方程的一个特解，\
  $alpha=0$，$beta=1$，因为 $alpha + upright(i)beta$ 是特征根，故可设特解：
  $
    y^*
    &#text(gray)[$= x(A cos x + B sin x) e^(0x)$] \
    &= A x cos x + B x sin x
  $

  于是可以计算
  $
    (y^*)' &= &(A + B x) cos x &+& (B - A x) sin x \
    (y^*)'' &= &(2B - A x) cos x &-& (2A + B x) sin x
  $
  所以代入原方程，得到
  $
    2 B cos x - 2 A sin x = sin x
  $

  比较系数得
  $
    B = 0, quad A = -1/2
  $

  所以原方程的一个特解为
  $
    y^* = -1/2 x cos x
  $

  #pinit-highlight(9, 10, fill: pinit-c1)
  #pinit-highlight(11, 12, fill: pinit-c2)
  #pinit-highlight(13, 14, fill: pinit-c1)
  #pinit-highlight(15, 16, fill: pinit-c2)
  于是原方程的通解（齐次方程#pin(9)通解#pin(10) + 原方程#pin(11)特解#pin(12)）为
  $
    y = #pin(13)C_1 cos x + C_2 sin x#pin(14)#pin(15)-1/2x cos x#pin(16)
  $
]

#thm-example[
  求解微分方程
  $
    y'' + y = sin omega x, quad omega > 0
  $
]
#thm-solve[
  由于 $1 dot upright(i)$ 是特征根，所以该题需要考虑 $omega = 1$ 与 $omega != 1$ 的情况.

  当 $omega = 1$ 时，即为 @example-yysinx 的情况，不再赘述

  当 $omega != 1$ 时，可以设方程有形如
  $
    y^*
    &#text(gray)[$= (A cos omega x + B sin omega x) e^(0x)$] \
    &= A cos omega x + B sin omega x
  $

  的特解，可以计算
  $
    (y^*)' &= &-A omega sin omega x &+& B omega cos omega x \
    (y^*)'' &= &-A omega^2 cos omega x &-& B omega^2 sin omega x
  $

  代入原方程得
  $
    A(1-omega^2) cos omega x + B(1-omega^2) sin omega x = sin omega x
  $

  比较系数得
  $
    A = 0, quad B = 1/(1-omega^2)
  $

  由此得出特解
  $
    y^* = 1/(1-omega^2) sin omega x
  $

  #pinit-highlight(17, 18, fill: pinit-c1)
  #pinit-highlight(19, 20, fill: pinit-c2)
  #pinit-highlight(21, 22, fill: pinit-c1)
  #pinit-highlight(23, 24, fill: pinit-c2)
  于是原方程的通解（齐次方程#pin(17)通解#pin(18) + 原方程#pin(19)特解#pin(20)）为
  $
    y = #pin(21)C_1 cos x + C_2 sin x#pin(22) + #pin(23)1/(1-omega^2) sin omega x#pin(24)
  $

  综上所述
  
  #result[$
    y = cases(
      C_1 cos x + C_2 sin x - 1/2x cos x\, &quad omega=1,
      C_1 cos x + C_2 sin x + 1/(1-omega^2) sin omega x\, &quad omega!=1
    )
  $]
]

== 非齐次线性方程——叠加原理

#thm-method[
  为了叙述方便，设（线性微分算子）
  $
    L[y] =y^((n)) + a_1 y^((n-1)) + dots.c + a_(n-1) y' + a_n y
  $
  对于前一节所述类型的两个微分方程 $L[y] = f_1(x)$ 和 $L[y] = f_2(x)$，如果
  #align(center)[
    $y_1(x)$ 是 $L[y] = f_1(x)$ 的解\
    $y_2(x)$ 是 $L[y] = f_2(x)$ 的解
  ]

  那么
  #align(center)[
    $y_1(x) + y_2(x)$ 是 $L[y] = f_1(x) + f_2(x)$ 的解
  ]

  我们称之为*叠加原理*，通过这一原理，我们可以将 $L[y] = f_1(x) + f_2(x)$ 拆分成两个方程 $L[y] = f_1(x)$ 和 $L[y] = f_2(x)$ 进行求解，并进而得到原方程的解
]
#thm-explain[
  这表明，我们通过 $L[x] = 0$ 求出齐次线性方程通解，并且通过 $L[x] = f_1 (x)$ 和 \
  $L[x] = f_2(x)$ 分别求出两个特解，就可以将原方程 $L[x] = f_1(x) + f_2(x)$ 的*通解*表示为
  $
    y = #box(fill: pinit-c1)[齐次方程通解] + #box(fill: pinit-c2)[特解1] + #box(fill: pinit-c2)[特解2]
  $
]

#thm-example[
  求解微分方程
  $
    y'' - 4y' + 8y = e^(2x) + sin 2x
  $
]
#thm-solve[
  特征方程 $lambda^2 - 4lambda + 8 = 0$ 解得 $lambda_1 = 2 + 2upright(i)$，$lambda_2 = 2 - 2upright(i)$ 于是得基本解组：
  $ e^(2x) cos 2x, wide e^(2x) sin 2x $

  #line(length: 100%, stroke: (paint: luma(80%), dash: "dashed"))

  对于方程
  $
    y'' - 4y' + 8y = e^(2x)
  $

  设其特解
  $
    y_1 = A dot e^(2x)
  $

  代入解得 $A=1/4$，于是得特解 $y_1 = 1/4 e^(2x)$

  #line(length: 100%, stroke: (paint: luma(80%), dash: "dashed"))

  对于方程
  $
    y'' - 4y' + 8y = sin 2x
  $

  设其特解
  $
    y_2 = A cos 2x + B sin 2x
  $

  代入解得 $A = 1/10$，$B = 1/20$，于是得特解 $y_2 = 1/10 cos 2 x + 1/20 sin 2 x$
  
  #line(length: 100%, stroke: (paint: luma(80%), dash: "dashed"))

  所以，原方程的*通解*为
  #pinit-highlight(1, 2, fill: pinit-c1)
  #pinit-highlight(3, 4, fill: pinit-c2)
  #pinit-highlight(5, 6, fill: pinit-c2)
  $
    y 
    = #pin(1)C_1 e^(2x) cos 2x + C_2 e^(2x) sin 2x#pin(2) 
    + #pin(3)1/4 e^(2x)#pin(4) 
    + #pin(5)1/10 cos 2x + 1/20 sin 2x#pin(6)
  $
]

== \*非齐次线性方程——辅助方程法

#thm-example[
  求解微分方程
  $
    y'' + y = 1/2 cos x
  $
]
#thm-solve[
  #show math.equation: math.display
  利用待定系数法可以求出上面方程的特解，下面再介绍利用辅助方程求特解的方法.

  引入辅助方程
  #eqnum-on[$
    y'' + y = 1/2 e^(upright(i)x)
  $ <eq-辅助方程>]

  因为 $upright(i)$ 是一重特征根，故 @eq-辅助方程 有如下形式的特解：
  $
    phi.alt(x) = A_1 x e^(upright(i)x)
  $

  将其代入方程，得 $A_1 = -upright(i)/4$，于是 @eq-辅助方程 有特解
  $
    phi.alt(x) = -upright(i)/4 x e^(upright(i)x) = x/4 sin x - upright(i)/4 x cos x
  $

  因为原方程的右端 $1/2 cos x$ 是方程 @eq-辅助方程 的右端 $1/2 e^(upright(i)x)$ 的实部，所以原方程有特解
  $
    psi(x) = x/4 sin x
  $

  所以原方程的*通解*为（这里省略求解基本解组的过程）
  #pinit-highlight(7, 8, fill: pinit-c1)
  #pinit-highlight(9, 10, fill: pinit-c2)
  $
    y = #pin(7)C_1 cos x + C_2 sin x#pin(8) + #pin(9)x/4 sin x#pin(10)
  $
]

== Euler 方程

#thm-method[
  Euler 方程具有如下形式
  $
    x^n (dif^n y) / (dif x^n) + a_1 x^(n-1) (dif^(n-1) y) / (dif x^(n-1)) + dots.c + a_(n-1) x (dif y) / (dif x) + a_n y = 0
  $

  我们有办法将这个“变系数线性微分方程”化为“常系数线性微分方程”进行求解.

  我们需要换元令 $x = e^t$ 即有 $t = ln x, quad (x>0)$

  #text(luma(50%))[
    #set text(size: 0.8em)
    则
    #v(-2em)
    $
      & difyx &&= difyt dot diftx &&= e^(-t) difyt \
      & (dif^2 y) / (dif x^2) &&= dif / (dif t) (difyx) dot diftx &&= e^(-2t)((dif^2 y) / (dif t^2) - difyt)
    $
    $ dots.c dots.c dots.c dots.c dots.c $
    $
      (dif^k y) / (dif x^k) = e^(-k t) (
        (d^k y) / (dif t^k)
        +
        beta_1 (dif^(k-1) y) / (dif t^(k-1))
        +
        dots.c
        +
        beta_(k-1) (dif y) / (dif t)
      )
    $

    使用以上代换可以将 $difyx$ 替换为 $difyt$ 并消去 $x^k$ 系数，其中，$beta_1, dots.c, beta_(k-1)$ 是某些常数.
  ]

  #let dift = $dif / (dif t)$
  #let small1(body) = text(size: 0.7em, body)
  #let small2(body) = text(size: 0.85em, body)
  
  事实上，用归纳法可以证明，对于 $x=e^t$，有关系式
  $
    x^k (dif^k y) / (dif x^k)
    = dift (dift - 1) dots.c (dift - k + 1)
    y
  $

  于是，我们就可以依次消去原方程 @eq-Euler-原方程 中的 $x^k$ 系数，得到换元后的方程 @eq-Euler-换元方程，并直接得到其特征方程 @eq-Euler-特征方程
  #eqnum-on(equate[$
    & x^n (dif^n y) / (dif x^n) 
    &+& 
    a_1 x^(n-1) (dif^(n-1) y) / (dif x^(n-1)) 
    &+& 
    dots.c
    &+& 
    a_(n-1) x (dif y) / (dif x) 
    &+
    a_n y 
    &=& 
    0
    #<eq-Euler-原方程> \

    & small1(dift (dift - 1) dots.c (dift - n + 1) y)
    &+&
    a_1 small1(dift (dift - 1) dots.c (dift - n + 2) y)
    &+&
    dots.c
    &+&
    a_(n-1) dift y 
    &+
    a_n y 
    &=&
    0
    #<eq-Euler-换元方程> \

    & small2(lambda (lambda - 1) dots.c (lambda - n + 1))
    &+&
    a_1 small2(lambda (lambda - 1) dots.c (lambda - n + 2))
    &+&
    dots.c
    &+&
    a_(n-1) lambda 
    &+
    a_n 
    &=&
    0
    #<eq-Euler-特征方程>
  $])

  通过特征方程，解出 $y$-$t$ 方程的解，代回 $t = ln x$，从而得到原方程的解.

  对 $x<0$，令 $x=-e^t$，结果也一样.
]

#thm-example[
  求解微分方程
  $
    x^2 (dif^2 y) / (dif x^2) + 3x difyx + y = 0
  $
]
#thm-solve[
  令 $x=e^t$，根据以上方法，可得特征方程
  $
  lambda (lambda-1) + 3lambda + 1 = 0
  $

  即 $lambda^2 + 2lambda + 1 = 0$，解得特征根 $lambda_1 = lambda_2 = -1$，从而得到 $y$-$t$ 方程的通解
  $
    y = e^(-t) (C_1 + C_2 t)
  $

  如果也考虑到变换 $x=-e^t$，则得原方程的通解为
  $
    y = 1/x (C_1 + C_2 ln abs(x))
  $
]

#thm-example[
  求解微分方程
  $
    x^2 y'' + 3x y' + 5y = 0
  $
]
#thm-solve[
  该方程是 Euler 方程，可知特征方程
  $
    lambda (lambda-1) + 3 lambda + 5 = 0
  $

  解得特征根 $lambda_1 = -1 + 2 upright(i)$，$lambda_2 = -1 - 2 upright(i)$，注意到
  $
    abs(x)^(-1+2upright(i))
    =
    e^((-1+2upright(i)) ln abs(x))
    =
    1/abs(x)lr([
      cos(2 ln abs(x))
      +
      upright(i) sin(2 ln abs(x))
    ], size: #150%)
  $

  因而，原方程的通解为
  $
    y = 1/x lr([
      C_1 cos(2 ln abs(x))
      +
      C_2 sin(2 ln abs(x))
    ], size: #150%)
  $
]

#thm-warn[
  对更一般的方程

  #let axb = $a x + b$
  #let dify(n) = $(dif^#n y) / (dif x^#n)$ 
  $
    (axb)^n dify(n) 
    + 
    a_1 (axb)^(n-1) + dify(n-1)
    +
    dots.c
    +
    a_(n-1) (axb) difyx
    +
    a_n y
    =
    0
  $

  此时的变换是令 $axb = e^t$ 或 $axb = -e^t$
]

== \*Laplace 变换法

#let llnode = node.with(fill: blue.lighten(80%), outset: 4pt)

#align(center)[
  #diagram(
    // debug: true,
    llnode((0,0), [原方程]),
    edge("-->", [求解微分方程], stroke: 0.8pt),
    llnode((3,0), [原方程的解]),
    llnode((0,2), [$Y(s)$ 方程]),
    edge("->", [求解方程], stroke: 0.8pt),
    llnode((3,2), [$Y(s)$ 方程的解]),
    edge((0,0), (0,2), "|-|>", [Laplace 变换], stroke: 0.8pt + blue),
    edge((3,2), (3,0), "|-|>", [Laplace 逆变换], stroke: 0.8pt + blue)
  )
]

[TODO]

== 幂级数解法

通过前面的讨论知道，能用初等函数的有限形式求解的微分方程只局限于某些特殊的类型，欲扩大微分方程的求解范围，应该放弃解的“有限形式”，而转向寻求“无限形式”的解. 

幂级数解法对一般的齐次或非齐次线性微分方程都是适用的. 为了说明幂级数解法的思想，本节仅讨论二阶齐次线性微分方程，即考虑
#eqnum-on[$
  A(x) y'' + B(x) y' + C(x) y = 0
$ <eq-幂级数>]

其中 $A(x)$，$B(x)$ 和 $C(x)$ 都在区间 $abs(x-x_0)<r$ 内解析，也就是可以展开成 $(x-x_0)$ 的幂级数
$
  A(x) = sum_(n=0)^oo a_n (x-x_0)^n, quad abs(x-x_0)<r
$

前面在讨论线性微分方程的基本理论时，要求方程的最高阶导数项的系数是 $1$. 因而我们需要考虑 $A(x)$ 的零点. 如果 $A(x_0)!=0$，则称 $x_0$ 为方程的*常点*. 如果 $A(x_0)=0$，则称 $x_0$ 为方程的*奇点*.

#thm-method[
  *常点情形（幂级数解法）*

  若 $x_0$ 是常点（$A(x_0)!=0$），则 @eq-幂级数 可写成
  #eqnum-on[$
    y'' + p(x) y' + q(x) y = 0
  $ <eq-幂级数-常点>]

  其中系数函数
  $
    p(x) = B(x) \/ A(x), wide q(x) = C(x) \/ A(x)
  $

  在 $x_0$ 附近是解析的. 此时，@eq-幂级数-常点 在区间 $abs(x-x_0)<r$ 内有收敛的*幂级数解*
  $
    y = sum_(n=0)^oo C_n (x-x_0)^n
  $
  把这个解代入原方程即可求出各项系数 $C_n$ 的递推公式. 具体来说，其中 $C_0$ 和 $C_1$ 是两个任意常数，而 $C_n space (n>=2)$ 可以从 $C_0$ 和 $C_1$ 出发依次由递推公式确定.
]
#thm-note[
  依据初值条件求解时，$C_0$ 和 $C_1$ 可以通过在 $x_0$ 点的初值条件来决定，\
  即 $C_0=y_0$ 和 $C_1 = y'_0$
]

#thm-example[
  求解 *Legendre 方程*（勒让德，1752-1833，法国数学家）
  $
    (1-x^2) y'' - 2x y' + n(n+1) y = 0
  $

  其中 $n$ 是常数
]
#thm-solve[
  #show math.equation: math.display
  方程可改写成
  $
    y'' - 2x/(1-x^2) y' + (n(n+1))/(1-x^2) y = 0
  $

  #let sumoo = $sum_(k=0)^oo C_k x^k$

  其中 $p(x) = - (2x) / (1-x^2), space q(x) = (n(n+1))/(1-x^2)$，可知原方程在 $abs(x) < 1$#text(size: 0.7em, luma(40%))[（ 即 $abs(x - 0) < 1$ ）]时有幂级数解
  $ y = sumoo #text(0.7em, luma(40%))[（ 即 $sum_(k=0)^oo C_k (x-0)^k space$）] $

  #let cunderline(body) = {
    set text(blue)
    math.underline({
      set text(black)
      body
    })
  }

  代入原方程得
  $
    cunderline(#pin(1) (1-x^2) (sumoo)'' #pin(2))
    - 
    cunderline(#pin(3) 2x (sumoo)' #pin(4)) 
    + 
    n(n+1) (sumoo)
    = 
    0
  $

  #let arrow = align(center,
    {
      v(-0.7em)
      cetz.canvas({
        import cetz.draw: line
    
        line((0,0), (0,-0.4), mark: (end: "stealth"), fill: blue, stroke: blue)
      })
      v(-0.7em)
    }
  )

  #let tgray(body) = {
    set text(luma(50%))
    body
  }

  #let body = [
    $ (1-x^2) (sum_(k=0)^oo k (k-1) C_k x^(k-2)) $

    #arrow

    $ sum_(k=0)^oo k(k-1) C_k x^(k-2) tgray(- sum_(k=0)^oo k(k-1) C_k x^k) $

    #arrow

    $ sum_(k=2)^oo k(k-1) C_k x^(k-2) tgray(- sum_(k=0)^oo k(k-1) C_k x^k) $

    #arrow

    $ sum_(k=0)^oo (k+2)(k+1) C_(k+2) x^k tgray(- sum_(k=0)^oo k(k-1) C_k x^k) $
  ]
  #context pinit-point-to(
    (1,2),
    pin-dx: 10pt,
    pin-dy: 18pt,
    offset-dx: 10pt,
    offset-dy: 40pt,
    body-dx: -measure(body).width / 2,
    body-dy: 8pt,
    fill: blue,
    body
  )
  
  #let body = [
    $ 2x (sum_(k=0)^oo k C_k x^(k-1)) $

    #arrow

      $ sum_(k=0)^oo 2k C_k x^k $
  ]
  #context pinit-point-to(
    (3,4),
    pin-dx: 30pt,
    pin-dy: 18pt,
    offset-dx: 70pt,
    offset-dy: 40pt,
    body-dx: -measure(body).width / 2,
    body-dy: 8pt,
    fill: blue,
    body
  )

  #v(21em)
  
  整理得
  $
    sum_(k=0)^oo 
    lr([
      (k+2)(k+1) C_(k+2)
      -
      (k-1)k C_k
      -
      2k C_k
      +
      n(n+1) C_k
    ], size: #120%)
    x^k = 0
  $

  即
  $
    sum_(k=0)^oo
    lr([
      (k+2)(k+1) C_(k+2)
      +
      (n+k+1)(n-k) C_k
    ], size: #120%)
    x^k = 0
  $

  由此得递推公式
  $(k+2)(k+1) C_(k+2)
    +
    (n+k+1)(n-k) C_k
    = 0$
  即
  $
    C_(k+2) = - ((n-k) dot (n+k+1)) / ((k+2)(k+1)) C_k
  $

  还记得我们设的幂级数解是 $y = sumoo$ 吗？$k = 0, 1, 2, dots.c$

  所以我们可以基于 $C_0$ 和 $C_1$，将其余的 $C_k$ 用 $C_0$ 或 $C_1$ 表示.
  
  #let lrm(body) = $lr([body], size: #150%)$
  例如，对于从 $C_0$ 开始的 $k$ 为偶数的项而言：
  $
    C_2
    &=
    - (n dot (n+1)) / 2! C_0 \

    #pinit-highlight("a1", "a2", fill: blue.lighten(90%))
    #pinit-highlight("a3", "a4", fill: blue.lighten(90%))
    #pinit-highlight("b1", "b2", fill: orange.lighten(90%))
    #pinit-highlight("b3", "b4", fill: orange.lighten(90%))

    C_4
    &=
    - (
      #pin("a1")#[$(n-2)$]#pin("a2")
      dot 
      #pin("b1")#[$(n+3)$]#pin("b2")
    ) / (4 dot 3) C_2
    =
    (-1)^2 (
      lrm( #pin("a3")#[$(n-2)$]#pin("a4") n ) 
      dot 
      lrm( (n+1)#pin("b3")#[$(n+3)$]#pin("b4") )
    ) / 4! C_0 \

    #v(1em)
    dots.c dots.c &dots.c dots.c dots.c dots.c \

    C_(2m)
    &=
    (-1)^m (
      lrm( (n-2m+2) dots.c (n-2)n )
      dot
      lrm( (n+1)(n+3) dots.c (n+2m-1) )
    ) / (2m)! C_0
  $

  // #pinit-fletcher-edge(
  //   fletcher,
  //   ("a1", "a2"),
  //   end: ("a3", "a4"),
  //   (1,0),
  //   start-dy: -10pt,
  //   bend: 20deg,
  //   "->",
  //   stroke: blue
  // )
  // #pinit-fletcher-edge(
  //   fletcher,
  //   ("b1", "b2"),
  //   end: ("b3", "b4"),
  //   (1,0),
  //   start-dy: -10pt,
  //   bend: 20deg,
  //   "->",
  //   stroke: green
  // )

  对于从 $C_1$ 开始的 $k$ 为奇数的项而言：
  $
    C_3
    &=
    - ((n-1) dot (n+2)) / (3 dot 2) C_1 \

    #pinit-highlight("c1", "c2", fill: blue.lighten(90%))
    #pinit-highlight("c3", "c4", fill: blue.lighten(90%))
    #pinit-highlight("d1", "d2", fill: orange.lighten(90%))
    #pinit-highlight("d3", "d4", fill: orange.lighten(90%))

    C_5
    &=
    - (
      #pin("c1")#[$(n-3)$]#pin("c2") 
      dot 
      #pin("d1")#[$(n+4)$]#pin("d2")
    ) / (5 dot 4) C_3
    =
    (-1)^2 (
      lrm( #pin("c3")#[$(n-3)$]#pin("c4")#[$(n-1)$] ) 
      dot 
      lrm( (n+2)#pin("d3")#[$(n+4)$]#pin("d4") )
    ) / 5! C_1 \

    #v(1em)
    dots.c dots.c &dots.c dots.c dots.c dots.c \

    C_(2m+1)
    &=
    (-1)^m (
      lrm( (n-2m+1) dots.c (n-3)(n-1) )
      dot
      lrm( (n+2)(n+4) dots.c (n+2m) )
    ) / (2m+1)! C_1
  $

  因此，Legendre 方程的幂级数解为
  
  #result[$
    y = sum_(k=0)^oo (
      C_(2k) x^(2k)
      +
      C_(2k+1) x^(2k+1)
    )
  $]
]
#thm-note[
  若记
  $
    y_1(x) &= 1 -
    (n(n+1)) / 2! x^2
    +
    ((n-2)n(n+1)(n+3)) / 4! x^4
    - dots.c \

    y_2(x) &= x -
    ((n-1)(n+2)) / 3! x^3
    +
    ((n-3)(n-1)(n+2)(n+4)) / 5! x^5
    - dots.c
  $

  易见，$y_1(x)$ 和 $y_2(x)$ 是线性无关的，Legendre 方程的幂级数解可以写成
  $
    y = C_0 y_1 (x) + C_1 y_2 (x), quad -1 < x < 1
  $
]
#thm-warn[
  还有关于 *Legendre 多项式*、*Rodrigues 公式* 等内容，请参阅原教材
]

#thm-method[
  *奇点情形（广义幂级数解法）*

  若 $x_0$ 是奇点（$A(x_0)=0$），$A(x) y'' + B(x) y' + C(x) y = 0$ 一般不再具有幂级数形式的通解，而且在奇点 $x_0$ 的初值问题可能是无解的，但我们可以考虑这样的形式：
  #eqnum-on[$
    (x-x_0)^2 y'' + (x-x_0) P(x) y' + Q(x) y = 0
  $ <eq-幂级数-奇点>]

  其中 $P(x)$，$Q(x)$ 在 $x_0$ 点附近可展成 $(x-x_0)$ 的幂级数\
  #text(luma(40%), size: 0.8em)[（即在常点情形的 @eq-幂级数-常点 中，$(x-x_0) p(x)$ 和 $(x-x_0)^2 q(x)$ 可展成 $(x-x_0)$ 的幂级数）]

  则方程 @eq-幂级数-奇点 有收敛的*广义幂级数解*
  $
    y = sum_(k=0)^oo C_k (x-x_0)^(k+rho) quad (C_0 != 0)
  $

  其中*指标* $rho$ 和系数 $C_k space (k >= 1)$ 可以用代入法确定\
  #text(luma(40%), size: 0.8em)[（可以发现，相比常点情形中需要用代入法确定 $C_k$，在奇点情形中多了一个需要确定的 $rho$）]
]

#thm-example[
  求解 *Bessel 方程*（贝塞尔，1784-1846，德国天文学家）
  #eqnum-on[$
    x^2 y'' + x y' + (x^2 - n^2) y = 0
  $ <eq-Bessel方程>]

  其中常数 $n>=0$
]
#thm-solve[
  与 @eq-幂级数-奇点 比较，$x_0 = 0$；$P(x) = 1$ 与 $Q(x)=x^2-n^2$ 可在区间 $-oo < x < oo$ 上展成 $x$ 的幂级数. 由方法可知该方程 @eq-Bessel方程 有广义幂级数解

  #let sumoo = $sum_(k=0)^oo C_k x^(k+rho)$
  $ y = sumoo quad (C_0 != 0) $

  // #v(100em)
  其中系数 $C_k space (k>=1)$ 和指标 $rho$ 待定. 将该待定解代入原方程 @eq-Bessel方程 得

  

  #let arrow = align(center,
    {
      v(-0.7em)
      cetz.canvas({
        import cetz.draw: line
    
        line((0,0), (0,-0.4), mark: (end: "stealth"), fill: blue, stroke: blue)
      })
      v(-0.7em)
    }
  )

  #let tgray(body) = {
    set text(luma(50%))
    body
  }

  #let body = [
    $ sum_(k=0)^oo (k+rho) (k+rho-1) C_k x^(k+rho) $
  ]
  #context pinit-point-to(
    (1,2),
    pin-dx: -20pt,
    pin-dy: 18pt,
    offset-dx: -20pt,
    offset-dy: 40pt,
    body-dx: -measure(body).width / 2,
    body-dy: 8pt,
    fill: blue,
    body
  )
  
  #let body = [
    $ sum_(k=0)^oo (k+rho) C_k x^(k+rho) $
  ]
  #context pinit-point-to(
    (3,4),
    pin-dx: 6pt,
    pin-dy: 18pt,
    offset-dx: 6pt,
    offset-dy: 40pt,
    body-dx: -measure(body).width / 2,
    body-dy: 8pt,
    fill: blue,
    body
  )

  #let body = [
    $ tgray(-n^2 sumoo) + sum_(k=0)^oo C_k x^(k+rho+2) $

    #arrow

    $ tgray(-n^2 sumoo) + sum_(k=2)^oo C_(k-2) x^(k+rho) $

    #align(center,
      {
        v(-0.7em)
        cetz.canvas({
          import cetz.draw: line, content
      
          line((0,0), (0,-2), mark: (end: "stealth"), fill: blue, stroke: blue, name: "arrow-line")
          content(("arrow-line.start", 50%, "arrow-line.end"),)[
            #set text(size: 0.8em)
            #box(fill: white, outset: 1pt)[
              #set align(center)
              约定 $C_(-1) = C_(-2) = 0$\
              于是可把求和从 $k=2$ 换成 $k=0$
            ]
          ]
        })
        v(-0.7em)
      }
    )

    $ tgray(-n^2 sumoo) + sum_(k=0)^oo C_(k-2) x^(k+rho) $
  ]
  #context pinit-point-to(
    (5,6),
    pin-dx: 30pt,
    pin-dy: 18pt,
    offset-dx: 30pt,
    offset-dy: 40pt,
    body-dx: -measure(body).width / 2,
    body-dy: 8pt,
    fill: blue,
    body
  )

  #let cunderline(body) = {
    set text(blue)
    math.underline({
      set text(black)
      body
    })
  }

  $
    cunderline(#pin(1) x^2 (sumoo)'' #pin(2)) + cunderline(#pin(3) x (sumoo)' #pin(4)) + cunderline(#pin(5) (x^2-n^2) sumoo #pin(6)) = 0
  $

  #v(21em)
  
  整理得
  $
    sum_(k=0)^oo 
    lr([
      (k+rho)(k+rho-1) C_k
      +
      (k+rho) C_k
      -
      n^2 C_k
      +
      C_(k-2)
    ], size: #120%)
    x^(k+rho) = 0
  $

  它可改写成
  $
    sum_(k=0)^oo
    lr([
      (rho+n+k)(rho-n+k) C_k + C_(k-2)
    ], size: #120%)
    x^(k+rho) = 0
  $

  由此得递推公式
  $
    (rho+n+k)(rho-n+k) C_k + C_(k-2) = 0, quad k=0,1,2,dots.c
  $

  可令 $k=0$ 推得*指标方程*
  $
    (rho+n)(rho-n) = 0
  $

  由此得到两个*指标根*：$rho_1 = n$ 和 $rho_2 = -n$

  #set enum(numbering: "(1).")

  + 当 $rho = rho_1 = n$ 时，递推公式成为
    #eqnum-on[$
    (2n+k)k C_k + C_(k-2) = 0, quad (k=1,2,dots.c)
    $ <eq-幂级数-奇点-n1-递推公式>]

    由此可依次确定 $C_k$，具体来说，对于下标 $k$ 为奇数的情况：
    $
      (2n+1) C_1 + C_(-1) = 0
    $
    因此可得 $C_1 = 0$，进一步可以得到 $C_3 = C_5 = dots.c = C_(2k+1) = dots.c = 0$

    #v(0.5em)

    对于下标 $k$ 为偶数的情况，考虑 @eq-幂级数-奇点-n1-递推公式 递推公式的变形
    $
      C_k = (-1) / (2^2(n+k/2)k/2) C_(k-2)
    $

    得到
    $
      C_2 &= (-1) / (2^2(n+1)) C_0 \
      C_4 &= (-1)^2 / (2^4(n+1)(n+2)2!) C_0 \

      #v(1em)
      dots.c dots.c & dots.c dots.c dots.c dots.c \

      C_(2m) &= (-1)^m / (
        2^(2m) lr([
          (n+1)(n+2) dots.c (n+m)
        ], size: #150%) m!
      ) C_0
    $

    我们可以想办法用阶乘的“形式”简化以上表达式，但由于这里 $n$ 可取任意非负数，不一定是整数，因此我们这里引入 $Gamma$ 函数的记号
    $
      Gamma(p) = integral_0^oo t^(p-1) e^(-t) dif t quad (p>0)
    $
    
    可以认为它是阶乘在非整数的推广，具有性质
    #eqbr-off[$
      & Gamma(p+1) = p Gamma(p) \
      & Gamma(n+k+1) = lr([
        (n+k) dots.c (n+2)(n+1)
      ], size: #150%) dot Gamma(n+1) \
      & Gamma(k+1) = k!
    $]

    并取
    $
      C_0 = 1 / (#pin(1)2^n#pin(2)Gamma(n+1))
    $

    #pinit-highlight-equation-from(
      (1, 2), (1, 2), 
      height: 3em, 
      pos: bottom, 
      fill: rgb(0, 180, 255),
    )[
      #set text(size: 0.8em)
      编者注：我并未理解为什么要有这一项\
      也许只是为了到后面能和 $x^(2k+n)$ 整在一起 
    ]

    #v(3em)
    于是可把上面 $C_(2k)$ 的表达式改写成
    $
      C_(2k) &= (-1)^k / (
        
        lr([
          (n+1)(n+2) dots.c (n+k)
          dot Gamma(n+1)
        ], size: #150%) 
        k!
        dot
        2^(2k) dot 2^n
      ) \

      &= (-1)^k / (
        Gamma(n+k+1) Gamma(k+1)
      )
      dot
      1 / (2^(2k+n))
    $

    于是，对应于指标根 $rho_1 = n$，我们得到 Bessel 方程的一个广义幂级数解
    $
      y 
      = 
      J_n (x) 
      = 
      sum_(k=0)^oo 
      (-1)^k / (
        Gamma(n+k+1) Gamma(k+1)
      )
      (x/2)^(2k+n)
    $

    它在 $-oo < x < oo$ 上收敛，称为*第一类 Bessel 函数*

  + 当 $rho = rho_2 = -n space (n>0)$ 时
  
    累了，这里分类讨论太多了，自己看书吧

  // + 当 $rho = rho_2 = -n space (n>0)$ 时，递推公式 $(rho+n+k)(rho-n+k) C_k + C_(k-2) = 0$ 成为
  //   $
  //     k(k-2n) C_k + C_(k-2) = 0
  //   $

  //   + 当 $2n$ 不等于任何整数

  //     + 当 $2n$ 的小数部分为 $0.5$ 时

  //   + 当 $2n$ 等于某个整数 $N$ 
]

== \*变换法

[TODO]

== \*边值问题

[TODO]
