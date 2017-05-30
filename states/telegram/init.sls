telegram:
    archive.extracted:
        - name: /home/{{ pillar.user }}/
        - if_missing: /home/{{ pillar.user }}/Telegram/Telegram
        - source: https://telegram.org/dl/desktop/linux
        - user: {{ pillar.user }}
        - group: {{ pillar.user }}
        - archive_format: tar
        - skip_verify: True
        - keep: True
