
## Source code for Ray's personal website

My site is constructed with hugo and hosted on github at rayjohnson.github.io.

## Build instructions

TODO

## Images

Images are all hosted on a CDN.  I'm using https://cloudinary.com/ because it is free.
Which is really awesome - unless they go out of business or change thier buisness model
and then this idea will really really suck.

Image references in my site all use absolute paths to the CDN.  As such they are not
stored in a part of the site that would be published by hugo.  I do keep them in the
cnd_images directory though to keep a copy of the origionals used.