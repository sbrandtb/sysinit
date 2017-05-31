fish:
    pkg.installed


/home/{{ pillar.user }}/.config/fish/conf.d/:
    file.directory:
        - makedirs: True
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}


set_login_shell:
    module.run:
        - name: user.chshell
        - m_name: {{ pillar.user }}
        - shell: /usr/bin/fish


set_visual:
    cmd.run:
        - name: set -Ux VISUAL vim
        - shell: /usr/bin/fish
        - runas: {{ pillar.user }}
        - unless: test "$VISUAL" = "vim"
