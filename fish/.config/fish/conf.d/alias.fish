alias "gg=g++"
alias "ka=killall"
alias "pkg_size=expac -H M '%m\t%n' | sort -h"
alias 'brn=brn2'
alias 'cl=tty-clock -cC7'
alias 'cx=chmod +x'
alias 'ff=vifm .'
alias 'i=clear && echo "I use   BTW" && fastfetch'
alias 'icat=kitten icat'
alias 'lf=vimgolf'
alias 'lg=lazygit'
alias 'nv=clear && nvidia-smi'
alias 'sd=unset all_proxy ALL_PROXY && ~/Applications/stable-diffusion-webui/webui.sh'
alias 'si=swayimg'

# zoxide
alias 'cd=__zoxide_z'
alias 'm=__zoxide_zi'

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
alias 'h=nvim "+cd ~/.config/hypr | FzfLua files"'
alias 'k=nvim ~/.config/kitty/kitty.conf'
alias 'lc=nvim leetcode.nvim'
alias 't=nvim ~/Documents/VimWiki/TODO.md'
alias 'v=nvim'
alias 'vc=nvim "+FzfLua files cwd=~/.config/nvim"'
alias 'vd=nvim ~/Documents/VimWiki/diary.md'
alias 'vr=nvim -R' # read only
alias 'vt=nvim ~/Documents/VimWiki/index.md'
alias 'vv=nvim .' # open current directory with oil.nvim
alias 'vf=nvim ~/.config/fish/config.fish && source ~/.config/fish/config.fish'
alias 'vfa=nvim ~/.config/fish/conf.d/alias.fish && source ~/.config/fish/conf.d/alias.fish'
alias 'vfv=nvim ~/.config/fish/conf.d/variables.fish && source ~/.config/fish/conf.d/variables.fish'
alias 'vimdiff=nvim -d'
alias 'f=fd --type f | fzf | xargs -I {} nvim {}'
alias 'his=history | nvim -'

# something might be useful
alias 'term_size=echo "Rows=$(tput lines) Cols=$(tput cols)"'

# kmonad
alias 'kk=killall kmonad'
alias 'km=kmonad ~/.config/kmonad/config.kbd &'
alias 'vk=nvim ~/.config/kmonad/config.kbd'
