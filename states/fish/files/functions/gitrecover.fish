function gitrecover
    gitk --all ( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )
end
