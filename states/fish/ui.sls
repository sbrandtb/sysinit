include:
    - fish
    - xclip


ui_aliases:
    file.managed:
        - name: /home/{{ pillar.user }}/.config/fish/conf.d/ui_aliases.fish
        - contents: alias toclip "xclip -selection c"
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
