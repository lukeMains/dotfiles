if status is-interactive
    # Commands to run in interactive sessions can go here

    # fnm (fast node manager)
    if command -q fnm
        fnm env --version-file-strategy=recursive | source
    end

    # direnv - Automatic environment setup when you `cd <dir>`
    if command -q direnv
        direnv hook fish | source
    end

    # Add local programs to path
    set -gx PATH "$HOME/.local/bin" $PATH
end
