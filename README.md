# Git Automation Script

This Bash script automates common Git operations, such as creating branches, committing changes, and pushing them to a remote repository. It's designed to simplify the workflow for developers working with Git.

## Usage

To use the script, simply run it from within a Git repository with the following command-line arguments:

```
./script.sh <branch_name> "<commit_message>"
```

- `<branch_name>`: The name of the branch where changes will be committed and pushed. If the branch already exists, the script will switch to it; otherwise, it will create a new branch with the specified name.
- `<commit_message>`: The commit message describing the changes being committed.

## Functionality

### 1. `check_git_repo`

This function checks whether the current directory is a Git repository by verifying the presence of the `.git` directory. If the directory doesn't exist, the script exits with an error message.

### 2. `check_changes`

This function uses `git status --porcelain` to check whether there are any uncommitted changes in the repository. If changes are detected, it returns a status code of 0; otherwise, it returns 1.

### 3. `commit_push`

This function performs the following steps:
- Checks if the specified branch already exists. If it does, it displays a message indicating that the branch exists; otherwise, it creates a new branch with the provided name.
- Adds all changes (`git add .`), commits them with the provided commit message (`git commit -m "$message"`), and pushes them to the specified branch (`git push origin "$branch"`).

## Example

Suppose you want to commit changes to a new branch named `feature-branch` with the commit message "Implement new feature". You would run the script as follows:

```
./script.sh feature-branch "Implement new feature"
```

This would create the `feature-branch` if it doesn't exist, add, commit, and push the changes to it.
