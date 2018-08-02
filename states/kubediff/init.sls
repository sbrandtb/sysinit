include:
    - sources-dir

kubediff:
    git.latest:
        - name: https://github.com/weaveworks/kubediff.git
        - target: /home/{{ pillar.user }}/source/kubediff
    virtualenv.managed:
        - name: /home/{{ pillar.user }}/.virtualenvs/kubediff
        - requirements: /home/{{ pillar.user }}/source/kubediff/requirements.txt
        - user: {{ pillar.user }}
    file.managed:
        - name: /home/{{ pillar.user }}/.config/fish/conf.d/kubediff.fish
        - contents: set -x PATH $PATH /home/sebastian/.virtualenvs/kubediff/bin
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
