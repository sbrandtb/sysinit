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
        - keepass2
        - restview
        - telegram
