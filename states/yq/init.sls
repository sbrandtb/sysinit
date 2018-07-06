include:
    - pip
    - virtualenv


yq:
    pip:
        - removed
    virtualenv.managed:
        - name: /home/{{ pillar.user }}/.virtualenvs/yq
        - requirements: salt://yq/files/requirements.txt
        - user: {{ pillar.user }}
    file.managed:
        - name: /home/{{ pillar.user }}/.config/fish/conf.d/yq.fish
        - contents: set -x PATH $PATH /home/sebastian/.virtualenvs/yq/bin
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
