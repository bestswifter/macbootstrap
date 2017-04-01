# good experience with git.
alias ga='git add'
alias gai='git add -i'
alias gan='git_add_new_files'
alias gap='git add -p'
alias gau='git add -u'
alias gb='git branch'
alias gc='git commit'
alias gcb='git checkout -b'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gd='git diff'
alias gdc='git diff --color'
alias gdr='git_recursive_diff'
alias gds='git diff --staged'
alias gdt='git difftool --dir-diff'
alias gdiff='git difftool --dir-diff HEAD HEAD~'
alias gf='git fetch'
alias gfr='git fetch;git rebase;'
alias gg='git lg'
alias ggrep='git grep'
alias gignore='git update-index --assume-unchanged'
alias glp='git log -p'
alias gm='git merge'
alias go='git checkout'
alias gpush='git push origin HEAD:dev;'
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grh='git reset --hard'
alias gri='git rebase -i'
alias gro='git rebase -i --onto'
alias grs='git reset --soft'
alias gs='git stash'
alias gsfrs='git stash;git fetch;git rebase;git stash pop;'
alias gsp='git stash pop'
alias gsr='git_recursive_status'
alias gss='git status --short'
alias gst='_git_show_commit_in_tool'
alias cdsubmodule='GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null) && [[ -n "$GIT_ROOT" ]] && [[ -f "$GIT_ROOT/.gitmodules" ]] && realpath=$(awk -F= "/path =/ {print substr(\$2, 2)}" "$GIT_ROOT/.gitmodules") && cd "$GIT_ROOT/$realpath"'

function gom() {
    git ls-files -m $*|while read -r file;
    do
        git checkout "$file";
    done
}

function gdv() {
    if [[ -n "$1" ]] ; then
        git diff "$*"|gvim -R -
    else
        git diff|gvim -R -
    fi
}

function git_add_new_files() {
    git status --short "$*"|grep '^??'|cut -c 4-|while read -r file;do git add "$file";done
}

function deleteNewFiles() {
    git status --short "$*"|grep '^??'|cut -c 4-|while read -r file;do rm -rf "$file";done
}

function editConfilicts() {
    gvim $(git status --short|grep ^UU|awk '{print $2}')
}

function showConfilictsInRevesion() {
    if [[ -n "$1" ]] ; then
        echo "will show $*"
    else
        echo "you must specify a revision."
        kill -INT $$
    fi
    git status --short|grep ^UU|awk '{print $2}'|while read -r file;
    do
        echo "file:$file in $*"
        git show "$*:$file"
    done
}

function showModifiedFilesInRevesion() {
    if [[ -n "$1" ]] ; then
        echo "will show $*"
    else
        echo "you must specify a revision."
        kill -INT $$
    fi
    git status --short|grep '^ M'|awk '{print $2}'|while read -r file;
    do
        echo "file:$file in $*"
        git show "$*:$file"
    done
}

# copy lxf's scripts.
function __cherry_pick_help() {
    echo "Usage: git_cherry_pick_with_user [-n|--no-date] <commit>..."
}

function __cherry_pick_single_commit() {
    nodate="$1"
    commit="$2"
    committer="$(git log --pretty=fuller -1 $commit|grep 'Commit:'|sed 's/Commit: *//')"
    name="$(echo $committer|sed 's/\(.*\) <.*/\1/')"
    email="$(echo $committer|sed 's/[^<]*//')"
    date="$(git log --pretty=fuller -1 $commit|grep CommitDate|sed 's/CommitDate: *//')"
    echo "Picking $commit $name|$email|$date"
    oldName="$(git config user.name)"
    oldEmail="$(git config user.email)"
    git config user.name "$name"
    git config user.email "$email"
    if [[ "$nodate" == "0" ]]; then
        GIT_AUTHOR_DATE="$date" && GIT_COMMITTER_DATE="$date" && git cherry-pick "$commit"
    else
        git cherry-pick "$commit"
    fi
    git config user.name "$oldName"
    git config user.email "$oldEmail"
}

