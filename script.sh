#!/bin/bash

usage() {
    echo "Usage $0 <branch> <commit message>"
    exit 1
}
check_git_repo() {
    if [ ! -d .git ]; then
        echo "Error: Not a Git Repository".
        exit 1
    fi

}

check_changes() {
    if [[ $(git status --porcelain) ]]; then
        return 0
    else
        return 1
    fi
}

commit_push() {
    local branch="$1"
    local message="$2"
    if git rev-parse --verify "$branch" >/dev/null 2>&1; then
        echo "Branch '$branch' already exists."
    else
        git checkout -b "$branch"
    fi

    git add .
    git commit -m "$message"
    git push origin "$branch"
    echo "Changes committed and pushed successfully to branch $branch. "
}

check_git_repo
if [$# -ne 2]; then
    usage
fi

branch="$1"
message="$2"

if check_changes; then
    commit_push "$branch" "$message"
else
    echo "No changes to commit."
fi