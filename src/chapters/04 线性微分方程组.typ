#import "../definitions.typ": *
#let by = $bold(y)$
#let bpa = $bold(phi.alt)$
#let ui = $upright(i)$

= 线性微分方程组

微分方程组的一般形式是
#let dy(n) = $(dif y_#n) / (dif x)$
#let fn(n) = $f_#n (x, y_1, dots.c, y_n)$
#set math.cases(gap: 0.6em)
$
  cases(
    dy(1) = fn(1),
    dy(2) = fn(2),
    dots.c dots.c dots.c dots.c,
    dy(n) = fn(n),
  )
$

这里的特点是可以将微分 $dy(i)$ 表示成 $x$ 与 $y_i$ 的函数 $fn(i)$ 的形式

在数学的一些实际应用中，有许多设计非线性微分方程组的问题. 通常对它们采用线性化的方法简化为线性微分方程组的问题，由此获得问题的答案. 因而，研究线性微分方程组是进一步研究一般（非线性）微分方程组的基础.

在后续的几个小节，我们会介绍*齐次线性微分方程组*以及*非齐次线性微分方程组*的求解方法. 与前面类似的思路，我们会先研究*齐次*线性微分方程组的求解，进而研究*非齐次*线性微分方程组的求解.

== 齐次线性微分方程组

#thm-warn[
  该小节涉及较多定理，这里简略叙述，具体请参阅原课本
]

#thm-definition[
  *齐次线性微分方程组*
  #let fn(n) = $a_(#n 1)(x) y_1 + a_(#n 2)(x) y_2 + dots.c + a_(#n n)(x) y_n$
  $
    cases(
      dy(1) = fn(1),
      dy(2) = fn(2),
      #{$dots.c$ * 4},
      dy(n) = fn(n),
    )
  $

  这里的特点是可以将微分 $dy(i)$ 表示成若干 $y_i$ 一次项的和，\
  且每个 $y_i$ 前有个关于 $x$ 的系数 $a_(i j)(x)$

  #line(length: 100%, stroke: gray)

  若记
  $bold(y) = vec(y_1, y_2, dots.v, y_n)$，
  $A(x) = mat(
      a_11 (x), dots.c, a_(1 n) (x);
      dots.v, , dots.v;
      a_(n 1) (x), dots.c, a_(n n) (x);
    )
  $，则齐次线性微分方程组可以表示为向量形式
  #eqnum-on[$
    (dif bold(y)) / (dif x) = A(x) bold(y)
  $ <eq-齐次线性微分方程组>]

  其中 $A(x)$ 称为*系数矩阵*
] <def-齐次线性微分方程组>

#thm-theorem[
  有很多 #by 都满足 @eq-齐次线性微分方程组，由书上的推导可以知道，我们一定能从中找出 $n$ 个线性无关的解 $bpa_1, dots.c, bpa_n$，并将 @eq-齐次线性微分方程组 的通解 $bold(y)$ 表示为
  $
    by = c_1 bpa_1 + c_2 bpa_2 + dots.c + c_n bpa_n
  $
] <thm-齐次线性方程组通解>
#thm-proof[
  这里仅证明当 $bpa_1$ 和 $bpa_2$ 是解时，$by = c_1 bpa_1 + c_2 bpa_2$ 也是解

  因为 $bpa_1$ 和 $bpa_2$ 是解，即 $(dif bpa_1) / (dif x) = A(x) bpa_1$ 且 $(dif bpa_2) / (dif x) = A(x) bpa_2$，因此
  $
    (dif (c_1 bpa_1 + c_2 bpa_2)) / (dif x) 

    text(
      #luma(50%),
      &= c_1 (dif bpa_1) / (dif x) + c_2 (dif bpa_2) / (dif x) \
      
      &= c_1 A(x) bpa_1 + c_2 A(x) bpa_2 \
    )
    &= A(x) (c_1 bpa_1 + c_2 bpa_2)
  $

  即有 $(dif by) / (dif x) = A(x) by$ 成立，于是 $by$ 也是解
]

#thm-definition[
  @eq-齐次线性微分方程组 的*基解矩阵*（这是分块列向量形式）
  $
    Phi(x) = mat(
      augment: #(vline: (1, 2), stroke: (dash: "dashed")),
      bpa_1 (x), bpa_2 (x), bpa_n (x)
    )
  $

  @thm-齐次线性方程组通解 可以写成
  $
    by = Phi(x) C, quad C = vec(c_1, c_2, dots.v, c_n)
  $

  这里的 $C$ 是一个常数向量
]

