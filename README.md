# AngAssignment1

# Setting up remote github repo

If you haven't installed github CLI then 

`brew install gh`

In Github generate a token Settings->Developer Settings->Personal access tokens

`gh auth login`

```bash
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Paste an authentication token
Tip: you can generate a Personal Access Token here https://github.com/settings/tokens
The minimum required scopes are 'repo', 'read:org', 'workflow'.
? Paste your authentication token: ****************************************
- gh config set -h github.com git_protocol https
✓ Configured git protocol
✓ Logged in as jmwollny
jonathanwollny@Jonathans-MacBook-Air ang-assignment1 % 
```

`gh repo create`

```bash
? What would you like to do? Push an existing local repository to GitHub
? Path to local repository .
? Repository name ang-assignment1
? Description ang-assignment1
? Visibility Public
✓ Created repository jmwollny/ang-assignment1 on GitHub
? Add a remote? Yes
? What should the new remote be called? origin
✓ Added remote https://github.com/jmwollny/ang-assignment1.git
? Would you like to push commits from the current branch to "origin"? Yes
Enumerating objects: 55, done.
Counting objects: 100% (55/55), done.
Delta compression using up to 8 threads
Compressing objects: 100% (51/51), done.
Writing objects: 100% (55/55), 197.82 KiB | 12.36 MiB/s, done.
Total 55 (delta 10), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (10/10), done.
To https://github.com/jmwollny/ang-assignment1.git
 * [new branch]      HEAD -> master
branch 'master' set up to track 'origin/master'.
✓ Pushed commits to https://github.com/jmwollny/ang-assignment1.git
```

# Building a simple pipeline
https://serengetitech.com/tech/configuring-angular-jenkins-and-gitlab-for-ci-cd/

docker build -f ang-assignment1.Dockerfile . -t ng-test-docker