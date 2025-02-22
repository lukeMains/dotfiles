if status is-interactive
    # Commands to run in interactive sessions can go here
    if command -q pyenv
        pyenv init - | source
    end

    # fnm (fast node manager)
    if command -q fnm
        fnm env --use-on-cd | source
    end

    # direnv - Automatic environment setup when you `cd <dir>`
    if command -q direnv
        direnv hook fish | source
    end

    # pnpm
    set -gx PNPM_HOME "/home/alienmuskox/.local/share/pnpm"
    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end
    # pnpm end

    # Add local programs to path
    set -gx PATH "$HOME/.local/bin" $PATH
end