#thm-theorem[
  如果有一个常数矩阵 $C$ 

  $
    C = mat(
      c_11, dots.c, c_(1 n);
      dots.v, , dots.v;
      c_(n 1), dots.c, c_(n n);
    )
  $
  
  且 $det C != 0$，那么 $Phi(x) C$ 也是基解矩阵
]
#thm-proof[
  因为 $(dif Phi(x)) / (dif x) = A(x) Phi(x)$，所以
  $
    (dif lr((Phi(x) dot C), size: #150%)) / (dif x) 
    text(
      #luma(50%),
      = (dif Phi(x)) / (dif x) C 
      
      = lr((A(x) Phi(x)), size: #200%) C 
    )
    = A(x) lr((Phi(x) C), size: #200%)
  $

  于是 $Phi(x) C$ 也是基解矩阵
]

#thm-example[
  试求微分方程组
  $
    (dif bold(y)) / (dif x)
    =
    mat(1, 1; 0, 1/x) bold(y),
    quad
    bold(y) = vec(y_1, y_2)
  $
]
#thm-solve[
  首先注意系数矩阵 $A(x)$ 当 $x=0$ 时无定义. 将方程组写成分量形式
  $
    cases(
      display(dy(1) = y_1 + y_2),
      display(dy(2) = 1/x y_2)
    )
  $

  由第二式求得 $y_2 = C_2 x$，代入第一式得
  $
    dy(1) = y_1 + C_2 x
  $

  它是一阶线性方程，可求得
  $
    y_1 = C_1 e^x - C_2 (x+1)
  $

  所以，通解是
  $
    vec(y_1, y_2)
    =
    C_1 vec(e^x, 0)
    +
    C_2 vec(-(x+1), x),

    quad x != 0
  $
]

== 非齐次线性微分方程组

#thm-definition[
  *非齐次线性微分方程组*
  #let fn(n) = $a_(#n 1)(x) y_1 + a_(#n 2)(x) y_2 + dots.c + a_(#n n)(x) y_n$
  $
    cases(
      dy(1) = fn(1) + f_1 (x),
      dy(2) = fn(2) + f_2 (x),
      #{$dots.c$ * 4},
      dy(n) = fn(n) + f_n (x),
    )
  $

  若记
  $
    bold(y) = vec(y_1, y_2, dots.v, y_n),
    quad
    A(x) = mat(
      a_11 (x), dots.c, a_(1 n) (x);
      dots.v, , dots.v;
      a_(n 1) (x), dots.c, a_(n n) (x);
    ),
    quad
    bold(f)(x) = vec(
      f_1 (x),
      f_2 (x),
      dots.v,
      f_n (x)
    )
  $

  则齐次线性微分方程组可以表示为向量形式
  $
    (dif bold(y)) / (dif x) = A(x) bold(y) + bold(f)(x)
  $

  这里与*齐次*线性微分方程组的区别在于，多了一个*非齐次项* $bold(f)(x)$
] <def-非齐次线性微分方程组>

在前面章节讨论*齐次一阶线性方程*和*一阶线性方程*时，我们注意到非齐次方程的通解有类似于#highlight(fill: pinit-c1)[齐次方程通解]+#highlight(fill: pinit-c2)[非齐次方程特解]的形式，在方程组中也有类似的特点，这里我们具体说明。

#thm-note(breakable: false, fill: luma(98%), inset: 12pt)[
  #show: eqnum-on
  为了方便以下叙述，这里再写一遍我们将要讨论的方程组的定义

  - 非齐次线性微分方程组
  $
    (dif bold(y)) / (dif x) = A(x) bold(y) + bold(f)(x)
  $ <eq-线性微分方程组-2>
  
  - 齐次线性微分方程组
  $
    (dif bold(y)) / (dif x) = A(x) bold(y)
  $ <eq-齐次线性微分方程组-2>
]

