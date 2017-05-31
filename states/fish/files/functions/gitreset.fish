function gitreset --description 'set local branch to updated master, prune remote and local branches.'
    if not git stash | grep -q "No local changes to save"
        set stashed "1"
    end
    git checkout master
    git pull --rebase ;and git remote prune origin ;and git branch --merged | grep -v "\*" | xargs -r -n 1 git branch -d
    and if test -n "$stashed"
       git stash pop
    end
    git submodule update
end
