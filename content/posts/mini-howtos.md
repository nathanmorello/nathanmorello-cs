---
title: "Mini Howtos '＼（〇_ｏ）／'"
date: 2025-10-30T23:35:19+01:00
draft: false
tags: ["Linux", "Zettelkasten", "Bash", "System Administration"]
categories: ["Core Stack"]
summary: "A small Bash script for fast sysadmin notes"
cover:
  images: ["/images/nat-takin-notesY.png", "/images/burroughscuts.jpg"]
  alt: ["nat", "Burroughs"]
---

{{< figure src="/images/nat-takin-notesY.png" alt="nat" >}}

*You can download the mini-howtos script and a "Starting Notes folder" on my [GitHub](https://github.com/nathanmorello/lab/tree/main/bash/Mini-Howtos) account*.

Anyone who’s worked as a sysadmin knows this: sometimes you only manage to solve a problem after half an hour (or more) of searching on Stack Overflow or repeatedly tweaking configurations. Then, finally, you get it working.

...And the next time, you can’t remember how you did it!


To avoid losing all this hard-earned knowledge, for several years I kept a single text file called "Everyday-troubleshoot". It worked, but it wasn’t practical. Every time I had to: remember where I put the file, look through a sort of "table fo content" I kept at the beginning of the first page, find the topic, use, it, update note and table of content... It was long and tedious. So much that sometimes I’d *postpone* updating it with a new note, because I just didn't have time... ending up right back where I started.

Then two things happened:

1. I read [*How to Take Smart Notes*](https://www.amazon.de/How-Take-Smart-Notes-Technique/dp/3982438802?ie=UTF8&tag=googhydr08-21&hvadid=719378855680&hvpos=&hvexid=&hvnetw=g&hvrand=2470447675421112442&hvpone=&hvptwo=&hvqmt=&hvdev=c&ref=pd_sl_1igezu3og_e&tag=&ref=&adgrpid=172726841667&hvpone=&hvptwo=&hvadid=719378855680&hvpos=&hvnetw=g&hvrand=2470447675421112442&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9061166&hvtargid=dsa-1595363597442&hydadcr=&mcid=&gad_source=1) by Sönke Ahrens, discovering the work of Niklas Luhmann and his [*Zettelkasten* Method](https://en.wikipedia.org/wiki/Zettelkasten), as well as its adaptationsin the [digital world](https://www.youtube.com/watch?v=o1NJYnZCfmY), which made me realize the value of (*very*) short and well-crafted notes;


2. I decided to improve my knowledge of **Bash**, because it’s one of the fundamental tools for both Linux administration and for building a career in the DevOps field.


>{{< figure src="/images/burroughscuts.jpg" width="350" alt="Burroughs" >}}  
>So, like a little **William Burroughs**, I started doing a proper [cut-up](https://austinkleon.com/2018/09/18/the-surprisingly-long-history-of-the-cut-up-technique/) of my troubleshooting notes—and other pieces of useful notes taken during the years, and I created **Mini-Howtos**.


## Meet 'mini-howtos'

Mini-howtos is a **simple**, **fast, fully terminal-based** bash script to save small documentation notes, snippets, and troubleshooting tips. A handy tool for organizing all those small discoveries, insights, and searches — **especially helpful when you need to learn and retain information from *someone else’s* documentation**.: how was that `iptables` command? And that Apache fix? Look at that nice Ansible snippet! How is that thing you need to do on the Wazuh server to remove a deprecated agent...?.
"Mini" stands for the size of the notes, that put together create a little *Zettelkasten* dedicated to those famous “**tricks of the trade**” you don’t want to forget... and that you can use for showing off to your colleagues 😎

Mini-howtos can:
- **create**
-  **list**
- and **search** notes interactively and directly from the terminal.

The script lives somewhere in my `$PATH` (I keep it in `/usr/local/bin`), and the notes are stored and managed in a folder of my choice (see below, the section **Creating a note**).  
It’s of course a work in progress, but it’s been pretty stable for a while now.  
It’s quick to consult, update, and _use_ (copying from terminal to terminal is sooo much easier for me).
It’s been a great exercise for learning more about Bash file handling, colors, functions, conditions, parameters, input/output management… (see below "A little Bash under the hood")

And yes, of course, I used ChatGPT, BUT as a **sparring partner**, not an “absolute truth”: a way to learn and improve, not to delegate.

Here’s how it works.
At the bottom of the page, you’ll find the script to copy.

## Creating a Note

With the command:

```
mini-howtos create
```

the terminal will ask you for:

- the **title** of the note (which also becomes the name of the `.txt` file);

- one or more **labels**, useful for later searches;

- and finally, the **actual content** of the note.


Write everything, then type `EOF` on an empty line to finish.

```
nathan@nathan:~$ mini-howtos create
Enter note title: How to restart NetworkManager cleanly
Enter label (leave empty to finish): Networking
Enter label (leave empty to finish): systemd
Enter label (leave empty to finish):
Enter note content (finish with EOF on its own line):

Sometimes you just need to reset NetworkManager without reboot:

systemctl restart NetworkManager
EOF

Note saved to: /$HOME/Documents/mini-howtos/How_to_restart_NetworkManager_cleanly.txt
```

The script automatically saves the file with a name derived from the title (spaces become underscores, slashes are removed) and places it inside a predefined folder.

My notes folder is located inside my personal folder in the company's Subversion repository, but any local folder will do.
For example, you can create a “mini-howtos” folder inside your Documents folder:

`mkdir $HOME/Documents/mini-howtos`

Then make sure to paste this path into the script variable:

```
# Path to notes folder
NOTES_DIR="$HOME/Documents/mini-howtos"
```

Here’s what a note looks like when it’s displayed in the terminal output:

```
＼（〇_ｏ）／
-------------------------------------
How to restart NetworkManager cleanly
-------------------------------------
Label: networking
Label: systemd

Sometimes you just need to reset NetworkManager without reboot:

systemctl restart NetworkManager
```

The lines above and below the title are generated automatically to match its length, while the “labels” are listed one after another below the title.

>The **little guy**  ＼（〇_ｏ）／  isn’t just for fun — it’s practical too: when I start scrolling back and forth through one, two, or six shells, and through long outputs, these little guys help me see where my notes begin.

But how do I pull up the note I need?
And how do I make changes to existing notes?

In both cases, there are two main commands:

```bash
mini-howtos list
```
and


```
mini-howtos search
```

## Listing and Reading Notes

This is the command to display the notes that you created:

`mini-howtos list`

The script shows a numbered list of files and asks what you want to do:

- typing just the number → opens the note with the Linux's command `cat`

- typing the note number + `edit` → opens the note in your editor of choice (`$EDITOR`, by default; in my case `VIM`)


The note numbers are generated each time the script runs — they’re _not_ tied to specific notes (so it’s not recommended to let your "finger-memory" learn the note number).

Here’s an example:

```bash
mini-howtos list
📋Listing notes...
Notes:
1) Bounced_E-Mails.txt
2) Comandi_VIM.txt
3) Critical_thinking_and_AI:_catch_the_error!.txt
4) deactivate_https_for_Netdata_dashboard.txt
5) E-Mail_Configuration.txt
6) Firefox_ESR52_for_proliangt5.txt
7) If_Virtual_Box_assigns_the_same_IP_address_to_different_VMs.txt
8) ZFS_Quota.txt
9) Montare_ISO_di_Sistema_Operativo_su_Chiavetta_USB.txt
10) Nagios_Logs.txt
11) Outlook_synchronisation_issues.txt
12) ZFS_Useful_Commands.txt
13) SWITCH_notes.txt

Enter note number (e.g., '2' or '2 edit'): 12
＼（〇_ｏ）／
-------------------
ZFS Useful Commands
-------------------
Label: ZFS

Check ZFS Partitions
	zfs list -r -o space,refer,encryption,mounted,mountpoint

Check snapshot and space
	zfs list -r -t all daten/evolution
```

## 🔍 Searching Notes

Perhaps the best part is the search function:

`mini-howtos search`

You can search:

- by **label** (the script gathers and numbers all used labels, again: casually)

- or by **keyword**  (case-insensitive)


After searching you can:

- display all matching notes (`all`)

- open a specific one (`2`)

- or edit it (`2 edit`)


```
nathan@nathan:~$ mini-howtos search
🔍Here you can search the notes Labels:
1) E-Mail
2) Linux
3) VIM
4) AI
5) Education
6) SSH
7) Monitoring
8) Evolution
9) Servers
10) ZFS
11)VM
11) Networking
12) Tickets
13) systemd
14) Partitions
15) Machines
16) Outlook
17) Backups
18) Samba
Search by label number or keyword: ssh
```
```
Results:
1) Server_Reboot.txt
2) SSH_no_hostkeys_available.txt
3) vbox-test3.txt
4) Büros_computer.txt
Enter note numbers (space-separated), all, or N edit: 3

＼（〇_ｏ）／
-------------------------
SSH no hostkeys available
-------------------------
Label: Networking
Label: SSH

If you get this error
	sshd: no hostkeys available -- exiting

1. In the /etc/ssh/ folder run ssh-keygen -A
2. /etc/init.d/ssh start
```

## A bit of Bash under the hood

Unpretentious but very practical.

### `set -euo pipefail`: Bash’s safety helmet

At the beginning of the script you’ll find this line:

`set -euo pipefail`

It’s like a “safe mode” for Bash.
It helps prevent many silent errors that, in more complex scripts, can become a nightmare.
Here’s what it does:

- `-e` → stops the script at the **first error** (instead of continuing as if nothing happened);

- `-u` → treats the use of **undeclared variables** as an error;

- `-o pipefail` → if in a **pipe** (`cmd1 | cmd2`) one of the commands fails, the entire pipeline fails (by default Bash only considers the last one).

Result: the script stops when something goes wrong, instead of creating half-empty files or truncated notes.

### ANSI colors for a more readable terminal

The variables:

```
RESET="\033[0m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"
```

are used to color the terminal output.
In Bash, the `\033[` sequences introduce **ANSI escape codes**, which are used to change text color or style. A small thing, but it greatly improves usability — especially when browsing through lots of notes.

In this script, each section uses a consistent color:

- **yellow** for input or interactive prompts,
- **blue** for the note list,
- **pink** for search results,
- **reset** to return to the normal color.


### Clear and modular functions

The script is divided into **three main functions**:

- `create_note()`: to create a new note

- `list_notes()`: to list and open existing notes

- `search_notes()`: to search through files


Each function is isolated, with a specific job and no unnecessary global variables.
This approach makes the script **easy to maintain** and extend: for example, if you wanted to add a `delete` command later, you’d just add a new function and one case at the bottom.

### `grep`, `mapfile` and Bash arrays

The search and indexing section makes good use of some “lesser-known” but powerful modern Bash functions:

- `mapfile -t files < <(find ...)` allows you to **fill an array** by reading the output of a command, cleanly and without manual loops.

- `grep -l` finds files containing certain text and returns only their names (perfect for filtering notes).

- `declare -A seen_labels` creates an **associative array**, used to gather all labels without duplicates.

These techniques allow the script to handle dozens (or hundreds) of note files efficiently.

### The `print_line` trick

A small but elegant function:

```
print_line() { local char="$1" local len="$2" printf "%${len}s\n" | tr " " "$char" }
```

It prints a horizontal line (like `------`) matching the length of the note’s title.
A visual detail that makes the notes look neat and consistent.

### `mkdir -p` and environment variables

First of all, the script ensures that the notes directory exists:

```
mkdir -p "$NOTES_DIR"
```

The `-p` flag prevents errors if the folder already exists.
It also uses `$EDITOR_CMD="${EDITOR:-vim}"` to respect the user’s `$EDITOR` environment variable, with a sensible fallback (`vim`).
If you prefer `nano` or `micro`, you just have change the variable at the top of the script.

## Conclusion

It’s not a knowledge management system like Obsidian or Notion, but it’s **fast, local, textual, and portable**.

If you want to try, adapt it, make it better, here is the script. Put it in your `$PATH`, ***use it***, make it better.
It all starts with

```
mini-howtos create
```

---


```
#!/usr/bin/env bash
set -euo pipefail

# Path to notes folder
NOTES_DIR="$HOME/Documents/mini-howtos"
EDITOR_CMD="${EDITOR:-vim}"

# Ensure folder exists
mkdir -p "$NOTES_DIR"

# Colors
RESET="\033[0m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"



# Helper: print a horizontal line
print_line() {
    local char="$1"
    local len="$2"
    printf "%${len}s\n" | tr " " "$char"
}

# ---------------- CREATING ----------------
create_note() {
    read -rp "Enter note title: " title
    # Sanitize filename: replace spaces with underscores and strip slashes
    file_title="${title// /_}"
    file_title="${file_title//\//-}.txt"
    file_path="$NOTES_DIR/$file_title"

    # Collect multiple labels
    labels=()
    while true; do
        read -rp "$(echo -e ${YELLOW}Enter label \(leave empty to finish\): ${RESET})" label
        [[ -z "$label" ]] && break
        labels+=("$label")
    done

    echo "Enter note content (finish with EOF on its own line):"
    content=""
    while IFS= read -r line; do
        [[ $line == "EOF" ]] && break
        content+="$line"$'\n'
    done

    {
        # Two empty lines + the face
        echo
        echo
        echo "＼（〇_ｏ）／"
        # Title with dashes
        print_line "-" "${#title}"
        echo "$title"
        print_line "-" "${#title}"
        for lbl in "${labels[@]}"; do
            echo "Label: $lbl"
        done
        echo
        printf "%s" "$content"
    } > "$file_path"

    echo "Note saved to: $file_path"
}


# ---------------- LISTING ----------------
list_notes() {
    # Collect files (filenames only), sorted
    echo "📋Listing notes..."
    mapfile -t files < <(find "$NOTES_DIR" -maxdepth 1 -type f -printf '%f\n' | sort)
    if [ ${#files[@]} -eq 0 ]; then
        echo "No notes found."
        return 0
    fi

    echo -e "${BLUE}Notes:${RESET}"
    for i in "${!files[@]}"; do
        printf "${BLUE}%2d) %s${RESET}\n" "$((i+1))" "${files[$i]}"
    done

    # Read a whole line so we can parse "2 edit"
    read -r -p "Enter note number (e.g., '2' or '2 edit'): " line
    # Split by IFS
    read -r num action <<<"$line"

    # Validate number
    if ! [[ "${num:-}" =~ ^[0-9]+$ ]] || (( num < 1 || num > ${#files[@]} )); then
        echo "Invalid selection."
        return 1
    fi

    selected="${files[$((num-1))]}"
    if [[ "${action:-}" == "edit" ]]; then
        "$EDITOR_CMD" "$NOTES_DIR/$selected"
    else
        cat "$NOTES_DIR/$selected"
    fi
}

# ---------------- SEARCHING ----------------
search_notes() {
    # Build unique label list
    echo "🔍Here you can search the notes"
    declare -A seen_labels=()
    unique_labels=()

    shopt -s nullglob
    for f in "$NOTES_DIR"/*.txt; do
        while IFS= read -r lbl; do
            lbl="${lbl#Label: }"   # rimuove "Label: "
            lbl="$(echo "$lbl" | xargs)" # trim spazi
            if [[ -n "$lbl" && -z "${seen_labels[$lbl]+x}" ]]; then
                unique_labels+=("$lbl")
                seen_labels[$lbl]=1
            fi
        done < <(grep '^Label:' "$f")
    done

    shopt -u nullglob

    if ((${#unique_labels[@]})); then
        echo -e "${YELLOW}Labels:${RESET}"
        for i in "${!unique_labels[@]}"; do
            printf "${YELLOW}%2d) %s${RESET}\n" "$((i+1))" "${unique_labels[$i]}"
        done
    else
        echo "No labels found yet."
    fi

    read -r -p $'\e[35mSearch by label number or keyword: \e[0m' search_term

    results=()
    if [[ "$search_term" =~ ^[0-9]+$ ]] && (( search_term >= 1 && search_term <= ${#unique_labels[@]} )); then
        label="${unique_labels[$((search_term-1))]}"
        # Fixed-string search for exact "Label: <label>"
        mapfile -t results < <(grep -l -F "Label: $label" "$NOTES_DIR"/*.txt 2>/dev/null | sort)
    else
        # Case-insensitive keyword search anywhere in the note
        mapfile -t results < <(grep -il -- "$search_term" "$NOTES_DIR"/*.txt 2>/dev/null | sort)
    fi

    if ((${#results[@]} == 0)); then
        echo "No results found."
        return 0
    fi

    echo -e "${PINK}Results:${RESET}"
    for i in "${!results[@]}"; do
        printf "%2d) %s\n" "$((i+1))" "$(basename "${results[$i]}")"
    done

    read -r -p "$(echo -e ${PINK}Enter note numbers \(space-separated\), 'all', or 'N edit': ${RESET})" choice_line

    # Detect trailing 'edit'
    edit_mode=0
    # Split tokens
    read -ra tokens <<<"$choice_line"
    if ((${#tokens[@]} >= 1)) && [[ "${tokens[-1]}" == "edit" ]]; then
        edit_mode=1
        unset 'tokens[-1]'
    fi

    # Handle 'all'
    if ((${#tokens[@]} == 1)) && [[ "${tokens[0]}" == "all" ]]; then
        for f in "${results[@]}"; do
            cat "$f"
            echo
        done
        return 0
    fi

    # Collect selected indices
    selections=()
    for t in "${tokens[@]}"; do
        if [[ "$t" =~ ^[0-9]+$ ]] && (( t >= 1 && t <= ${#results[@]} )); then
            selections+=("$t")
        else
            echo "Skipping invalid selection: $t"
        fi
    done

    if ((${#selections[@]} == 0)); then
        echo "Nothing to show."
        return 0
    fi

    if (( edit_mode == 1 && ${#selections[@]} == 1 )); then
        f="${results[$((${selections[0]}-1))]}"
        "$EDITOR_CMD" "$f"
        return 0
    fi

    # Default: cat selected notes
    for s in "${selections[@]}"; do
        f="${results[$((s-1))]}"
        cat "$f"
        echo
    done
}

# ---------------- MAIN ----------------

case "${1:-}" in
    create) create_note ;;
    list)   list_notes ;;
    search) search_notes ;;
    *)
        echo "
|                       ＼（〇_ｏ）／                         |
| Welcome to mini-howtos for Troubleshooting and entertaining!  |

Usage:  📝create
        📋list
        🔍search
        "

        ;;
esac
```
