---
title: "How to Keep the  Obsidian Vault in your Phone in Sync with Git"
date: 2025-12-02T22:16:47+01:00
draft: true
tags: ["Obsidian", "GitHub", "Termux"]
categories: ["How I made this blog"]
summary: "A simple Git-based workflow to keep your Obsidian notes in sync between phone and computer — without conflicts, plugins, or complicated setup."
images: [/images/synch.jpg]
---

{{< figure src="/images/synch.jpg" width="800" alt="synch" >}}

### Introduction

If you use **Obsidian** on both your computer and your phone, you’ve probably wondered how to keep your notes safely synchronized.  
Sure, you can rely on sync services — but Git gives you full control, a complete history, and zero vendor lock-in.

Here’s a short and logical setup that keeps your vault consistent and safe, using a **dedicated Git branch for your mobile edits**.  
It’s clean, reliable, and easy.

---

## Create a branch 

Instead of pushing phone edits directly to your main branch, you’ll use a **separate branch**, like `mobile`.  
That way:

- Your phone work stays isolated.
- You decide when to merge it into `main`.
- You avoid sync conflicts and file corruption.
    
This is basically how software teams use Git — applied to personal note-taking.

---

## Setup on Your Computer 💻

Make sure your main branch is clean and up to date:
Go to the folder where you keep Obsidian. In my computer that is /home/$USER/repos/Obsidian
Once you are in, you make sure everything is up to date with:

`git checkout main git pull`

This is your stable, “official” version of the vault.

---
## Setup on Your Phone 📱 
{{< figure src="/images/termux.png" width="200" alt="termux" >}}
You’ll need:

- The **Obsidian mobile app**
    
- **Termux** (or any terminal with Git)
    

### 1. Install Git
From your phone go in Termux and install Git

`pkg install git`

### 2. Navigate to your vault folder

For example (and usually is):

`cd /storage/emulated/0/Documents/ObsidianVault`

### 3. Create and switch to your mobile branch

`git checkout -b mobile`

That option -b allows you to _create_ a new branch instead of using an existing one. Now every change you make on your phone happens inside that branch.

---

## 🔄 Syncing from the Phone

Whenever you edit notes in Obsidian, commit and push them:

```
git add . 
git commit -m "Update from mobile $(date)" 
git push -u origin mobile
```

✅ All your changes are stored in the `mobile` branch, ready to merge later.

---

## 💻 Merging from the Computer

When you’re back at your desk:

`git fetch git checkout main git merge mobile`

Review any differences, then push the result:

`git push`

Your phone notes are now merged safely into the main vault.

---

## 🧹 Should You Delete the Branch?

Normally, GitHub tutorials tell you to delete feature branches after merging —  
but in this workflow, **keep your `mobile` branch**.

It becomes your dedicated workspace for phone edits.  
Just keep reusing it:

`git checkout mobile # make changes, commit, push, repeat`

---

## Optional: One-Command Sync Script (Phone)

Make syncing easier with a simple script.  
Create a file called `sync.sh` inside your vault:

`#!/data/data/com.termux/files/usr/bin/bash cd /storage/emulated/0/Documents/ObsidianVault  git add . git commit -m "Update from mobile $(date)" || echo "No changes to commit" git push origin mobile`

Then make it executable:

`chmod +x sync.sh`

Now you can sync everything with one command:

`./sync.sh`

---

## Conclusionsa 

This setup keeps your Obsidian vault:

- **fully versioned**
    
- **conflict-free**
    
- and **under your control**
    

Without needing to use cloud sync, but also with no risk of overwriting files.
