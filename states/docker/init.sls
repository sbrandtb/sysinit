docker-requirements:
    pkg.installed:
        - names:
            - apt-transport-https
            - ca-certificates
            - curl
            - software-properties-common
    pkgrepo.managed:
        - name: deb [arch={{ grains.osarch }}] https://download.docker.com/linux/{{ grains.os|lower }} {{ grains.oscodename }} stable


docker-ce:
    pkg.installed
