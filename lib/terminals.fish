
# This module has a dependency to utils.fish
# vim: ft=sh

# A tmux wrapper
function txum

    set -l OPT_GO false
    set -l OPT_KEY ""
    set -l OPT_KILL false
    set -l OPT_HELP false
    set -l i 1
    while math "$i <=" (count $argv) > /dev/null
        switch $argv[$i]
            case -g --go
                set OPT_GO true
                set i (math "$i + 1")
                set OPT_KEY "$argv[$i]"
            case -k --kill
                set OPT_KILL true;
                set i (math "$i + 1")
                set OPT_KEY "$argv[$i]"
            case -h --help
                set OPT_HELP true
            case --
                set i (math "$i + 1")
            case -
                set ARGS -
                break
            case '-*'
                echo "Invalid option $argv[$i]"
                return 1
            case '*'
                set ARGS $argv[$i..-1]
                break
        end
        set i (math "$i + 1")
    end

    if eval $OPT_HELP
        eval tmux --help
        echo ""
        echo -e "Extra usage from the wrapper: tmux [options]"
        echo -e "Options:"
        echo -e "\t-g, --go              Go to the directory selected by the key and create a tmux session"
        echo -e "\t-k, --kill            Kill the tmux session identified by the key"
        echo -e "\t-h, --help            Show this help message"
        return 0
    end

    if begin; eval $OPT_GO; and eval $OPT_KILL; end
        echo "The options --go and --kill cannot stay togheter."
        return 1
    end

    if eval $OPT_GO
        set -l owd $PWD
        set -l wd (c -p $OPT_KEY)
        [ -d "$wd" ]; or set wd $PWD
        cd $wd
        if not tmux has-session -t "$OPT_KEY" ^ /dev/null
            tmux new-session -d -s "$OPT_KEY"
            # It looks the following 'default-path' is deprecated
            #tmux set-option -t "$OPT_KEY" default-path $wd #&> /dev/null
        end
        tmux new-session -AD -s "$OPT_KEY"
        cd $owd
    else if eval $OPT_KILL
        tmux kill-session -t "$OPT_KEY"
    else
        tmux $ARGS
    end

    return 0
end