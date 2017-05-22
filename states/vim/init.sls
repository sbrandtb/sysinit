vim:
    pkg.installed


/home/{{ pillar.user }}/.vimrc:
    file.append:
        - text:
            - set number
            - syntax on
