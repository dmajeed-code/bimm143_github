# Git Notes


## PAT

``` r
#install.packages("usethis")
library(usethis)
create_github_token()
```

    ☐ Call `gitcreds::gitcreds_set()` to register this token in the local Git
      credential store.

    ℹ It is also a great idea to store this token in any password-management
      software that you use.

    ☐ Open URL
      <https://github.com/settings/tokens/new?scopes=repo,user,gist,workflow&description=DESCRIBE
      THE TOKEN'S USE CASE>.

``` r
#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

#install.packages("gitcreds")
library(gitcreds)
#gitcreds_set()
```

Git keeps track of changes to your files over time and allows you to
“rollback” to previous versions.

To work with git you first initialize a git repo. in Rstudio this means
you tick a litte “use git” button when creating a project

On the command line git init does the same thing

Then add and edit files

When you want to store a copy of this state of your files you do 2 key
steps

git add and git commit
