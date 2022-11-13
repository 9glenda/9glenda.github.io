+++
title = "Own Website"
date = "2022-11-03"
author = "9glenda"
tags = ["hugo", "github-pages"]
description = "Guide to create your own website with github pages"
readingTime = true
hideComments = true
+++
# Create own website with hugo and github-pages
A friend asked me about how I created this website, so I decided to create this small guide.

## Initialize the hugo site
First, we have to initialize the hugo website.
```sh
hugo new site website
cd website
hugo new _index.md
```
This will create a folder called `website` where your site is stored.
You can name the folder differently if you'd like to.
## Initialize git repo
Now we have to initialize a git repo in the `website` folder.
Therefore, change directory into the website folder (`cd website`).
```sh
git init
```
### .gitignore
Add a `.gitignore` file containing the build files created by hugo:
```gitignore
public
.hugo_build.lock
```
### Hugo theme
We will use the terminal theme for now but you can always change it later.
Add a hugo theme with the following commands:
```sh
mkdir themes
git submodule add
git submodule add -f https://github.com/panr/hugo-theme-terminal.git themes/terminal
```
### Hugo config
Edit your `config.toml` like done below:
```toml
baseURL = 'http://<your github username>.github.io/'
languageCode = "en-us"
# Add it only if you keep the theme in the `themes` directory.
# Remove it if you use the theme as a remote Hugo Module.
theme = "terminal"
paginate = 5

[params]
  # dir name of your main content (default is `content/posts`).
  # the list of set content will show up on your index page (baseurl).
  contentTypeName = "posts"

  # ["orange", "blue", "red", "green", "pink"]
  themeColor = "blue"

  # if you set this to 0, only submenu trigger will be visible
  showMenuItems = 2

  # show selector to switch language
  showLanguageSelector = false

  # set theme to full screen width
  fullWidthTheme = false

  # center theme with default width
  centerTheme = false

  # if your resource directory contains an image called `cover.(jpg|png|webp)`,
  # then the file will be used as a cover automatically.
  # With this option you don't have to put the `cover` param in a front-matter.
  autoCover = true

  # set post to show the last updated
  # If you use git, you can set `enableGitInfo` to `true` and then post will automatically get the last updated
  showLastUpdated = false

  # set a custom favicon (default is a `themeColor` square)
  # favicon = "favicon.ico"

  # Provide a string as a prefix for the last update date. By default, it looks like this: 2020-xx-xx [Updated: 2020-xx-xx] :: Author
  # updatedDatePrefix = "Updated"

  # set all headings to their default size (depending on browser settings)
  # oneHeadingSize = true # default

  # whether to show a page's estimated reading time
  # readingTime = false # default

  # whether to show a table of contents
  # can be overridden in a page's front-matter
  # Toc = false # default

  # set title for the table of contents
  # can be overridden in a page's front-matter
  # TocTitle = "Table of Contents" # default

[languages]
  [languages.en]
    languageName = "English"
    title = "Terminal"
    subtitle = "A simple, retro theme for Hugo"
    owner = ""
    keywords = ""
    copyright = ""
    menuMore = "Show more"
    readMore = "Read more"
    readOtherPosts = "Read other posts"
    newerPosts = "Newer posts"
    olderPosts = "Older posts"
    missingContentMessage = "Page not found..."
    missingBackButtonLabel = "Back to home page"

    [languages.en.params.logo]
      logoText = "Terminal"
      logoHomeLink = "/"

    [languages.en.menu]
      [[languages.en.menu.main]]
        identifier = "about"
        name = "About"
        url = "/about"
      [[languages.en.menu.main]]
        identifier = "showcase"
        name = "Showcase"
        url = "/showcase"
```
### Create your first post
```sh
hugo new posts/first-post.md
```
### Github actions 
To automatically deploy the website, we will use github actions.
It can be set up with the following command:
```sh
mkdir -p .github/workflows
```
Then create a file `.github/workflows/deploy.yaml` containing the following:
```yaml
name: github pages

on:
  push:
    branches:
      - main  # Set a branch to deploy
  pull_request:

jobs:
  deploy:
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: true  # Fetch Hugo themes (true OR recursive)
          fetch-depth: 0    # Fetch all history for .GitInfo and .Lastmod

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          # extended: true

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        if: github.ref == 'refs/heads/main'
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```
### Testing the website locally
To test your website locally hugo can spin up a webserver for you:
```sh
hugo server -D
```
### Git commit
You need to create a initial commit for now:
```sh
git add -A
git commit -m "init"
```
### Create a github repo
It is assumed that you have ssh with github set up to be able to push changes to your github repo.
Create a github repo called `<your github username>.github.io`. This is the subdomain you will use to host your website.
After creating the repo you will see an option called `or push an existing repository from the command line`. Copy paste the commands from github and run them locally in the `website` folder.
For example, mine looks like this (`DO NOT COPY PASTE THIS`):
```sh
git remote add origin git@github.com:9glenda/glenda.github.io.git
git branch -M main
git push -u origin main
```
### Set up github pages
You will need to pull up your github repo and open settings/pages to configure github pages.
Now you need to select `Deploy from branch` and after that set the branch to deploy from to gh-pages.
To confirm, just press save.
