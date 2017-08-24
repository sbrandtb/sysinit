function gitreset --description 'set local branch to updated BRANCH (default: master), prune remote and local branches.' --argument BRANCH
    if test -z "$BRANCH"
        set BRANCH master
    end
    if not git stash | grep -q "No local changes to save"
        set stashed "1"
    end
    git checkout $BRANCH
    git pull --rebase ;and git remote prune origin ;and git branch --merged $BRANCH | grep -v "\*" | xargs -r -n 1 git branch -d
    and if test -n "$stashed"
       git stash pop
    end
    git submodule update
end