#thm-theorem[
  #show math.phi: math.phi.alt
  如果 $phi(x)$ 是 @eq-线性微分方程组-2 的解，$psi(x)$ 是 @eq-齐次线性微分方程组-2 的解，那么 $phi(x) + psi(x)$ 是 @eq-线性微分方程组-2 的解
]
#thm-proof[
  #show math.phi: math.phi.alt
  这是因为
  $
    dif / (dif x) [phi(x) + psi(x)]

    text(
      #luma(50%),
      &= (dif phi(x)) / (dif x) + (dif psi(x)) / (dif x) \
  
      &= A(x) phi(x) + f(x) + A(x) psi(x) \
    )

    &= A(x) [phi(x) + psi(x)] + f(x)
  $

  于是 $phi(x) + psi(x)$ 满足 @eq-线性微分方程组-2，是它的解，证毕
]

#thm-method[
  #show math.phi: math.phi.alt
  由于我们在上一小节已经讨论了*齐次线性微分方程* @eq-齐次线性微分方程组-2 的求解方法。于是，为了求解*非齐次线性微分方程* @eq-线性微分方程组-2，我们只要再找出 @eq-线性微分方程组-2 的一个#highlight(fill: pinit-c2)[特解]就好了，我们使用常数变易法。

  若我们已经求出基解矩阵，我们在上一小节已经知道，*齐次线性微分方程* @eq-齐次线性微分方程组-2 的通解是
  $
    by = Phi(x) C, quad C = vec(c_1, c_2, dots.v, c_n)
  $

  这里的 $C$ 是常数向量，为了求*非齐次线性微分方程* @eq-线性微分方程组-2 的通解，我们将常数向量 $C$ 替换为待定向量 $C(x)$ 即
  #eqnum-on[$
    bpa(x) = Phi(x) C(x), quad C(x) = vec(c_1 (x), c_2 (x), dots.v, c_n (x))
  $ <eq-线性微分方程-常数变易>]

  把这个待定解代入*非齐次线性微分方程* @eq-线性微分方程组-2 中
  #let cunderline(body) = {
    set text(blue)
    math.underline({
      set text(black)
      body
    })
  }
  $
    (dif lr((Phi(x) C(x)), size: #200%)) / (dif x)
    =
    A(x) lr((Phi(x) C(x)), size: #200%) + bold(f)(x) \

    cunderline(Phi'(x) C(x)) + Phi(x) C'(x) = cunderline(A(x) Phi(x) C(x)) + bold(f)(x)
  $

  因为 $Phi(x)$ 是*齐次线性微分方程* @eq-齐次线性微分方程组-2 的基解矩阵，有 $Phi'(x) = A(x) Phi(x)$，于是画下划线的那两项可以消掉，从而得到
  $
    Phi(x) C'(x) = bold(f)(x)
  $

  由此求得
  $
    C(x) = integral Phi^(-1) (x) bold(f)(x) dif x
  $

  于是代回 @eq-线性微分方程-常数变易，得到*非齐次线性微分方程* @eq-线性微分方程组-2 的一个特解
  $
    phi(x) = Phi(x) integral Phi^(-1) (x) bold(f)(x) dif x
  $

  于是，使用#highlight(fill: pinit-c1)[通解]+#highlight(fill: pinit-c2)[特解]的形式，得到*非齐次线性微分方程*的通解
  #eqnum-on[$
    #pinit-highlight(1, 2, fill: pinit-c1)
    #pinit-highlight(3, 4, fill: pinit-c2)
    by 
    &= #pin(1)Phi(x) C#pin(2) + #pin(3)Phi(x) integral Phi^(-1) (x) bold(f)(x) dif x#pin(4) \
    &= Phi(x) (C + integral Phi^(-1) (x) bold(f)(x) dif x)
  $ <eq-非齐次线性微分方程-通解>]
]

== 常系数齐次线性微分方程组

在前面的讨论中，我们并没有给出基解矩阵具体的求法，本节将讨论范围限制于常系数线性微分方程组，给出其基解矩阵的求法。

这里我们同样遵循找出“齐次方程组的求解方法”，进而找出“非齐次方程组的求解方法”的思路，因此我们先对齐次方程组展开说明，并找到求出其基解矩阵的方法。

#thm-definition[
  *常系数齐次线性微分方程组*
  #eqnum-on[$ (dif by) / (dif x) = A by $ <eq-常系数齐次方程组>]

  其中，与 @def-齐次线性微分方程组 的 $(dif by) / (dif x) = A(x) by$ 的不同之处，在于这里的 $A$ 是常数矩阵，与 $x$ 无关
]

#thm-explain[
  由于求解齐次方程组的基解矩阵涉及求解系数矩阵 $A$ 的特征值，而特征值又可能出现重根或复数根，所以我们一步步来，在后续的方法介绍中，我会先从最简单的情况开始说明，并逐步引入更复杂的情况。
]

