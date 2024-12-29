#import "../definitions.typ": *
#let by = $bold(y)$
#let bpa = $bold(phi.alt)$

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
]

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
]

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
  $
    #pinit-highlight(1, 2, fill: pinit-c1)
    #pinit-highlight(3, 4, fill: pinit-c2)
    by 
    &= #pin(1)Phi(x) C#pin(2) + #pin(3)Phi(x) integral Phi^(-1) (x) bold(f)(x) dif x#pin(4) \
    &= Phi(x) (C + integral Phi^(-1) (x) bold(f)(x) dif x)
  $
]

== 常系数线性微分方程组

[TODO]

// 根据需要可能再拆分成几个小节
