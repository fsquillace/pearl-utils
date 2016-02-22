function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
	and set retc green; or set retc red
    tty|grep -q tty; and set tty tty; or set tty pts

    set_color $retc
    if [ $tty = tty ]
        echo -n .-
    else
        echo -n '┬─'
    end

    echo -n (set_color green)'['(set_color $retc)(date "+%H:%M:%S")(set_color green)']'

    set_color $retc
    if [ $tty = tty ]
        echo -n '-'
    else
        echo -n '─'
    end

    set_color green
    echo -n [
    # Just calculate this once, to save a few cycles when displaying the prompt
    if not set -q prompt_user
        set -l f_rgb (echo (echo $USER | sum - | cut -d' ' -f1)" % 999" | bc)
        set -g prompt_user (set_color $f_rgb)$USER
    end
    echo -n $prompt_user

    set_color white
    echo -n @

    # Just calculate this once, to save a few cycles when displaying the prompt
    if not set -q prompt_hostname
        set -l f_rgb (echo (hostname | sum - | cut -d' ' -f1)" % 999" | bc)
        set -g prompt_hostname (set_color $f_rgb)(hostname|cut -d . -f 1)
    end
    echo -n $prompt_hostname

    set_color normal
    echo -n ':'
    set_color red
    if [ -O $PWD ]
        set_color blue
    else if [ -w $PWD ]
        set_color green
    end
    #echo -n ' '(basename $PWD)
    echo -n (prompt_pwd)
    set_color normal
    echo -n (__fish_git_prompt)
    set_color green
    echo -n ']'
    set_color normal

    set -l job_number (jobs | wc -l)
    if test $last_status -ne 0 -o $job_number -gt 0
        set_color $retc
        if [ $tty = tty ]
            echo -n '-'
        else
            echo -n '─'
        end

        set_color green
        echo -n '['
        set_color normal
        if test $last_status -ne 0
            set_color $retc
            echo -n $last_status
        end
        if test $job_number -gt 0
            set_color yellow
            echo -n $job_number
        end
        set_color green
        echo -n ]
        set_color normal
    end
    echo

    for job in (jobs)
        set_color $retc
        if [ $tty = tty ]
            echo -n '; '
        else
            echo -n '│ '
        end
        set_color brown
        echo $job
    end
    set_color normal
    set_color $retc
    if [ $tty = tty ]
        echo -n "'-> "
    else
        echo -n '╰─> '
    end
    set_color normal
end

# vim: ft=sh
