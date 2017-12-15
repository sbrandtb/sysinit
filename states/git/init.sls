git:
    pkg.installed


git_config_push:
    git.config_set:
        - name: push.default
        - global: True
        - value: current


git_config_pull:
    git.config_set:
        - name: pull.rebase
        - global: True
        - value: "true"
