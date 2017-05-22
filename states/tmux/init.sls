tmux:
    pkg.installed


/home/{{ pillar.user}}/.tmux.conf:
    file.managed:
        - source: salt://tmux/files/tmux.conf
