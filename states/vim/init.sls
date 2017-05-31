vim:
    pkg.installed


/home/{{ pillar.user }}/.vimrc:
    file.append:
        - text:
            - |
              highlight OverLength ctermbg=red ctermfg=white guibg=#592929
              match OverLength /\%81v.\+/
            - set number
            - syntax on