#let br = $bold(r)$

#thm-method[
  #show math.phi: math.phi.alt
  如果矩阵 $A$ 的特征值都是实根，并且都不是重根，\
  设这些特征值为 $lambda_1, lambda_2, dots.c, lambda_n$，对应的特征向量为 $br_1, br_2, dots.c, br_n$，则 @eq-常系数齐次方程组 的基本解组为

  $ 
    phi_1 (x) = e^(lambda_1 x) br_1,
    wide
    phi_2 (x) = e^(lambda_2 x) br_2,
    wide dots.c wide
    phi_n (x) = e^(lambda_n x) br_n
  $

  即 @eq-常系数齐次方程组 的基解矩阵为（这是分块列向量的形式）
  $
    Phi(x) = mat(
      augment: #(vline: (1, 2, 3), stroke: (dash: "dashed")),
      gap: #1em,
      bpa_1 (x), bpa_2 (x), dots.c, bpa_n (x)
    )
  $

  @eq-常系数齐次方程组 的通解为
  $
    by = C_1 phi_1 + C_2 phi_2 + dots.c + C_n phi_n
  $
] <method-常系数齐次方程组-单根>

#thm-example[
  求解常系数齐次线性微分方程组的初值问题：
  $
    (dif by) / (dif x) = mat(1, 2; 4, 3) by,
    quad by(0) = vec(3,3)
  $
]
#thm-solve[
  先求方程组的通解，由特征方程
  $
    abs(A - lambda I) 
    = lambda^2 - 4lambda - 5 
    = (lambda - 5)(lambda + 1)
    = 0
  $

  得特征根 $lambda_1 = 5$，$lambda_2 = -1$，均是单根，它们的特征向量（求解 $(lambda_i I - A) br_i = 0$）分别为
  $
    br_1 = vec(1,2), quad br_2 = vec(1,-1)
  $

  所以原方程的通解为
  $
    by
    =
    C_1 e^(5x) vec(1,2) + C_2 e^(-x) vec(&1,-&1)
  $

  我们代入初值条件 $by(0) = vec(3,3)$，得
  $
    cases(&C_1 + C_2 = 3, 2&C_1 - C_2 = 3)
  $

  解得 $C_1 = 2$，$C_2 = 1$，从而所求的解为
  
  #result[$
    y = 2 e^(5x) vec(1,2) + e^(-x) vec(&1,-&1)
  $]
]

#thm-warn[
  接下来的描述会涉及矩阵指数函数 $e^(x A)$，书上对其给出了一定篇幅的说明，这里略去.
  
  但是，如果要简略地说明一下的话，你应当知道 $e^(x A)$ 的特点在于，它不仅是原方程的一个基解矩阵，而且还满足 $x=0$ 时，$e^(x A)$ = $e^O = I$ 成为单位阵，所以 $e^(x A)$ 也被称为*标准基解矩阵*.
]

#thm-method[
  矩阵 $A$ 想的特征值有可能出现复数根，此时，我们求出的基解矩阵 $Phi(x)$ 将会含有虚数项. 但是，我们仍希望能完全用实数来表示方程的基解矩阵，以下介绍两种方法.

  #line(length: 100%, stroke: blue.lighten(50%))

  *方法一* #h(1em) 因为 $Phi(x)$ 和 $e^(x A)$ 二者都是基解矩阵，所以一定存在一个常数矩阵 $P$，使得 #box[$Phi(x) = e^(x A) P$]，代入 $x=0$ 即得 $P = Phi(0)$，所以通过 $e^(x A) = Phi(x) Phi^(-1)(0)$ 即可得到实的基解矩阵.
  
  #line(length: 100%, stroke: blue.lighten(50%))

  *方法二* #h(1em) 可以证明，如果方程有一个复值解
  $
    bold(y)(x) = bold(u)(x) + ui bold(v)(x)
  $

  那么 $bold(u)(x)$ 和 $bold(v)(x)$ 也是方程的解.

  由于复特征值一定是成对（$alpha + ui beta$ 和 $alpha - ui beta$）出现的，所以把这两个特征值的复值解换成 $alpha + ui beta$ 对应解的实部和虚部 $bold(u)(x)$ 和 $bold(v)(x)$ 即可（换成 $alpha - ui beta$ 的也一样）
]

