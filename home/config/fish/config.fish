if uwsm check may-start; and uwsm select
	exec uwsm start default
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting
starship init fish | source
