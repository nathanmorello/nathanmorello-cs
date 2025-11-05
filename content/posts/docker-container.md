---
title: "Try it in a Docker Container! A Beginner’s Hands-On Guide " 
date: 2025-11-05 
draft: false
summary: "A lightweight, disposable Docker setup to explore LazyVim safely without touching your system." 
tags: ["neovim", "lazyvim", "docker", "alpine", "dev-environment", "bash"] 
categories: ["Core Stack"]
featured_image: "/images/docker-lazy1.png" 

---  
{{< figure src="/images/docker.png" width="800" alt="docker" >}}
I’m a big fan of the “jumping in cold water” method, especially when you know almost nothing about something. You won’t learn _everything_ right away, but you _will_ learn how to do _something_ with it.  

It’s like a “pre-homelab”—a practical exercise you do before fully understanding... what you’re doing. In this it’s almost like doing any tutorial, but it  comes wiht a practical aim: something you can use repeatedly to get familiar with the process.  
And when you start diving into it properly, everything will make much more sense—and faster too.

## It all started when...
It all started when I was watching [this video](https://www.youtube.com/watch?v=iagjeLuxnMs&t=1984s) by Mischa van den Burg. At one point, he starts talking about **LazyVim** and says:

{{< figure src="/images/docker-lazy1.png" width="600" alt="docker lazy" >}}


As illustrated above, my brain goes blank. I do remember taking a Docker course once (or twice?), and I also remember working with it a little… But running a container and testing an application inside it? Totally forgotten.

So, if you’re like me —heard about it but don’t really know it— I believe this is a good opportunity to mess around a bit, which is often the best way to start.



## What’s Docker?  
Docker is a platform that allows you to package applications and their dependencies into **isolated containers**. Containers run consistently on **any system**, making development, testing, and deployment easier and more reliable. It’s widely used for building lightweight, portable, and reproducible development environments. It also allows you to test applications safely, without affecting your system.  
Docker lies at the very backbone of DevOps.

So, here it is:
## How to Try LazyVim in a Docker Container


If you’ve been curious about **LazyVim** but don’t want to mess up your local Neovim configuration, Docker is the fastest and safest way to give it a spin. LazyVim isn’t a separate program—it’s a **pre-configured Neovim setup** that comes with plugins, themes, and tools ready to go. Using Docker, you can launch an isolated environment with Neovim and LazyVim already configured, avoiding version mismatches, architecture errors, or any changes to your local setup. This makes it perfect for testing, exploring, and experimenting safely, with a clean, simple, and cross-platform setup.

>**What is Neovim?**  
Neovim is a modern, lightweight text editor based on Vim. It’s highly configurable, extensible, and designed for developers who prefer keyboard-driven workflows. LazyVim builds on Neovim by providing a ready-to-use configuration with useful plugins and sensible defaults.

{{< figure src="/images/lazyvim-which-key-plugin.webp" width="800" alt="lazyvim" >}}
## Installing Docker

### Linux
Most distributions let you install Docker via the package manager. For example, on Ubuntu:
    
```
sudo apt update 
sudo apt install docker.io 
sudo systemctl start docker 
sudo systemctl enable docker
```
    
Add your user to the `docker` group to run commands without `sudo`:
    
```
sudo usermod -aG docker $USER
```
    
### macOS
you can:
- Download and install **Docker Desktop** from [docker.com](https://www.docker.com/products/docker-desktop). Follow the GUI instructions to finish the setup.  
or
- use Homebrew:

```bash
brew install --cask docker
```
    
### Window 
you can:
- Download **Docker Desktop** from [docker.com](https://www.docker.com/products/docker-desktop).  
or
- use winget
```
winget install -e --id Docker.DockerDesktop
```
In both cases, make sure [**WSL 2**](https://medium.com/@aitmsi/activating-windows-subsystem-for-linux-2-wsl-2-83c5495367c4) is enabled if you’re on Windows 10/11 Home. Follow the installer steps to complete setup.	 

---
## The Working Setup: Alpine + LazyVim  
After trying AppImages and Ubuntu PPAs (and running into architecture errors), I landed on a cleaner approach: **Alpine Linux**.   

Alpine Linux is small, fast, and easy to work with using its built-in package manager, `apk`.  
Here’s the one-liner that works:  

```bash 
sudo docker run -w /root -it --rm alpine:edge sh -uelic '   
  apk add git lazygit fzf curl neovim ripgrep alpine-sdk --update   
  git clone https://github.com/LazyVim/starter ~/.config/nvim  
  cd ~/.config/nvim 
  nvim
 '
```

**What This Does**

`sudo docker run` → starts a new Docker container  
`-w /root` → sets the working directory to `/root`  
`-it` → runs in interactive terminal mode  
`--rm` → removes the container when you exit  
`alpine:edge` → lightweight Linux base image  
`sh -uelic '…'` → executes the commands below inside a shell  
    

Inside the container:

```
apk add git lazygit fzf curl neovim ripgrep alpine-sdk --update
```

Installs all the essentials:

`git` – version control  
`lazygit` – interactive Git UI  
`fzf` – fuzzy finder  
`curl` – download tool  
`neovim` – the editor  
`ripgrep` – fast file search  
`alpine-sdk` – compilation tools  
    

Then it clones LazyVim’s starter config and launches Neovim:

```
git clone https://github.com/LazyVim/starter ~/.config/nvim 
cd ~/.config/nvim 
nvim
```

When you quit Neovim, the container disappears — nothing is left behind.

---
### Creating a Reusable Docker Image

To avoid reinstalling everything every time, you can bake this setup into a reusable image.

```
# Dockerfile — LazyVim on Alpine 
FROM alpine:edge  

# Install dependencies 
RUN apk add --no-cache git lazygit fzf curl neovim ripgrep alpine-sdk  

# Clone LazyVim config RUN git clone https://github.com/LazyVim/starter /root/.config/nvim  

# Set working directory WORKDIR /root/.config/nvim  

# Default command CMD ["nvim"]`

```

Build the image once:
```
docker build -t lazyvim-alpine .
```

Now you’ve got a portable, versioned LazyVim environment that works on Intel, AMD, ARM, and Apple Silicon (M1/M2).

---

### Running LazyVim on Your Local Files

If you want to edit your local files inside the container, mount your current directory.

Create a small script named `run-lazyvim.sh`:

```
#!/bin/bash 

# Run LazyVim in Docker, mounting the current folder  
docker run -it --rm \   
-v "$(pwd)":/root/workspace \   
-w /root/workspace \   
lazyvim-alpine
```

Make it executable:

```
chmod +x run-lazyvim.sh
```

Run it:

```
./run-lazyvim.sh
```

This opens LazyVim in the container, editing your real files.  
When you exit Neovim, the container vanishes — but your files remain on your host system.

---

## Why This Setup Works So Well

1. **Cross-platform** — Works on x86_64, ARM, M1/M2, etc.
    
2. **Lightweight** — Alpine keeps everything minimal.
    
3. **Fully loaded** — Git, LazyGit, FZF, Ripgrep, and Neovim included.
    
4. **Clean** — The container removes itself when closed.
    

---

## Conclusion

Trying LazyVim shouldn’t be complicated.  
With Docker and Alpine, you can spin up a full Neovim + LazyVim setup in minutes — isolated, fast, and disposable.

Just build the image once, use the run script to mount your local projects, and explore LazyVim safely without touching your main setup.

Now, let's see if LazyVim is the right editor for me...
