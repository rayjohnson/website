---
title: "Qnap and Docker"
thumbnailImagePosition: left
thumbnailImage: http://res.cloudinary.com/rayjohnson/image/upload/c_lpad,h_140,w_140/v1510865153/Container_Station_zzxshi.png
date: 2017-11-16
categories:
- Home Automation
tags:
- docker
- qnap
keywords:
- docker
- qnap
---

I recently purchased the QNAP NAS - a network attached storage server.  I primarily 
got it to replace my aging TimeMachine for Mac backups.  However, the QNAP does so
much more.  This post will discuss QNAP's **Container Station** - which is really
just some fancy UI for running Docker containers.  My thought it could be a great
little server for playing around with home automation.

<!--more-->

<a href="https://www.amazon.com/QNAP-TS-451-Personal-Quad-Core-Transcoding/dp/B015VNLGF8/ref=as_li_ss_il?s=electronics&ie=UTF8&qid=1510862004&sr=1-1&keywords=TS-451+&dpID=517Pk6Vj7ZL&preST=_SX300_QL70_&dpSrc=srch&linkCode=li2&tag=rayjohnson-20&linkId=f663b3466eac31bef2de9e0f69f5b6db" target="_blank"><img style="float: right;" border="0" src="//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=B015VNLGF8&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=rayjohnson-20" ></a><img src="https://ir-na.amazon-adsystem.com/e/ir?t=rayjohnson-20&l=li2&o=1&a=B015VNLGF8" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
When I started looking for a NAS server [Qnap](https://www.qnap.com/en-us/) and 
[Synology](https://www.synology.com/en-us) quickly appeared to be the top choices.
Both have great reputations and lots of features.  Both are strong in multimedia
serving which is not so interesting to me.  Qnap had one thing Synology 
did not have and that was the ability to run Docker and LXC containers.  I've done a lot of 
work with Docker at work and was excited to be able to do some for my home projects.
So I chose the [Qnap TS-451+](http://amzn.to/2yOGuN4).

I've been happy with it so far - and it certainly handles the Mac backups just fine.
Using Container-Station on the other has been a bit more challenging.  I mean it works
fine if you want to launch the images they curated for you to play with.  I was able
to launch wordpress within 5 minutes of messing with the thing!

Container-Station itself is a UI on top of Docker that Qnap developed.  It is kind of
cool in that it makes it easy to play with Docker with out having to mess with the
command line or anything.  It provides a couple dozen of apps they curated to run on
Qnap - but it is easy to run any image hosted on Docker hub.  I'd say what they have
is actually perfect for apps that run in a single container.

So can you run your own images you create?  Yes!  However, you first need to publish
your image to a repository like Docker Hub.  Also during development you typically want 
to mange deployment, starting and stopping containers from the command line.  To do that 
is a little tricky.  Part of the problem is docker-machine does not make it easy
to configure talking to an existing docker instance that well.  The other problem is
the Qnap's version of docker is already out of date and Docker is rather finicky about talking to older versions of itself.  I've outlined some instructions in this [Gist](https://gist.github.com/rayjohnson/fe92c9377e35b95bbfb2a3bbc535d64b) should you want to try it.

Containers launched in Container-Station are in their own private network (you can control)
and then are bridged to a port on your QNAP box.  However, Container-Station does have its
own IPAM plugin for Docker.  I tried it out and was able to use my router's DHCP service
to give a container its own IP address.
```bash
docker network create -d qnet --ipam-driver=qnet --ipam-opt=iface=eth1 qnet-dhcp-eth1
```

However, having your service come up on random IP numbers is not that useful.  So I tried
to set the mac_address so I could do a DHCP reservation and the container would always get the
same address.  It "kind of" works.  It works only if have one network on the container and
it is created on container creation.  This is because 'docker network' does not support
the --mac_address flag!  Between Docker bugs and a lack of documentation for the qnet
driver, I'd have to say this functionality is not quite ready for prime time.

The biggest issue by far is that QNAP using a somewhat old version of Docker.  With
Docker's current level of maturity this is a big pain. Frankly, I'd be fine without
all the fancy UI of Container-Station if they would just make it easy to stay up to
date with the latest version of Docker.

