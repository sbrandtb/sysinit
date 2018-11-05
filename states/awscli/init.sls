include:
    - pip
    - virtualenv


awscli:
    pip:
        - removed
    virtualenv.managed:
        - name: /home/{{ pillar.user }}/.virtualenvs/awscli
        - requirements: salt://awscli/files/requirements.txt
        - user: {{ pillar.user }}
    file.managed:
        - name: /home/{{ pillar.user }}/.config/fish/conf.d/awscli.fish
        - contents: set -x PATH $PATH /home/sebastian/.virtualenvs/awscli/bin
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
