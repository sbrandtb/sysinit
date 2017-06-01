git:
    pkg.installed


git_config_push:
    git.config_set:
        - name: push.default
        - global: True
        - value: current
