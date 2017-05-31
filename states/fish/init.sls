fish:
    pkg.installed


/home/{{ pillar.user }}/.config/fish/conf.d/:
    file.directory:
        - makedirs: True
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
