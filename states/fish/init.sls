fish:
    pkg.installed


/home/{{ pillar.user }}/.config/fish/conf.d/:
    file.directory:
        - makedirs: True
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}


set_login_shell:
    module.run:
        - user.chshell:
            - name: {{ pillar.user }}
            - shell: /usr/bin/fish


set_visual:
    cmd.run:
        - name: set -Ux VISUAL vim
        - shell: /usr/bin/fish
        - runas: {{ pillar.user }}
        - unless: test "$VISUAL" = "vim"


fish_functions:
    file.recurse:
        - name: /home/{{ pillar.user }}/.config/fish/functions/
        - source: salt://fish/files/functions/
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
