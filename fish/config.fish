# Suppress welcome message
set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
end
# Edit your Fish config
nano ~/.config/fish/config.fish

# Add these lines to automatically start SSH agent
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
    set -gx SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -gx SSH_AGENT_PID $SSH_AGENT_PID
end