function git_cherry_pick_with_user() {
    nodate="0"
    case "$1" in
    -h|--help)
        __cherry_pick_help
        ;;
    -n|--no-date)
        nodate="1"
        shift
        ;;
    *)
    ;;
    esac
    if [[ "$1" == "" ]]; then
        __cherry_pick_help
    else
    while [[ $# -gt 0 ]]; do
        commits="$1"
        if [[ -n $(echo "$commits"|grep "\.\.") ]]; then
            for commit in $(git rev-list --reverse "$commits"); do
                __cherry_pick_single_commit $nodate "$commit"
            done
        else # Single commit.
            __cherry_pick_single_commit $nodate "$commits"
        fi
        shift
    done
    fi
}

function git_recursive_status() {
    current=$(git status --short)
    if [[ -n $current ]];
    then
        pwd
        git status --short
    fi
    if [[ -f .gitmodules ]];
    then
        cat .gitmodules|awk -F= '/path = /{print $2}'|while read dir;
        do
            (cd $dir;git_recursive_status)
        done
    fi
}

function git_show_modified_file_names() {
    git ls-files -m "$*"
}

function git_recursive_diff() {
    current=$(git status --short)
    if [[ -n $current ]];
    then
        pwd
        if [[ -n "$*" ]];
        then
            git diff "$*"
        else
            git diff
        fi
    fi
    if [[ -f .gitmodules ]];
    then
        cat .gitmodules|awk -F= '/path = /{print $2}'|while read dir;
        do
            (cd $dir;git_recursive_diff "$*")
        done
    fi
}

function git_svn_clone_from_branch_base() {
    url="$*"
    logs="$(svn log --stop-on-copy $url)"
    revision="$(echo $logs|awk -F\| '/^r[0-9]+/{print $ 1}'|tail -n 1|sed 's/r//'|sed 's/ //g')"
    echo "cloning from $revision for $url"
    git svn clone -r"$revision":HEAD "$url"
}

function git_svn_clone_from_last_10() {
    url="$*"
    logs="$(svn log -l 10 $url)"
    revision="$(echo $logs|awk -F\| '/^r[0-9]+/{print $ 1}'|tail -n 1|sed 's/r//'|sed 's/ //g')"
    echo "cloning from $revision for $url"
    git svn clone -r"$revision":HEAD "$url"
}

function git_svn_clone_from_last_20() {
    url="$*"
    logs="$(svn log -l 20 $url)"
    revision="$(echo $logs|awk -F\| '/^r[0-9]+/{print $ 1}'|tail -n 1|sed 's/r//'|sed 's/ //g')"
    echo "cloning from $revision for $url"
    git svn clone -r"$revision":HEAD "$url"
}

function git_svn_clone_from_last_50() {
    url="$*"
    logs="$(svn log -l 50 $url)"
    revision="$(echo $logs|awk -F\| '/^r[0-9]+/{print $ 1}'|tail -n 1|sed 's/r//'|sed 's/ //g')"
    echo "cloning from $revision for $url"
    git svn clone -r"$revision":HEAD "$url"
}

function git_svn_clone_from_last_100() {
    url="$*"
    logs="$(svn log -l 100 $url)"
    revision="$(echo $logs|awk -F\| '/^r[0-9]+/{print $ 1}'|tail -n 1|sed 's/r//'|sed 's/ //g')"
    echo "cloning from $revision for $url"
    git svn clone -r"$revision":HEAD "$url"
}

function _git_show_commit_in_tool() {
    local commit="$1"
    [[ -z "$commit" ]] && commit='HEAD'
    shift
    local tool="$1"
    [[ -z "$tool" ]] && tool="$(git config diff.tool)"
    git difftool --tool="$tool" "$commit" "$commit^"
}

function up() {
    find . -d -name .git|while read -r type;
    do
        if [[ -n "$type" ]]; then
            (cd "$type/.." && pwd;
            [[ -n "$(git config remote.origin.url)" ]] && git fetch
            grep -c "svn-remote" ".git/config" 1>/dev/null 2>&1 && git svn fetch && git branch -f svn git-svn
            )
        fi
    done
}

function kgitx() {
    local pids=$(ps -A|grep GitX|grep -v grep|awk '{print $1}')
    echo "$pids"|while read -r pid;
    do
       if [[ -n "$pid" ]]; then
            kill -9 $pid
        fi
    done
    gitx "$*"
}

function git_merge_svn_from_to() {
    local base="$2"
    local from="$1"
    [[ -z "$2" ]] && base="HEAD"
    [[ -z "$1" ]] && from="trunk/svn"
    last_merge_svn_version=$(git log --oneline --grep 'Merge trunk, ' "$base"|head -n 1|column 4)
    [[ -n "$last_merge_svn_version" ]] && last_merge_commit_hash=$(git log --max-count=1 --grep "@$last_merge_svn_version " "$from^"|head -n 1|column 2)
    [[ -n "$last_merge_commit_hash" ]] && latest_version=$(git log --max-count=1 "$from"|grep 'git-svn-id:'|awk -F'@' '{print $2}'|column 1)
    [[ -n "$latest_version" ]] && git checkout "$from" && git reset "$last_merge_commit_hash" --soft && git commit --no-verify --author="TrunkMerger<>" -m"Merge trunk, $latest_version" && git rebase -i --onto "$base" HEAD~ HEAD
}

function git_get_svn_revision() {
    local from="$1"
    [[ -z "$1" ]] && from="HEAD"
    git log --max-count=1 "$from"|grep 'git-svn-id:'|awk -F'@' '{print $2}'|column 1
}

function gnext() {
    git log --reverse --pretty=%H master | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout
}

function gprevious() {
    git checkout HEAD^1
}
