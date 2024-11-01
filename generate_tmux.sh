#!/usr/bin/env bash

export NET_DEV=$(ip a | grep 134.4 -B 3 | head -n 1 | awk '{ print $2 }' | tr -d ":")

echo "Found network device: $NET_DEV"

/bin/cat << EOF> ~/.tmux.conf
# ============================================= #
# Start with defaults from the Sensible plugin  #
# --------------------------------------------- #
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
# ============================================= #

set  -g default-terminal "screen-256color"
set  -g base-index      1
setw -g pane-base-index 1

new-session

set -g status-keys vi
set -g mode-keys   vi

# rebind main key: C-a
unbind C-b
set -g prefix C-Space
bind -N "Send the prefix key through to the application" \
  C-Space send-prefix

set  -g mouse             on
setw -g aggressive-resize on
setw -g clock-mode-style  24
set  -s escape-time       0
set  -g history-limit     20000

# ============================================= #
# Load plugins                                  #
# --------------------------------------------- #


# tmuxplugin-yank
# ---------------------
set -g @plugin 'tmux-plugins/tmux-yank'


# tmuxplugin-weather
# ---------------------
set -g @plugin 'xamut/tmux-weather'


# tmuxplugin-tmux-fzf
# ---------------------
set -g @plugin 'sainnhe/tmux-fzf'


# tmuxplugin-resurrect
# ---------------------
set -g @plugin 'tmux-plugins/tmux-resurrect'


# tmuxplugin-prefix-highlight
# ---------------------
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'


# tmuxplugin-battery
# ---------------------
set -g @plugin 'tmux-plugins/tmux-battery'


# tmuxplugin-sysstat
# ---------------------
set -g @plugin 'samoshkin/tmux-plugin-sysstat'


# tmuxplugin-copycat
# ---------------------
set -g @plugin 'tmux-plugins/tmux-copycat'


# tmuxplugin-sidebar
# ---------------------
set -g @sidebar-tree 't'
set -g @sidebar-tree-focus 'T'
set -g @sidebar-tree-command 'tree -C'

set -g @plugin 'tmux-plugins/tmux-sidebar'

# tmuxplugin-open
# ---------------------
set -g @open-S 'https://www.google.com/search?q='

set -g @plugin 'tmux-plugins/tmux-open'

# tmuxplugin-dracula
# ---------------------
set -g @dracula-plugins "battery cpu-usage ram-usage network-bandwidth git ssh-session weather time"

# Color options ([background] [foreground/text])
set -g @dracula-battery-colors "pink dark_gray"
set -g @dracula-cpu-usage-colors "orange dark_gray"
set -g @dracula-ram-usage-colors "cyan dark_gray"
set -g @dracula-network-bandwidth-colors "green dark_gray"
set -g @dracula-git-colors "dark_purple white"
set -g @dracula-ssh-session-colors "red dark_gray"
set -g @dracula-attached-clients-colors "yellow dark_gray"
set -g @dracula-weather-colors "light_purple dark_gray"
set -g @dracula-time-colors "white dark_gray"
set -g @dracula-synchronize-panes-colors "dark_gray white"

# Colors
# white='#f8f8f2'
# gray='#44475a'
# dark_gray='#282a36'
# light_purple='#bd93f9'
# dark_purple='#6272a4'
# cyan='#8be9fd'
# green='#50fa7b'
# orange='#ffb86c'
# red='#ff5555'
# pink='#ff79c6'
# yellow='#f1fa8c'

# Display options
set -g @dracula-show-powerline true
set -g @dracula-show-left-sep  
set -g @dracula-show-right-sep  
set -g @dracula-show-flags true
set -g @dracula-show-empty-plugins false
set -g @dracula-show-left-icon shortname
set -g @dracula-refresh-rate 2
set -g @dracula-left-icon-padding 1
set -g @dracula-border-contrast true

# CPU usage options
set -g @dracula-cpu-usage-label ""
set -g @dracula-cpu-display-load true

# Battery options
set -g @dracula-battery-label "󰁹"
set -g @dracula-show-battery true

# RAM useage options
set -g @dracula-ram-usage-label ""

# Network options
set -g @dracula-network-bandwidth $NET_DEV
set -g @dracula-network-bandwidth-interval 2
set -g @dracula-network-bandwidth-show-interface true

# SSH options
set -g @dracula-show-ssh-session-port false

# Time options
set -g @dracula-show-timezone true
set -g @dracula-day-month false
set -g @dracula-military-time true
set -g @dracula-time-format "%a, %b %d, %Y at %H:%M"

# Version control options
set -g @dracula-git-disable-status true
set -g @dracula-git-show-current-symbol ✓
set -g @dracula-git-show-diff-symbol !
set -g @dracula-git-no-repo-message ""
set -g @dracula-git-no-untracked-files true
set -g @dracula-git-show-remote-status true
set -g @dracula-hg-disable-status true
set -g @dracula-hg-show-current-symbol ✓
set -g @dracula-hg-show-diff-symbol !
set -g @dracula-hg-no-repo-message ""
set -g @dracula-hg-no-untracked-files true

# Weather options
set -g @dracula-show-fahrenheit true
set -g @dracula-fixed-location "Los Angeles, CA"
set -g @dracula-show-location false

# Panes options
set -g @dracula-synchronize-panes-label "󰓦"

# TMUX clients options
set -g @dracula-clients-minimum 2
set -g @dracula-clients-singular client
set -g @dracula-clients-plural clients

