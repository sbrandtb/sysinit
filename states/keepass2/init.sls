include:
    - xdotool


keepass-plugin-ppa:
    pkgrepo.managed:
        - name: ppa:dlech/keepass2-plugins


keepass:
    pkg.installed:
        - names:
            - keepass2
            - keepass2-plugin-rpc
            - keepass2-plugin-tray-icon
