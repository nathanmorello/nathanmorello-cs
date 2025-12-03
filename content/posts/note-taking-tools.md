---
title: "The Tools for My Note-Taking System: Obsidian, Markdown and Git"
date: 2025-11-28T22:45:01+01:00
draft: False
tags: ["Obsidian", "Note-Taking", "GitHub", "Markdown"]
categories: ["Core Stack", "How I Make this Blog"]
summary: "My current set of tools for writing, editing and storing my notes and articles"
images: [/images/note-taking-tools.jpg]
---

{{< figure src="/images/note-taking-tools.jpg" width="600" alt="tools" >}}
## Introduction

In the past few months, I’ve started adopting a new note-taking system to support my learning process in DevOps, but also to better organize and quickly access the information I accumulate throughout the day. This structure—described in more detail in another article—helps me set information aside while keeping my momentum “frozen,” so I can pick up exactly where I left off.

In this article, I briefly explain the tools I use to manage this note-taking framework, and how they’ve helped me build a routine that’s both flexible and sustainable.

## Obsidian

{{< figure src="/images/obsidian_logo.png" width="200" alt="Obsidian" >}}
[Obsidian](https://obsidian.md/) is one of the most popular note-taking tools today, and for good reason. Its learning curve is fast: a 20-minute tutorial gets you started, and the community provides excellent resources if you want to dive deeper.

For me, Obsidian became a gateway to related skills that improved both my DevOps journey and my daily workflow. It also pushed me to learn **Markdown** and **GitHub** hands-on—skills that proved invaluable.

My setup is minimal, with just two main plugins:

- **Templates** – create note [templates](https://forum.obsidian.md/t/plugin-create-notes-from-templates/23452) for different needs.

- **Periodic Notes** – ideal for recurring notes. I mainly use it for daily notes and an annual “goals” note. If you *really* want to deep dive into periodic notes look at [this article](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/) by Kevin Quinn.


Here’s an example of my daily note template, which helps me track priorities, routines, and fleeting thoughts:

```
## [[<% tp.date.yesterday ("YYYY-MM-DD-ddd") %>]] - [[<% tp.date.tomorrow ("YYYY-MM-DD-ddd") %>]]

## Daily Deeds & Rituals

- [ ] Study from the [[KubeCraft Weekly Schdule]]
- [ ] Read One Hour of [[Kubernetes Guida per Gestire e Orchestrare i Container]]
- [ ] Make sure Adam reads 10 minutes
- [ ] Make sure Adam and Lev make sport
- [ ] [[Train for 100 push-ups]] mantenimento/completo
- [ ] Look or update [[Topics da approfondire]]
- [ ] [[Blogs Topics]]
- [ ] [[TO DO list]]
### Routine

- [ ] 5:45 - 7:00 - Relax or reading
- [ ] 7:00 - 8:30 - Kids
- [ ] 8:30 - 9:00 - Ubahn/Book
- [ ] 9:00 - 17:30 - Work
- [ ] 17:30 - 18:30 - Ubahn/Book 
- [ ] 18:30 - 20:30 - Family
- [ ] 20:30 - 22:30 - Study

----
## Journal
```

Over time, my private life also found its place in Obsidian. This was largely thanks to the **PARA method**, which now shapes how I organize everything.

---

## Markdown

{{< figure src="/images/markdown_logo.jpeg" width="200" alt="Markdown" >}}
I had dabbled in Markdown before Obsidian, but using it daily made me fully appreciate its simplicity and speed. Coming from years of Microsoft Word, it felt unusual at first, but within weeks I was hooked. Markdown makes formatting and editing incredibly agile—so much so that I rarely need anything else.

Here’s a basic cheatsheet just to get you started:

```
# Markdown Quick Reference

## Headers
# H1 | ## H2 | ### H3 | #### H4 | ##### H5 | ###### H6

## Emphasis
*italic* | **bold** | ***bold italic*** | ~~strikethrough~~

## Lists
- Unordered item
  - Nested item
1. Ordered item
2. Another item

## Links & Images
[Link text](https://example.com)
![Alt text](https://example.com/image.jpg)

## Blockquotes
> This is a quote
> Multi-line quote

## Code
Inline: `inline code`
Block:
```language
// code here
```

Of course, for specialized writing, I’d still use Word or another dedicated editor—but for daily notes, Markdown is perfect.

---

## GitHub

{{< figure src="/images/git-logo.png" width="200" alt="GitHub" >}}
Obsidian offers its own sync, but I prefer syncing my notes with a **GitHub repository**. This hands-on approach is the best way to learn Git commands and understand version control (and ccidentally deleting work early on taught me the beauty of `git revert`— and the workflow eventually became smooth:

To create a new repository on GitHub, start by logging into your GitHub account and clicking the New Repository button. 

Choose a name, decide whether it should be public or private. I usually keep my repositories public as a general rule, but for Obsidian, the number of private-life and, especially, job-related notes made the private mode an obligated choice. You can also  add a README file. 

Once the repository is created, you’ll see its main page with the URL you can use to clone it. 

On your computer, open a terminal and navigate to the folder where you want to place the project. I keep all my Git clones in a folder "repos" in my home. 
Then run 
```
git clone <repository-url> 
```
to download the repository locally. Git will create a new directory with the same name as the repository, containing all its files. From there, you can open the folder in your editor, make changes, and commit them as needed. When you’re ready to upload your work back to the remote repository on GitHub, simply run git add ., git commit, and git push. This creates a seamless workflow between your local environment and GitHub.

As I now work with my Obsidian repo on three devices — my laptop, my phone, and my work computer — I’ve developed the habit of creating branches and committing changes on each device. Then I check for any conflicts and merge them into the main branch.

```
git checkout -b newbranch
git add .
git commit -m "note to commit"
git push -u origin newbranch

```

Beyond note-taking, this experience unlocked a deeper understanding of GitHub’s potential for any project.

---

## Conclusion

Obsidian, Markdown, and GitHub form a small but powerful trio that has changed how I organize my time, learning, and personal projects. Obsidian keeps me structured, Markdown keeps me fast and flexible, and GitHub ensures my work is safe, versioned, and portable.

Starting small and experimenting hands-on with these tools can quickly yield huge productivity gains and  spark curiosity for other skills along the way.
