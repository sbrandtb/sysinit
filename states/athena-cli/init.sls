include:
    - pip
    - virtualenv


athena-cli:
    pip:
        - removed
    virtualenv.managed:
        - name: /home/{{ pillar.user }}/.virtualenvs/athena-cli
        - requirements: salt://athena-cli/files/requirements.txt
        - user: {{ pillar.user }}
    file.managed:
        - name: /home/{{ pillar.user }}/.config/fish/conf.d/athena-cli.fish
        - contents: set -x PATH $PATH /home/sebastian/.virtualenvs/athena-cli/bin
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
