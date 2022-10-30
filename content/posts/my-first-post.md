+++
title = "My First Post"
date = "2022-10-30"
author = "9glenda"
readingTime = true 
hideComments = true
tags = ["hugo"]
description = "Documenting my first experience with hugo"
+++
# My first post
This is my first "post". It's used to document my experience with hugo.
## Getting started with hugo
I can't say it was hard getting started with hugo, but it was not as easy as I expected it to be.
When I decided to create my own website hugo was actually not my first choice. Before I gave hugo a try, I tried out [zola](https://www.getzola.org/).
Zola seems like a fine static site generator to me but it just is not made for me. Especially the error messages need a bit improvement in my opinion.
The reason why I started with zola was a theme avaiable on zola which I really liked. I discoverd zola through [this](https://jdisaacs.com/) site.
Because of me really liking the theme of this site I decided to try out zola and ended up using the [zola-terminimal](https://github.com/pawroman/zola-theme-terminimal) theme, which is the theme the site's theme was based on.
As soon as I discoverd that the the zola-terminimal theme is just a clone of a hugo theme, called [terminal](https://github.com/panr/hugo-theme-terminal), it was clear that my next static site generator to try out was going to be hugo.
I heard a lot of great stuff about hugo in the past, so it seemd like a obvious choice to try out once anyway when building a site with a static site generator.
Besides a bit of confusion when starting to set up hugo it was pretty straight forward. Once you understand how hugo works, building a site is really easy.
## The posts system
The posts system of my theme (or hugo I'm not sure rather it is speciffic to my theme or not) is really cool and fits my need quite well.
This site will mainly be used to publish small articles about Free Software and technology. Especially the listing of my posts on the root of the site is a feature which fits my needs quite well.
## Github pages intigration
Setting up hugo to work with github pages took me some time but to get it deploy properly but that was caused to a misconfiguration in my setting. Simply changing the branch the site will be deployed from to the `gh-pages` branch fixed the deployment.
### Github pages setup
I am using github actions and the deployment from a branch to deploy this website. My github actions workflow used to deploy the site can be found [here](https://github.com/9glenda/9glenda.github.io/blob/main/.github/workflows/deploy.yml).
It creates a branch called `gh-pages` containing the generated files of this site. You will also need to set the deployment source of the site to the `gh-pages` branch in the setting of your github repo.
## Theme
One of the thinks I appreciate the most about my website is the theme. The minimal look reminds me of the [gemini protocol](https://gemini.circumlunar.space/). Altho in general I am quite happy with the theme, I am looking forward to customize the css a bit.
