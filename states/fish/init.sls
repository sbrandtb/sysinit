fish:
    pkg.installed


/home/{{ pillar.user }}/.config/fish/conf.d/:
    file.directory
