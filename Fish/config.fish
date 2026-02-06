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

    # TokyoNight Color Palette
    set -l foreground c8d3f5
    set -l selection 2d3f76
    set -l comment 636da6
    set -l red ff757f
    set -l orange ff966c
    set -l yellow ffc777
    set -l green c3e88d
    set -l purple fca7ea
    set -l cyan 86e1fc
    set -l pink c099ff

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_option $pink
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
    set -g fish_pager_color_selected_background --background=$selection

    # Setup atuin
    if command -q atuin
        set -gx ATUIN_NOBIND true
        atuin init fish | source

        # bind to ctrl-r in normal and insert mode, add any other bindings you want here too
        # bind \cr _atuin_search
        bind -M insert \cr _atuin_search
    end
end

# Added by LM Studio CLI tool (lms)
set -gx PATH $PATH /home/alienmuskox/.lmstudio/bin