#thm-example[
  求解常系数齐次线性微分方程组
  $
    (dif by) / (dif x) = mat(&1, 1; -&1, 1) by
  $
]
#thm-solve[
  #show math.phi: math.phi.alt
  解得特征根 $lambda_1 = 1 + ui$，$lambda_2 = 1 - ui$
  
  #line(length: 100%, stroke: gray)
  
  *方法一* #h(1em) 求出对应的特征向量
  $ 
    br_1 = vec(1, ui),
    quad
    br_2 = vec(ui, 1)
  $

  于是，得到了两个线性无关的复值解
  $
    phi_1 (x) = e^((1+ui)x) vec(1, ui),
    quad
    phi_2 (x) = e^((1-ui)x) vec(ui, 1)
  $

  得基解矩阵
  $
    Phi(x)
    = mat(
      &e^((1+ui)x), ui &e^((1-ui)x);
      ui &e^((1+ui)x), &e^((1-ui)x)
    )
    = e^x mat(
      &e^(ui x), ui &e^(-ui x);
      ui &e^(ui x), &e^(-ui x)
    )
  $

  这是一个复值矩阵，可以通过 $Phi(x) Phi^(-1)(0)$ 求出实的基解矩阵：
  $
    e^(x A)
    &= Phi(x) Phi^(-1)(0) \
    &= e^x mat(
      &e^(ui x), ui &e^(-ui x);
      ui &e^(ui x), &e^(-ui x)
    )
    1/2 mat(
      1, -ui;
      -ui, 1
    ) \
    &= e^x mat(
      &cos x, sin x;
      -&sin x, cos x;
    )
  $

  #line(length: 100%, stroke: gray)

  *方法二* #h(1em) 只需根据 $1 + ui$ 及其特征向量 $br_1 = display(vec(1, ui))$，利用 Euler 公式将复值解写成
  $
    e^((1+ui)x) vec(1, ui)
    = e^x vec(&cos x, -&sin x) + ui e^x vec(sin x, cos x)
  $

  它的实部和虚部是
  $
    e^x vec(&cos x, -&sin x) quad 和 quad e^x vec(sin x, cos x)
  $

  于是可以直接写出实的基解矩阵
  $
    Phi(x) = e^x mat(
      &cos x, sin x;
      -&sin x, cos x;
    )
  $

  这与方法一中求得的结果相同

  #line(length: 100%, stroke: gray)

  最后，原方程组的通解可以写成
  
  #result[$
    by = C_1 e^x vec(&cos x, -&sin x) + C_2 e^x vec(sin x, cos x)
  $]
]

#let cunderline(body) = {
  set text(blue)
  math.underline({
    set text(black)
    body
  })
}