set -g @plugin 'dracula/tmux'

# ============================================= #

set -g buffer-limit 20
set -g display-time 1500
set -g remain-on-exit off
set -g repeat-time 300
setw -g allow-rename off
setw -g automatic-rename off
set -g set-titles on
set -g set-titles-string "#I:#W"

unbind "\$" # rename-session
unbind ','    # rename-window
unbind '%'    # split-window -h
unbind '"'  # split-window
unbind '}'    # swap-pane -D
unbind '{'    # swap-pane -U
unbind ']'    # paste-buffer
unbind '['    
unbind "'"  # select-window
unbind n    # next-window
unbind p    # previous-window
unbind l    # last-window
unbind M-n  # next window with alert
unbind M-p  # next window with alert
unbind o    # focus thru panes
unbind '&'  # kill-window
unbind "#"  # list-buffer 
unbind '='    # choose-buffer
unbind z    # zoom-pane
unbind M-Up  # resize 5 rows up
unbind M-Down # resize 5 rows down
unbind M-Right # resize 5 rows right
unbind M-Left # resize 5 rows left
unbind r # refresh client

bind c new-window -c "#{pane_current_path}"

set-hook -g after-new-window 'command-prompt -I "#{window_name}" "rename-window '%%'"'

bind a command-prompt -I "#{window_name}" "rename-window '%%'"
bind A command-prompt -I "#{session_name}" "rename-session '%%'
bind C-x confirm-before -p "kill other windows? (y/n)" "kill-window -a"
bind Q confirm-before -p "kill-session #S? (y/n)" kill-session

bind C-u command-prompt -p "Session to merge with: " \
   "run-shell 'yes | head -n #{session_windows} | xargs -I {} -n 1 tmux movew -t %%'"

bind d detach

bind D if -F '#{session_many_attached}' \
    'confirm-before -p "Detach other clients? (y/n)" "detach -a"' \
    'display "Session has only 1 client attached"'

bind C-s if -F '#{s/off//:status}' 'set status off' 'set status on'

bind m setw monitor-activity \; display-message 'Monitor window activity [#{?monitor-activity,ON,OFF}]'

bind M if -F '#{monitor-silence}' \
    'setw monitor-silence 0 ; display-message "Monitor window silence [OFF]"' \
    'command-prompt -p "Monitor silence: interval (s)" "setw monitor-silence %%"'

set -g visual-activity on
set -g @copy_use_osc52_fallback on
bind p paste-buffer
bind C-p choose-buffer
bind -n M-Up copy-mode
bind -T copy-mode-vi M-Up              send-keys -X scroll-up
bind -T copy-mode-vi M-Down            send-keys -X scroll-down
bind -T copy-mode-vi M-PageUp          send-keys -X halfpage-up
bind -T copy-mode-vi M-PageDown        send-keys -X halfpage-down
bind -T copy-mode-vi PageDown          send-keys -X page-down
bind -T copy-mode-vi PageUp            send-keys -X page-up
bind -T copy-mode-vi WheelUpPane       select-pane \; send-keys -X -N 2 scroll-up
bind -T copy-mode-vi WheelDownPane     select-pane \; send-keys -X -N 2 scroll-down

if -b "command -v reattach-to-user-namespace > /dev/null 2>&1" \
    "run 'tmux set -g default-command \"exec $(tmux show -gv default-shell) 2>/dev/null & reattach-to-user-namespace -l $(tmux show -gv default-shell)\"'"
yank="~/.tmux/yank.sh"

bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "$yank"
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "$yank"
bind -T copy-mode-vi Y send-keys -X copy-line \;\
    run "tmux save-buffer - | $yank"
bind-key -T copy-mode-vi D send-keys -X copy-end-of-line \;\
    run "tmux save-buffer - | $yank"
bind -T copy-mode-vi C-j send-keys -X copy-pipe-and-cancel "$yank"
bind-key -T copy-mode-vi A send-keys -X append-selection-and-cancel \;\
    run "tmux save-buffer - | $yank"
bind -T copy-mode-vi MouseDragEnd1Pane \
    send-keys -X copy-pipe "$yank"
bind -T copy-mode-vi MouseDown1Pane select-pane \;\
   send-keys -X clear-selection

# switch panes using CMD-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# open a man page in new window
bind / command-prompt "split-window 'exec man %%'"

# quick view of system stats
bind "~" split-window "exec btop"

# listen for activity on all windows
set -g bell-action any

# choose a client to detach
bind D choose-client

# Split window keys
bind _ split-window -h
bind | split-window

# choose window/session
bind "'" choose-window
bind '"' choose-session

# navigate panes using CMD+jk (no prefix)
bind -r M-j select-pane -t :.-
bind -r M-k select-pane -t :.+

# navigate windows using CMD-hl (no prefix)
bind -r M-h select-window -t :-
bind -r M-l select-window -t :+

# swap panes
bind -r J swap-pane -D
bind -r K swap-pane -U

# list all paste buffers
bind b list-buffers

# choose buffer to paste interactively
bind Space choose-buffer

# delete the most recently copied buffer of text
bind x delete-buffer

# new window
bind C new-window

# quit
bind \ confirm-before kill-server

# reload settings
bind R source-file ~/.tmux.conf

# redisplay
bind r refresh-client

run '~/.tmux/plugins/tpm/tpm'

EOF

ln -s ~/.tmux.conf ~/.tmux/tmux.conf
ln -s ~/.tmux.conf ~/.config/tmux/tmux.conf
