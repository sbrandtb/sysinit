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
        - awslogs
        - docker
        - mssql-cli
        - git
        - sources-dir
        - yq