#thm-method[
  #show math.phi: math.phi.alt
  矩阵 $A$ 的特征值有可能是重根，对于这种情况，假设特征值 $lambda_0$ 的重数是 $k$，那么我们需要考虑广义特征方程组 $(A-lambda_0 I)^k br = 0$ 从而解出 $k$ 个线性无关的广义特征向量
  $ br_1, quad br_2, quad dots.c quad br_k $
  
  对于每个向量而言，都需要反复地左乘 $k-1$ 次 $(A - lambda_0 I)$，得到如下一串的向量：
  #let cell = grid.cell(
    rowspan: 4, 
    align: horizon,
    $arrow(
      text(
        size: #0.7em,
        space A - lambda_0 I space
      )
    )$
  )
  #align(center)[
    #grid(
      columns: 9,
      gutter: 1em,
      align: center,
  
      $br_1$, cell,
      $br_11$, cell,
      $br_12$, cell,
      grid.cell(
        rowspan: 4,
        align: horizon,
        $dots.c dots.c$
      ),
      cell,
      $br_(1, (k-1))$,
      
      $br_2$,
      $br_21$,
      $br_22$,
      $br_(2, (k-1))$,
      
      $dots.v$,
      $dots.v$,
      $dots.v$,
      $dots.v$,
      
      $br_k$,
      $br_(k 1)$,
      $br_(k 2)$,
      $br_(k, (k-1))$,
    )
  ]

  把这里每行向量以“类似于泰勒展开式的形式”分别加起来作为最终的特征向量，\
  于是得到这 $k$ 个解
  $
    phi_1 (x) &= e^(lambda_0 x) (br_1 + x / 1! dot br_11 + x^2 / 2! dot br_12 + dots.c + x^(k-1) / (k-1)! dot br_(1,(k-1))) \
    phi_2 (x) &= e^(lambda_0 x) (br_2 + x / 1! dot br_21 + x^2 / 2! dot br_22 + dots.c + x^(k-1) / (k-1)! dot br_(2,(k-1))) \
    phi_k (x) &= e^(lambda_0 x) (br_k + x / 1! dot br_(k 1) + x^2 / 2! dot br_(k 2) + dots.c + x^(k-1) / (k-1)! dot br_(k,(k-1)))
  $
]
#thm-explain[
  可以发现，如果这里令 $k=1$，即单根，那么就只会得到 $phi.alt_1 (x) = e^(lambda_0 x) br_1$，这样就回到了 @method-常系数齐次方程组-单根 的情况，这是符合预期的.
]

#thm-example[
  求解线性微分方程组
  $
    (dif by) / (dif x)
    =
    mat(
      3, -&1, 1;
      2, &0, 1;
      1, -&1, 2;
    ) by
  $
]
#thm-solve[
  解得特征根 $lambda_1 = 1$（一重），$lambda_2 = 2$（二重）

  #set enum(numbering: "(1)")

  + 对于 $lambda_1 = 1$（一重），考虑特征方程组 $(A - lambda_1 I) br = 0$，解得特征向量 $vec(0, 1, 1)$，所以对于一重特征根 $lambda_1 = 1$，求出了一个解 $e^x vec(0, 1, 1)$.

  + 对于 $lambda_2 = 2$（二重），考虑广义特征方程组 $(A - lambda_2 I)^2 br = 0$，容易计算

    #let matl2 = $mat(
      1, -1, 1;
      2, -2, 1;
      1, -1, 0;
    )$
    $
      (A - lambda_2 I)^2
      = matl2^2
      = mat(
        &0, 0, 0;
        -&1, 1, 0;
        -&1, 1, 0;
      )
    $
  
    因此，从广义特征方程组 $(A - lambda_2 I)^2 br = 0$ 可以求得两个线性无关的广义特征向量
    $
      br_1 = vec(1, 1, 0), wide br_2 = vec(1, 1, 1)
    $
    
    从而
    $
      br_11 &= (A - lambda_2 I) br_1 = matl2 vec(1, 1, 0) = vec(0, 0, 0) \
      br_21 &= (A - lambda_2 I) br_2 = matl2 vec(1, 1, 1) = vec(1, 1, 0)
    $

    于是，对应于二重特征根 $lambda_2 = 2$，可以求出两个线性无关的解
    $
      e^(2x) (br_1 + x dot br_11) = e^(2x) vec(1, 1, 0),
      wide
      e^(2x) (br_2 + x dot br_21) = e^(2x) vec(1+x, 1+x, 1)
    $

  综上，求得基解矩阵
  $
    Phi(x) = mat(
      0, e^(2x), (1+x) e^(2x);
      e^x, e^(2x), (1+x) e^(2x);
      e^x, 0, e^(2x)
    )
  $

  所以，方程组的通解可以写为
  $
    by 
    = C_1 e^x vec(0, 1, 1)
    + C_2 e^(2x) vec(1, 1, 0)
    + C_3 e^(2x) vec(1+x, 1+x, 1)
  $
]

== 常系数线性微分方程组

#thm-definition[
  *常系数齐次线性微分方程组*
  $ (dif by) / (dif x) = A by + bold(f)(x) $

  其中，与 @def-非齐次线性微分方程组 的 $(dif by) / (dif x) = A(x) by + bold(f)(x)$ 的不同之处，在于这里的 $A$ 是常数矩阵，与 $x$ 无关
]

