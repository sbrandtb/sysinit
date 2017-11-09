include:
    - fish
    - xclip

ui_aliases:
    file.managed:
        - name: /home/{{ pillar.user }}/.config/fish/functions/ui_aliases.fish
        - source: salt://fish/files/conditional_functions/ui_aliases.fish
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
