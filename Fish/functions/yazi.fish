function y
    # Check if yazi exists
    set yazi_bin (which yazi)
    if command -q $yazi_bin
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        $HOME/.local/bin/yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    else
        echo "yazi is not installed!"
    end
end
