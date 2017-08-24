vim:
    pkg.installed


/home/{{ pillar.user }}/.vimrc:
    file.append:
        - text:
            - autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
            - |
              highlight OverLength ctermbg=red ctermfg=white guibg=#592929
              match OverLength /\%81v.\+/
            - set number
            - set textwidth=80
            - syntax on
