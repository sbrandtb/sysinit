/home/{{ pillar.user }}/source:
  file.directory:
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
