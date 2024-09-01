if status is-interactive
    # Commands to run in interactive sessions can go here
    pyenv init - | source

    # fnm (fast node manager)
    fnm env --use-on-cd | source

    # pnpm
    set -gx PNPM_HOME "/home/alienmuskox/.local/share/pnpm"
    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end
    # pnpm end

    # Add local programs to path
    set -gx PATH "$HOME/.local/bin" $PATH
end

# pnpm
set -gx PNPM_HOME "/home/alienmuskox/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
