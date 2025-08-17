#import "chicv.typ": *;

#let debug = true
#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let noSimple(simple: [], content) = {
    if mode == Simplified {
      simple
    } else {
      content
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year]
  )
  let current = translate(
    zh: [至今],
    en: [Present]
  )

  let edu = {
    translate(en: [== Education], zh: [== 教育经历])
    let bs-school = (
      zh: "中国科学技术大学",
      en: "University of Science and Technology of China",
    )
    let grad-school = bs-school

    let bs-data = [#translate-date(8, 2019) -- #translate-date(6, 2023)]
    let bs = translate(
      en: cventry(
        tl: [B.S. in Computer Science at *#bs-school.en*, CN],
        tr: bs-data,
      )[GPA: 3.93/4.30 rank: 6/169],
      zh: cventry(
        tl: [*#bs-school.zh*，计算机科学专业，本科，中国],
        tr: bs-data,
      )[GPA: 3.93/4.30 排名: 6/169],
    )

    let grad-date = [#translate-date(8, 2023) -- #translate-date(6, 2026) (预计)]
    let grad = translate(
      en: cventry(
        tl: [M.S. in Computer Science at *#grad-school.en*, PA, US],
        tr: grad-date,
      )[
        Advisor: Yu Zhang\
        Research Area: Program Analysis, Empirical Study of Language Features, Memory Management, Language Runtime Optimization
      ],
      zh: cventry(
        tl: [*#grad-school.zh*，计算机科学专业，硕士，中国],
        tr: grad-date,
      )[导师：张昱 $quad$
        研究领域: 程序分析，语言特征实证分析，内存管理，语言运行时优化
      ],
    )

    grad
    bs
  }

  let go-mem-empirical = {
    let go-mem-empirical-date = [#translate-date(10, 2023) -- #translate-date(05, 2025)]
    let ghLink = github_repo_link("Lslightly/QLStat")
    translate(
      en: cventry(
        tl: [*Empirical Study of Memory Performance and Safety Issues of Go Programs*],
        tr: go-mem-empirical-date,
      )[
        - 
      ],
      zh: cventry(
        tl: [*Go 语言程序的内存性能与安全问题实证研究*],
        tr: go-mem-empirical-date,
      )[
        - 基于 CodeQL 实现批量代码仓库的内存性能相关模式扫描统计，以指导静态分析和编译优化。
        - 人工分析总结内存安全问题模式。
        - 针对切片表达式可能导致内存泄漏的问题模式编写 Linter 工具进行检测。
      ],
    )
  }

  let mea2field-sensitive-escape-analysis = {
    let date = [#translate-date(09, 2023) -- #translate-date(10, 2024)]
    translate(
      en: cventry(
        tl: [*MEA2: a Lightweight Field-Sensitive Escape Analysis with Points-to Calculation for Golang*],
        tr: date,
      )[],
      zh: cventry(
        tl: [*MEA2: a Lightweight Field-Sensitive Escape Analysis with Points-to Calculation for Golang* #acmlink("https://dl.acm.org/doi/10.1145/3689759")],
        tr: date,
      )[
        - 考虑Go语言的独特语言特性，在LLVM IR上实现更加精确的域敏感逃逸分析算法。在仅有额外1\%编译时间开销下平均减少7.9\%的堆分配点。
        - 个人贡献：过程间分析摘要设计，对象堆分配优化为栈分配实现。
      ],
    )
  }

  let dbigo = {
    let date = [#translate-date(06, 2023)]
    translate(
      en: cventry(
        tl: [*DBI-Go: Dynamic Binary Instrumentation for Pinpointing Illegal Memory References in Go*],
        tr: date,
      )[],
      zh: cventry(
        tl: [*DBI-Go: 动态插桩定位Go二进制的非法内存引用* #pdf_link("https://www.jos.org.cn/josen/article/pdf/7096", text: "")],
        tr: date,
      )[
        - 基于二进制插桩的内存引用分析。检测编译器逃逸分析算法错误导致的悬垂指针问题。
        - 个人贡献为提供特定运行时函数的检测模式。
      ],
    )
  }

  let gollvm-semantics = {
    let date = [#translate-date(02, 2023) -- #translate-date(05, 2023)]
    let ghLink = github_repo_link("Lslightly/gollvm-heap2stack-invariant-verify")
    translate(
      en: cventry(
        tl: [*Semantics and Optimization of Memory Management in GoLLVM*],
        tr: date,
      )[],
      zh: cventry(
        tl: [*GoLLVM 内存管理的语义和优化* #ghLink],
        tr: date,
      )[
        - 基于K框架对GoLLVM编译器编译生成的IR进行语义建模
        - 实现对编译器逃逸分析算法错误导致的悬垂指针错误检测。
      ],
    )
  }

  let skills = {
    let devTools = {
      let tools = ("GitHub", "GitLab")
      translate(
        en: [],
        zh: [
          - 开发环境：
            - VSCode+ChatGPT(Copilot/Cline)+OhMyZsh+PowerShell+Obsidain $succ$ LazyVim
            - 有使用 #tools.join("、") 等团队协作工具的经验
        ])
    }
    let progLang = {
      let very = "Go/Python/C/C++(" + $lt.eq$ + "17)"
      let familiar = "Rust/CodeQL"
      let somehow = "JS/TS/Haskell/OCaml/SystemVerilog"
      let preFamiliar = $latex$ + " Typst Markdown Excalidraw"
      let preSomehow = "docx/pptx/剪映"
      translate(
        en: [],
        zh: [
        - 编程语言：熟悉 #very $succ$ 略熟悉 #familiar $succ$ 了解 #somehow
        - 展示语言：熟悉 #preFamiliar $succ$ 略熟悉 #preSomehow
      ])
    }
    let frameworks = {
      translate(
        en: [],
        zh: [
          - 框架: Go Toolchain(build/compile/runtime)/LLVM/...
        ]
      )
    }
    progLang
    devTools
    frameworks
  }

  let misc = {

  }

  let self_infos = (
    email_link("mailto:lqw332664203@mail.ustc.edu.cn", "lqw332664203@mail.ustc.edu.cn"),
    homepagelink("https://lslightly.github.io/", "lslightly.github.io"),
    orcid_home("0009-0002-3888-2435"),
    github_home("Lslightly"),
    zhihu_home("xiao-li-fei-dao-76-37", "Lsligthly"),
    bilibili_home("481749345", "Lsligthly"),
  )

  // Start of the document

  translate(en: [= #smallcaps[Lslightly]], zh: [= 李清伟 (#smallcaps[Lslightly]) ])


  self_infos.join([ $dot.c$ ])

  edu

  translate(en: [== Work Experience], zh: [== 工作经历])
  // huawei_fields

  noSimple[
    #translate(en: [== Academic Experience], zh: [== 学术经历])
  ]
  go-mem-empirical
  mea2field-sensitive-escape-analysis
  dbigo
  gollvm-semantics

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  // misc

  bibliography("pub.bib", title: none)
}


#if debug {
  show: chicv
  runReader(Chinese)
} else {[
If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
]}
