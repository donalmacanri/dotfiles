if $(gls &>/dev/null)
then
  alias ls="gls"
fi

alias ls="ls -F --color"
alias l="ls -lAh --color"
alias ll="ls -l --color"
alias la='ls -A --color'
