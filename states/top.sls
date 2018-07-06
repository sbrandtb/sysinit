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
        - restview
        - telegram
    'roles:dev':
        - match: grain
        - docker
        - mssql-cli
        - git
        - yq
