include:
    - pip
    - virtualenv


mssql-cli:
    pip:
        - removed
    virtualenv.managed:
        - name: /home/{{ pillar.user }}/.virtualenvs/mssql-cli
        - requirements: salt://mssql-cli/files/requirements.txt
        - user: {{ pillar.user }}
    file.managed:
        - name: /home/{{ pillar.user }}/.config/fish/conf.d/mssql-cli.fish
        - contents: set -x PATH /home/sebastian/.virtualenvs/mssql-cli/bin $PATH
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
