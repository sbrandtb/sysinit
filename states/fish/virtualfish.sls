include:
    - fish


virtualfish:
    pip.installed


/home/{{ pillar.user }}/.config/fish/conf.d/virtual.fish:
    file.managed:
        - contents: eval (python -m virtualfish compat_aliases projects auto_activation global_requirements)