#thm-method[
  代入 @eq-非齐次线性微分方程-通解

  $
    #pinit-highlight(1, 2, fill: pinit-c1)
    #pinit-highlight(3, 4, fill: pinit-c2)
    by 
    &= #pin(1)Phi(x) C#pin(2) + #pin(3)Phi(x) integral Phi^(-1) (x) bold(f)(x) dif x#pin(4) \
    &= Phi(x) (C + integral Phi^(-1) (x) bold(f)(x) dif x)
  $

  即可
]

#thm-example[
  求解方程组的初值问题
  $
    (dif by) / (dif x)
    = mat(
      1, 0, &0;
      2, 1, -&2;
      3, 2, &1;
    ) by
    + vec(0, 0, e^x cos 2x),
    quad
    by(0) = vec(0, 1, 1)
  $
]
#thm-solve[
  #show math.phi: math.phi.alt
  解得特征值 $lambda_1 = 1$，$lambda_(2,3) = 1 plus.minus 2 ui $

  #set enum(numbering: "(1)")

  + 当 $lambda_1 = 1$ 时，解得特征向量 $vec(&2,-&3,&2)$，从而得到一个解 $phi_1 (x) = e^x vec(&2,-&3,&2)$

  + 当 $lambda_2 = 1 + 2 ui$ 时（因为我们使用处理复值解的方法二，所以只考虑 $1 + 2 ui$）

    解得特征向量 $vec(0, 1, -ui)$. 又因为
    $
      e^((1+2ui)x) vec(0, 1, -i) 
      = e^x vec(0, cos 2x, sin 2x)
      + ui e^x vec(0, sin 2x, -cos 2x)
    $

    所以对应着齐次方程组的两个实解
    $
      phi_2 (x) = e^x vec(0, cos 2x, sin 2x),
      wide
      phi_3 (x) = e^x vec(0, sin 2x, -cos 2x)
    $

  综上，求得基解矩阵i
  $
    Phi(x) = mat(
      2e^x, 0, 0;
      -3e^x, e^x cos 2x, e^x sin 2x;
      2e^x, e^x sin 2x, -e^x cos 2x;
    )
  $

  易知
  $
    Phi^(-1) (0)
    = mat(
      &2, 0, &0;
      -&3, 1, &0;
      &2, 0, -&1;
    )^(-1)
    = mat(
      1/2, 0, 0;
      3/2, 1, 0;
      1, 0, -1;
    )
  $

  于是
  #[
    #set math.mat(column-gap: 1em, row-gap: 0.6em)
    $
      e^(A x) 
      = Phi(x) Phi^(-1) (0)
    = e^x mat(
       1, 0, 0;
       -3/2 + 3/2 cos 2x + sin 2x, cos 2x, -sin 2x;
       1 + 3/2 sin 2x - cos 2x, sin 2x, cos 2x;
     )
    $
  ]

  因此，所要求的解为
  $
    by(x)
    &= e^(A x) by(0) + e^(A x) integral_0^x e^(-A s) bold(f)(s) dif s \
    &= e^(A x) vec(0, 1, 1) 
    + e^(A x) integral_0^x e^(-s) mat(
      1, 0, 0;
      -3/2 + 3/2 cos 2s - sin 2s, cos 2s, sin 2s;
      1 - 3/2 sin 2s - cos 2s, -sin 2s, cos 2s;
    ) vec(0, 0, e^s cos 2s) dif s \
    &= e^x vec(0, cos 2x - sin 2x, cos 2x + sin 2x)
    + e^(A x) integral_0^x vec(0, sin 2s cos 2s, cos^2 2s) dif s \
    &= e^x vec(0, cos 2x - sin 2x, cos 2x + sin 2x)
    + e^(A x) vec(0, 1/8(1-cos 4x), x/2 + 1/8 sin 4x) \
    &= e^x vec(0, cos 2x - (1 + 1/2 x) sin 2x, (1 + 1/2 x) cos 2x + 5/4 sin 2x)
  $
]

#v(2em)
#line(length: 100%)
#v(2em)

#skew(ax: -16deg)[书上这里好像还提了一下常数变易法，我就不写了]

#skew(ax: -16deg)[不过我记得助教在期中的时候提过，在上面这题用的方法和常数变易法之间，最好考虑一下哪个对于你正在做的题目更适用]

#skew(ax: -16deg)[是这样讲的吗？我有点忘了]
