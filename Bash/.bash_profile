eval $(thefuck --alias)
eval "$(oh-my-posh init bash --config ~/.thecyberden-babis.omp.json)"

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi
