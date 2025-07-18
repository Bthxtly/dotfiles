alias "fzf=fzf --bind=ctrl-e:preview-down,ctrl-y:preview-up --reverse --color=16 --preview-window=65%:wrap:border-sharp: --preview 'pygmentize -f terminal {}'"
alias "gpp=g++"
alias "ka=killall"
alias "pkg_size=expac -H M '%m\t%n' | sort -h"
alias 'brn=brn2'
alias 'cl=tty-clock -cC7'
alias 'cx=chmod +x'
alias 'ff=vifm .'
alias 'hib=systemctl hibernate'
alias 'i=clear && echo "I use   BTW" && fastfetch'
alias 'icat=kitten icat'
alias 'lg=lazygit'
alias 'nv=clear && nvidia-smi'
alias 'sd=unset all_proxy ALL_PROXY && ~/Applications/stable-diffusion-webui/webui.sh'
alias 'sus=systemctl suspend'
alias 'lf=vimgolf'
alias 'sa=source .venv/bin/activate'
alias 'da=deactivate'

# wayland
alias 'code=code  --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto'
alias 'mechvibes=mechvibes --in-process-gpu'

# ls
alias 'l=eza -lh --icons auto'
alias 'll=eza -lah --icons auto'
alias 'ls=eza --icons auto'
alias 'sl=eza --icons auto'
alias 's=eza --icons auto'
alias 'lt=eza --icons auto --tree'

# cd
alias 'ct=cd /tmp'

# exit
alias ':q=exit'
alias ':wq=exit'
alias 'e=exit'
alias 'q=exit'
alias 'exti=exit'
alias 'eixt=exit'
alias 'eitx=exit'
alias 'etxi=exit'
alias 'etix=exit'
alias 'xeit=exit'
alias 'xeti=exit'
alias 'xiet=exit'
alias 'xite=exit'
alias 'xtei=exit'
alias 'xtie=exit'

# git
alias 'gc=git commit -m'
alias 'gk=git checkout'
alias 'gu=git commit -m "update"'
alias 'gr=git rebase'
alias 'guu=git add --all && git commit -m "update" && git push'
alias 'gla=git log --all --decorate --oneline --graph'

# [neo]vim
alias 'h=cd $HOME/.config/hypr && nvim "+FzfLua files"'
alias 'k=nvim ~/.config/kitty/kitty.conf'
alias 'lc=nvim leetcode.nvim'
alias 't=nvim ~/Documents/VimWiki/TODO.md'
alias 'v=nvim'
alias 'vc=nvim "+FzfLua files cwd=~/.config/nvim"'
alias 'vd=nvim ~/Documents/VimWiki/diary.md'
alias 'vr=nvim -R' # read only
alias 'vt=nvim ~/Documents/VimWiki/index.md'
alias 'vv=nvim .' # open current directory with oil.nvim
alias 'vz=nvim ~/.zshrc && source ~/.zshrc'
alias 'vza=nvim ~/.oh-my-zsh/custom/aliases.zsh && source ~/.oh-my-zsh/custom/aliases.zsh'
alias 'vzv=nvim ~/.oh-my-zsh/custom/variables.zsh && source ~/.oh-my-zsh/custom/variables.zsh'
alias 'vimdiff=nvim -d'
alias 'f=fd --type f | fzf | xargs -I {} nvim {}'

# something might be useful
alias 'term_size=echo "Rows=$(tput lines) Cols=$(tput cols)"'

# kmonad
alias 'kk=killall kmonad'
alias 'km=kmonad ~/.config/kmonad/config.kbd &'
alias 'vk=nvim ~/.config/kmonad/config.kbd'

# proxy
alias proxy="
    export http_proxy=socks5://127.0.0.1:7897;
    export https_proxy=socks5://127.0.0.1:7897;
    export all_proxy=socks5://127.0.0.1:7897;
    export no_proxy=socks5://127.0.0.1:7897;
    export HTTP_PROXY=socks5://127.0.0.1:7897;
    export HTTPS_PROXY=socks5://127.0.0.1:7897;
    export ALL_PROXY=socks5://127.0.0.1:7897;
    export NO_PROXY=socks5://127.0.0.1:7897;"
alias unproxy="
    unset http_proxy;
    unset https_proxy;
    unset all_proxy;
    unset no_proxy;
    unset HTTP_PROXY;
    unset HTTPS_PROXY;
    unset ALL_PROXY;
    unset NO_PROXY"
