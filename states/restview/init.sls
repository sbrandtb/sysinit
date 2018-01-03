include:
    - fish
    - pip
    - virtualenv


restview:
    pip:
        - removed
    virtualenv.managed:
        - name: /home/{{ pillar.user }}/.virtualenvs/restview
        - requirements: salt://restview/files/requirements.txt
        - user: {{ pillar.user }}
    file.managed:
        - name: /home/{{ pillar.user }}/.config/fish/conf.d/restview.fish
        - contents: set -x PATH $PATH /home/sebastian/.virtualenvs/restview/bin
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
