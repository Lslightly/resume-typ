// Modified by Lslightly at 2025-08-02
// Modified by ice1000 at 2023-08-16

#let chiline() = {
  v(-3pt);
  line(length: 100%, stroke: gray);
  v(-10pt)
}

#import "@preview/fontawesome:0.6.0": *
#import "@preview/use-academicons:0.1.0": *

#let iconsize = 11pt

#let link-icon = fa-icon("link")
#let doi-icon = ai-icon("doi")
#let icon_text_link(uri, text: [], icon: link-icon) = {
  if text == [] {
    text = uri
  }
  [#icon #link(uri)[#text]]
}

#let icon_link(uri, icon: link-icon) = {
  link(uri)[#icon]
}

#let academic_text_link(uri, text: [], icon: doi-icon) = {
  if text == [] {
    text = uri
  }
  link(uri)[#icon #text]
}

#let academic_link(uri, icon: doi-icon) = link(uri)[#icon]

// ---

#let pdf_link(uri, text: "") = {
  if text == "" {
    icon_link(uri, icon: fa-file-pdf(fill: red, size: iconsize))
  } else {
    icon_text_link(uri, text: text, icon: fa-file-pdf(fill: red, size: iconsize))
  }
}

#let html_link(uri, text: "") = {
  if text == "" {
    icon_link(uri, icon: fa-globe(fill: gray, size: iconsize))
  }
}

#let email_link(uri, email) = icon_text_link(uri, text: email, icon: fa-envelope())

#let github_repo_link(repo) = icon_text_link("https://github.com/" + repo, text: repo, icon: fa-github())

#let github_pr_link(link, text, status: "merged") = {
  if status == "merged" {
    icon_text_link(link, text: text, icon: fa-code-merge(fill: rgb("#8250df")))
  } else if status == "open" {
    icon_text_link(link, text: text, icon: fa-code-pull-request(fill: rgb("#1f883d")))
  } else if status == "drafted" {
    icon_text_link(link, text: text, icon: fa-code-pull-request(fill: rgb("#59636e")))
  } else if status == "closed" {
    icon_text_link(link, text: text, icon: fa-code-pull-request(fill: rgb("#cf222e")))
  }
}

#let github_home(name) = icon_text_link("https://github.com/"+name, icon: fa-github(), text: name)

#let zhihu_home(userid, username) = icon_link("https://zhihu.com/people/"+userid, icon: fa-zhihu(fill: blue))


#let bilibili_home(userid, username) = {
  icon_link("https://space.bilibili.com/"+userid, icon: fa-bilibili(fill: blue))
}

#let orcid_home(id) = academic_link("https://orcid.org/"+id, icon: ai-icon("orcid", fill: rgb("#b2c046")))


#let homepagelink(url, content) = {
  link(url)[#fa-icon("home") #content]
}

#let doilink(url) = {
  link(url)[#ai-doi()]
}

#let acmlink(url) = {
  link(url, ai-acm(fill: rgb("#008ecf"), size: iconsize))
}

// https://github.com/typst/typst/issues/1987#issuecomment-1690672386
#let latex = {
  // set text(font: "New Computer Modern")
  box(width: 2.55em, {
    [L]
    place(top, dx: 0.3em, text(size: 0.7em)[A])
    place(top, dx: 0.7em)[T]
    place(top, dx: 1.26em, dy: 0.22em)[E]
    place(top, dx: 1.8em)[X]
  })
}

/**
 * tl: left entry
*/
#let cventry(
  tl: lorem(2),
  tr: "1145/14 - 1919/8/10",
  bl: [],
  br: [],
  content
) = {
  block(
    inset: (left: 0pt),
    tl + h(1fr) + tr +
    linebreak() +
    if bl != [] or br != [] {
      bl + h(1fr) + br + linebreak()
    } +
    content
  )
}

#let entry(
  tl: lorem(2),
  tr: "1145/14 - 1919/8/10",
  content
) = {
  block(
    tl + h(1fr) + tr +
    if content != "" {
      linebreak() + content
    }
  )
}

#let chicv(body) = {
  set par(justify: true)

  show heading.where(
    level: 1
  ): set text(
    size: 18pt,
    weight: "light",
  )

  let the-font = (
    "Palatino Linotype",
    "Source Han Serif SC",
    "Source Han Serif",
  )
  show heading.where(
    level: 2
  ): it => text(
    size: 12pt,
    font: the-font,
    weight: "bold",
    block(
      chiline() + it,
    )
  )
  set list(indent: 0pt)
  set text(
    size: 9pt,
    font: the-font
  )

  show link: it => underline(offset: 2pt, it)
  set page(
   margin: (x: 0.5cm, y: 0.9cm),
   numbering: "1 / 1"
  )
  set par(justify: true)

  body
}