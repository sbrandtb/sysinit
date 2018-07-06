include:
    - pip
    - virtualenv


awslogs:
    pip:
        - removed
    virtualenv.managed:
        - name: /home/{{ pillar.user }}/.virtualenvs/awslogs
        - requirements: salt://awslogs/files/requirements.txt
        - user: {{ pillar.user }}
    file.managed:
        - name: /home/{{ pillar.user }}/.config/fish/conf.d/awslogs.fish
        - contents: set -x PATH $PATH /home/sebastian/.virtualenvs/awslogs/bin
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
