#import "chicv.typ": *;

#set list(marker: ([•], [‣], [$dot.c$]))

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
        研究方向: 程序分析，内存管理，语言运行时优化
      ],
    )

    grad
    bs
  }

  let huawei_fields = {
    let huawei-date = [#translate-date(4, 2025) -- #translate-date(9, 2025)]
    translate(
      en: cventry(
        tl: [*Huawei 2012 Fields Lab, Innovation Team*],
        tr: huawei-date,
        bl: [*memory layout optimization*, 实习],
      )[
        Memory Layout Optimization for Render Service.
      ],
      zh: cventry(
        tl: [*华为2012菲尔兹实验室, 创新团队*],
        tr: huawei-date,
        bl: [*内存数据布局优化*, 实习],
      )[
        - 基于类thread-sanitizer工具在终端场景渲染服务场景下收集Trace数据
        - 利用Trace数据做访存模式实证分析
        - 利用Trace压缩数据做内存分配数据布局优化(PGO) *WIP*
      ]
    )
  }


  let wrap_publish_info(strs: "publisher") = {
    if type(strs) == array {
      [$dot.c$ #strs.map(strong).join([ $dot.c$ ]) $dot.c$]
    } else {
      [$dot.c$ #strong(strs) $dot.c$]
    }
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
        tl: [*Go 语言程序的内存性能与安全问题实证研究* #wrap_publish_info(strs: ("软件学报", "一作")) #ghLink #pdf_link("https://github.com/Lslightly/QLStat/")],
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
        tl: [*MEA2: a Lightweight Field-Sensitive Escape Analysis with Points-to Calculation for Golang* #wrap_publish_info(strs: ("OOPSLA25", "二作")) #acmlink("https://dl.acm.org/doi/10.1145/3689759") #pdf_link("https://dl.acm.org/doi/pdf/10.1145/3689759")],
        tr: linebreak()+h(1fr)+date,
      )[
        - 考虑Go语言的独特语言特性，在LLVM IR上实现更加精确的域敏感逃逸分析算法。
        - 在引入额外1\%编译时间开销情况下，在12个广泛使用的开源项目上平均减少7.9\%的堆分配点。
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
        tl: [*DBI-Go: 动态插桩定位Go二进制的非法内存引用* #wrap_publish_info(strs: ("软件学报", "三作")) #html_link("https://www.jos.org.cn/jos/article/abstract/7096") #pdf_link("https://www.jos.org.cn/josen/article/pdf/7096")],
        tr: date,
      )[
        - 基于二进制插桩的内存引用分析。
        - 利用Intel Pin插桩工具，结合Go ABI检测编译器逃逸分析算法错误导致的悬垂指针问题。
        - 个人贡献: 提供gcWriteBarrier相关的检测模式。
      ],
    )
  }

  let gollvm-semantics = {
    let date = [#translate-date(02, 2023) -- #translate-date(05, 2023)]
    let ghLink = github_repo_link("Lslightly/gollvm-heap2stack-invariant-verify")
    let klogo = box(image("assets/k-logo.png", height: 12pt))
    translate(
      en: cventry(
        tl: [*Semantics and Optimization of Memory Management in GoLLVM*],
        tr: date,
      )[],
      zh: cventry(
        tl: [*GoLLVM 内存管理的语义和优化* #wrap_publish_info(strs: ("本科毕设")) #ghLink],
        tr: date,
      )[
        - 基于 $KK$ #link("https://kframework.org/overview/")[框架] 对以LLVM为后端的 #link("https://go.googlesource.com/gollvm/")[Go编译器] 产生的LLVM IR进行语义建模。
        - 实现对逃逸分析算法错误导致的悬垂指针问题检测。
      ],
    )
  }

  let skills = {
    let devTools = {
      let tools = ("GitHub", "GitLab", "Gerrit")
      translate(
        en: [],
        zh: [
          - 开发环境：
            - 操作系统: Ubuntu(WSL2)+Windows
            - 编辑器和工具: VSCode, Obsidian, LazyVim；熟悉ChatGPT/Copilot/Cline等辅助开发
            - 版本控制与协作: 熟悉 GitHub、GitLab、Gerrit 等代码托管与协作平台，了解 GitHub Actions、GitLab CI
        ])
    }
    let progLang = {
      let very = "Go/Python/C/C++(" + $lt.eq$ + "17)"
      let familiar = "Rust/CodeQL"
      let somehow = "JS/TS/Haskell/OCaml/SystemVerilog"
      translate(
        en: [],
        zh: [
        - 编程语言：熟悉 #very $succ$ 略熟悉 #familiar $succ$ 了解 #somehow
      ])
    }
    let frameworks = {
      translate(
        en: [],
        zh: [
          - 框架: 了解Go Toolchain(go/compile/runtime)/LLVM/ANTLR...
        ]
      )
    }
    let presentation = {
      let preFamiliar = "LaTeX/Typst/Markdown/Excalidraw"
      let preSomehow = "docx/pptx/剪映"
      translate(
        en: [],
        zh: [- 通用语言: 英语CET6: 550; 文档语言: #preFamiliar $succ$ #preSomehow]
      )
    }
    progLang
    devTools
    frameworks
    presentation
  }

  let osc = {
    let go-multiprocess-debug = {
      translate(
        en: [],
        zh: [
          - Go调试器delve 多进程调试能力的Debug Adapter Protocol(DAP)支持，用于支持Go工具链调试:
            - 后端: debug console和launch request支持 #github_pr_link("https://github.com/go-delve/delve/pull/4078", "go-delve/delve#4078", status: "open")
            - 前端: vscode-go调试选项支持 #github_pr_link("https://github.com/golang/vscode-go/pull/3840", "golang/vscode-go#3840", status: "drafted")
        ]
      )
    }

    let obsidian-mousewheel = {
      translate(
        en: [],
        zh: [
          - Obsidian滚轮缩放图片插件对PDF++插件的支持 #github_pr_link("https://github.com/nicojeske/mousewheel-image-zoom/pull/63", "nicojeske/mousewheel-image-zoom#63", status: "merged")
        ]
      )
    }


    let small-fixes = {
      translate(
        en: [],
        zh: [
          - 小修复：
            - 修复delve suspended breakpoint的if条件失效 #github_pr_link("https://github.com/go-delve/delve/pull/3938", "go-delve/delve#3938", status: "merged")
            - 文档修复: #github_pr_link("https://github.com/golang/go/pull/72793", "golang/go#72793", status: "merged"), #github_pr_link("https://github.com/mgmeyers/obsidian-zotero-integration/pull/297", "mgmeyers/obsidian-zotero-integration#297", status: "merged"), #github_pr_link("https://github.com/gaogaotiantian/dowhen/pull/54", "gaogaotiantian/dowhen#54", status: "merged"), ...
        ]
      )
    }
    grid(
      columns: (45%, 50%),
      rows: 1,
      gutter: 4%,
      [
        #go-multiprocess-debug
        #obsidian-mousewheel
      ],
      small-fixes
    )
  }

  let misc = {
    grid(align: left, gutter: 20pt, columns: (1fr, 1fr), rows: 1, [
      #translate(
        en: [],
        zh: [
          - 获奖情况:
            - #entry(tl: "2022 年编译系统设计赛华为毕昇杯三等奖", tr: translate-date(8, 2022), [
              - #text(size: 7pt)[负责后端代码生成到ARM汇编]
            ])
            - #entry(tl: "优秀学生奖学金金奖", tr: translate-date(1, 2022), "")
            - #entry(tl: "第五届龙芯杯团队优胜奖", tr: translate-date(8, 2021), [
              - #text(size: 7pt)[负责MIPS CP0协处理器]
            ])
        ]
      )
    ], [
      #translate(
        en: [],
        zh: [
          - 助教工作:
            - #entry(tl: "《编译原理和技术 (H)》课程助教", tr: "20222/2024秋季", "")
            - #entry(tl: "《模拟与数字电路》课程助教", tr: "2021秋季", "")
        ]
      )
    ])
    
  }

  let self_infos = (
    email_link("mailto:lqw332664203@mail.ustc.edu.cn", "lqw332664203@mail.ustc.edu.cn"),
    github_home("Lslightly"),
    homepagelink("https://lslightly.github.io/", "lslightly.github.io"),
    orcid_home("0009-0002-3888-2435"),
    zhihu_home("xiao-li-fei-dao-76-37", "Lsligthly"),
    bilibili_home("481749345", "Lsligthly"),
  )

  // Start of the document

  translate(en: [= #smallcaps[Lslightly]], zh: [= 李清伟 (#smallcaps[Lslightly]) ])


  self_infos.join([ $dot.c$ ])

  edu

  translate(en: [== Work Experience], zh: [== 工作经历])
  huawei_fields

  noSimple[
    #translate(en: [== Academic Experience], zh: [== 学术经历])
  ]
  go-mem-empirical
  mea2field-sensitive-escape-analysis
  dbigo
  gollvm-semantics

  translate(en: [== Open Source Contribution], zh: [== 开源贡献])
  osc

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc


  // bibliography("pub.bib", title: none)
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
