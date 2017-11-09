base:
    '*':
        - fish.virtualfish
        - git
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
