---
title: "Hugo"
thumbnailImagePosition: left
thumbnailImage: http://res.cloudinary.com/rayjohnson/image/upload/c_scale,w_140/v1509992599/hugo-logo_bbz8x0.png
date: 2017-10-14
tags:
- coding
keywords:
- blogging
- hugo
- Cloudinary
- Disqus
- Google Analytics
- Github
- Github pages
draft: true
---

I built this new blog with [Hugo](http://gohugo.io).  It is a fairly new tool under active development that is already powerful and shows lots of promise.  More importantly it is perfect for a developer to get started without a lot of blogging experience.

<!--more-->


Hugo is a framework written in Golang that builds static web sites.  By a "static" 
site - I mean there is no database - just html, css and java script files.  A static
site is easy to serve as pretty much all hosting and web servers out there can host
basic HTML sites.

Now I'm not the best person to give a full review of Hugo.  I'm not much of a blogger and this is the first time I've used any tool like this.  There are many other reviews like that out there worth checking out - try this one [here](https://www.smashingmagazine.com/2015/11/static-website-generators-jekyll-middleman-roots-hugo-review/).

Rather, what I can say as a newbie blogger is this - getting started with Hugo is really easy.   Just follow the quick start and you are good to go.  You do need to understand HTML and Git which any programmer would be able to do.  (If you have zero programming experience you may be better off with Wordpress of something along those lines.)

I am using [Github pages](https://pages.github.com) to host my site - which is 100% free.  So, of course, that is a really nice option as well.  All you need is a Github account (also free) and then you publish your site into a specially named git repository in your account.  It is that simple.

The hardest part about learning Hugo was picking a theme.  There are dozens of themes and they have a nice gallery to choose from.  Unfortunately, since they are all community created some are much better than others.  I accidentally chose one that had a lot of issues at first.  My biggest nit is the gallery of themes should have a scoring mechanism or something to get insight into the quality of the themes.

Most of the themes use third party services to flesh out your site.  Again, if you have been blogging for a while you may know about these services - but if you are a newbie like me there is a little learning curve on understanding these additional services.  But it is worth it - they are powerful and provide many nice features.  Here are a few of them:

#### Google Analytics

Ok - this one you might have guessed existed.  Most of the themes in Hugo have support for Google Analytics (GA).  You can get your free Google Analytics account [here](https://www.google.com/analytics/).  You need to fill out information about your web site and get a Tracking ID.  Most themes have a place for you to specify your GA tracking id in your config.toml file and just like that you have very robust web site tracking!

#### Disqus

Most any decent blog has a comments section where users can post comments of some sort.  However, this is a static site with no database - how are we going to store the comments?
This is where [Disqus](https://disqus.com) comes in.

Like GA most of the Hugo themes support Disqus.  You need to get a (free) account and fill
out information about your website.  You will get a "Shortname" that you can then enter
into your config.toml file.

Disqus gives lots of tools to help moderate your site.  Frankly, it is much more powerful
than any comment system you would want to develop for your self!

#### Cloudinary

It is often desirable to use a Content Delivery Network (CDN) to deliver static assets like images.  The CDN caches images across the Internet and makes you website seem much faster.

[Cloudinary](https://cloudinary.com) is an interesting option for this.  For one it is free at a generous initial tier.  But the really cool thing is it can do some simple image manipulation for you that can be really useful.

For example, the thumbnail images for all my blog posts need to be **140 x 140**.  For each image
I need I might have to open it in an image editor and scale the image I have to fit nicely
into that format.  With Cloudinary, however, I can just add some options to the URL path
that does this scaling on the fly.  

So I may have a URL for the Hugo logo like this:
```
http://res.cloudinary.com/rayjohnson/image/upload/v1509992599/hugo-logo_bbz8x0.png
```
I can scale the image by just doing this:
```
http://res.cloudinary.com/rayjohnson/image/upload/c_scale,w_140/v1509992599/hugo-logo_bbz8x0.png
```

The part of the URL that says `c_scale,w_140/` transforms the image for you.  There are
many other transformations you can do and it is way easier then doing this manually in
a photo editor!


### Summary

I'm still learning the world of tools and services useful for bloggers.  It is a big world
and there are a lot of options - particularity if you want to be a professional blogger.
All I can say as a developer who wants a simple but good looking blog that is free and
easy to support - Hugo is a really great option that had me up and going in no time!


