
/etc/salt/minion:
    file.append:
        - text: 'state_output: changes'
