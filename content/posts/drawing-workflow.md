---
title: "From Doodle to Blog - How I Make my Illustrations"
date: 2025-11-09T23:11:58+01:00
draft: true
tags: ["AI", "Drawing", "Gimp"]
categories: ["Soft Stack", "How I make this blog"]
summary: "My workflow — from first sketch to final blog illustration — and how I think AI should (and shouldn’t) be used."
images: []
---

{{< figure src="/images/manynats.jpg"width="800" alt="docker" >}}  

I love making little drawings. They help me think, reason about what I want to do, and give me that extra push to finish my projects.  
Since the AI wave exploded, I’ve started using it too — but _how should one use it_?

In this article, I want to show my workflow for creating illustrations for this blog — a process that _includes_ AI, though I wouldn’t say I _make illustrations with_ AI.

In a nutshell, I really like how Sebastian Wolter put it [here](https://www.linkedin.com/posts/activity-7385952492616040448-c4TY?utm_source=share&utm_medium=member_desktop&rcm=ACoAAATWyyYBbd1s061uIAxyTplgt7nytQ0JDfM):  
**“ChatGPT as a sparring partner, not an answer machine.”**

It took me a while to think through and outline this article — with some tests and experiments along the way.  
Meanwhile, I found my experience very well reflected in what Justin Oberman wrote in posts like [this one](https://www.linkedin.com/posts/justinoberman_how-to-get-better-at-ai-art-ugcPost-7379231965549539328-K2Dw?utm_source=share&utm_medium=member_desktop&rcm=ACoAAATWyyYBbd1s061uIAxyTplgt7nytQ0JDfM), which also explains the theory behind these ideas much better than I could.  

Here, you’ll find my own take — a _practical corollary_ to that theory.

---

## How It Started


For me, drawing has always been a natural, almost inevitable act.  
I inherited it from my father — a natural-born artist.

In our home, a “little drawing” was always something extra — small but essential — woven into our daily life. A birthday, a special evening, even a shopping list often came with one of his doodles.

That tradition continues today, as he still _compulsively_ sends little drawings to me, my wife, and our kids.

Over time, I picked up the habit too.  
It began as endless doodles in high school notebooks, then evolved into drawings more and more like my father’s — especially as my family grew and I found a wife with the same “vice” (as you can see from our birthday cards here below).

There were times when I gave more space to my passion for art, exploring other graphic forms — but the _little drawings_ always remained.

{{< figure src="/images/family-drawings.jpg" caption="Ilana Bershadsky, Marco Post Morello, and Nathan Morello, _Various cards and family drawings_, 2023-25" width="800" alt="family drawnings" >}}
## My Rules and Workflow for Blog Drawings

So, ever since I started thinking about this blog, it felt only natural to use small sketches to support my writing. 
But since time and energy are always limited, I had to come up with an ideal workflow — one that would let me create decent illustrations as quickly and effortlessly as possible.

The thing is, like everything else, drawings can easily turn into a rabbit hole. You start tweaking and refining, and before you know it, you’ve spent more time on the sketch than on the article itself.
At the end of the day, these drawings are meant to support the reading experience — not eat into the time I should spend researching and editing.

So here’s my workflow and the simple rules I follow.

### Rules
1. **Each drawing is made for a specific post** — and must relate to it.  
    Its job is to lighten, support, or visually echo what I’m saying.  
    Sometimes they look nice but don’t fit: _out_.
    
2. **It must be done quickly.**  
    I’m not a professional. Nine times out of ten, the first draft is the best.  
    Also, I’m building a career in something completely different (DevOps, goodness gracious!), so drawings must not take hours.
    
3. **I have to like it.**  
    If it fits but doesn’t look right — or looks nice but doesn’t fit — I don’t use it.  
    No rule says every post _must_ have a drawing. _Out_.
    

---

## How the Workflow Happens

{{< figure src="/images/nat-workflow.jpg" width=600" alt="workflow" >}}
Usually it goes like this:  
When I get an idea, a little sketch pops up soon after.  
Sometimes it just appears; sometimes (like with the William Burroughs portrait in the [mini-howtos](/posts/mini-howtos) article) I start with a reference — the person, the monkey on his shoulder — found online.  
Other times, the drawing itself sparks the article idea.

For example, the [Docker container for LazyVim](/posts/docker-container) article started with a doodle of my reaction when I realized I’d completely forgotten how to make a Docker container to test an app (see below).

The drawing usually happens on the first blank page I find — often the same sheet where I jot down my weekly to-do list.  
When it’s done (or when I realize it’s done), I take a picture with my phone, crop it, maybe adjust brightness and contrast, and then feed it to ChatGPT.

---

## The AI Step

After many tests, I came up with this simple “prompt” that works every time:

```
Keep the drawing exactly as it is, preserve my style, 
make only the lines black and the background a clean white.
```

Admittedly, not the most technical prompt — but it works.
 
{{< figure src="/images/twonats.jpg" width="400" alt="2nats" >}}

At first, I experimented with more complex instructions to involve the AI creatively.  
But the truth is, ChatGPT _can’t help adding something of itself_.  
There are surely thousands of tools better suited for illustrations, but the efficiency of my process — plus lack of time — convinced me to stick with ChatGPT (at least for now).

So the goal is: **limit it just enough** to get the best of its capabilities without losing the character of my own drawing.  
Whenever I give it too much freedom (“modify it but keep my style”)... Let’s just say: it gets carried away, fast.

## Example: The LazyVim Drawing

Take this drawing made for the [LazyVim on Docker](/posts/docker-container) article.  
At the time, I still thought ChatGPT could merge two separate sketches into one. Technically, it can — but I’ve stopped doing that, since it usually takes longer to get what I want than just redrawing everything from scratch.  

So, I did the first sketches and I gave them to ChatGPT with this prompt:


> “Clean up and render these two drawings in black and white.  
> Create a vignette in a rectangular landscape format.  
> Put the man with the hat in the top-right corner with a speech bubble saying:  
> _‘You can get the Neovim distribution LazyVim at lazyvim.org — I highly recommend it! You can just run it in a Docker container to get started, and it’s, um… yeah, a great setup!’_
> 
> Place the second drawing slightly lower on the left (so the hierarchy feels natural — the man with the hat is talking, the other listens and doesn’t quite get it, hence the question mark).”

And this came out:

{{< figure src="/images/docker-lazy-first.png" width="800" alt="first try" >}}

I wasn’t happy. Mischa came out fine, but my drawing of myself  was just lame. I redrew a clearer version and instaed of starting from scartch, I told ChatGPT:

> “Keep everything **as it is**, but remove the guy under the question mark and replace him with the clean version of the character from the second drawing.”

The result: 🤦‍♂️

{{< figure src="/images/too-much.png" width="600" alt="too much" >}}

As I said — it _can’t help putting something of itself in there._  
The result isn’t bad, but it’s more impersonal.  

**ChatGPT tends to standardize — maybe even homogenize — any originality, blending it into an average, “dataset-approved” idea of beauty.**

Of course, it’s not always a bad thing. I do like some of AI’s variations of my self-portrait that I used for an illustration on troubleshooting. And eventually one of them became my GitHub profile picture. But I also think that the more original basis there is, the better: and I would argue that doesn't matter how original, it gets lost pretty quick, after a few re-elaborations.  

{{< figure src="/images/troubleshoot.png" width="800" alt="too much" >}}


## My Final Setup
So, what I did in the [LazyVim on Docker](/posts/docker-container) case was this: since I did like the rendering of Mischa, I just kept it and I edited the image with a new version of myself that I cleaned up with ChatGPT **in a new chat**. To edit I used Gimp

[GIMP](https://www.gimp.org/) is my favorite graphic editing tool — perfect for people like me who’ve spent hours in Photoshop but never made it a job (or an expensive hobby).  
It’s open-source, feels familiar, and gives me everything I need.

And after a bit of Gimp I got my final version


{{< figure src="/images/docker-lazy1.png" width="600" alt="too much" >}}

## Drawing → Cleanup → GIMP → Publish

**Here’s the refined, tested process I use today**:  

I make the drawing (as “complete” as possible), then have ChatGPT clean it using the strict prompt above.  
If needed, I fine-tune it in GIMP.


Sometimes I barely touch the image; sometimes I go further — like adding the yellow “terminal background” for the [mini-howtos](/posts/mini-howtos) cover.  


Of course, there are times when **procrastination** wins, and instead of doing what I _should_ be doing, I explore new ways to make my afternoon wonderfully useless.

{{< figure src="/images/hardwork-original1.jpg" width="500" alt="too much" >}}  

**And that’s when these little pearls of wisdom appear   
 — almost like political slogans :D**

---
{{< figure src="/images/hardwork1.png" width="800" alt="too much" >}}


**Thanks for reading!**
