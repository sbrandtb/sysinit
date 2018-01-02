base:
    '*':
        - fish.virtualfish
        - htop
        - salt.minion
        - tmux
        - vim
    'roles:ui':
        - match: grain
        - fish.ui
        - keepass2
        - restview
        - telegram
    'roles:dev':
        - match: grain
        - docker
        - mssql-cli
        - git
