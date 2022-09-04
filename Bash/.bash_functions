# Enter the following 3 lines in ~/.bashrc
# if [ -e $HOME/.bash_functions ]; then
#     source $HOME/.bash_functions
# fi

function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls --file-type --color=auto
}