include:
    - fish
    - virtualenv


virtualfish:
    pip:
        - removed
    virtualenv.managed:
        - name: /home/{{ pillar.user }}/.virtualenvs/virtualfish
        - requirements: salt://fish/files/virtualfish/requirements.txt
        - user: {{ pillar.user }}
    file.managed:
        - name: /home/{{ pillar.user }}/.config/fish/conf.d/virtual.fish
        - contents: eval (~/.virtualenvs/virtualfish/bin/python -m virtualfish compat_aliases projects auto_activation global_requirements)
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
