![rxiv](https://github.com/eylles/rxiv/blob/master/icon/128x128.png "rxiv")

**Reisen X Image Viewer**

The sole purpose of rxiv is because sxiv won't add many sensible features and it seems abandoned by the author.

Reisen X Image Viewer is named after Reisen Udongein Inaba from Touhou.

Features
--------

* Basic image operations, e.g. zooming, panning, rotating
* Customizable key and mouse button mappings (in *config.h*)
* Thumbnail mode: grid of selectable previews of all images
* Ability to cache thumbnails for fast re-loading
* Basic support for multi-frame images
* Load all frames from GIF files and play GIF animations
* Full webp support
* View images from URL (through included wrapper `rxiv-url` for now)
* Start from file (through included wrapper `rxiv-browser` for now)
* Partial svg support (only on image mode for now)
* Display image information in status bar


Screenshots
-----------

**Image mode:**

![Image](https://eylles.github.io/rxiv/img/image.png "Image mode")

**Thumbnail mode:**

![Thumb](https://eylles.github.io/rxiv/img/thumb.png "Thumb mode")

showcasing the optional inverted bar colors with flag `-B`


Dependencies
------------

sxiv requires the following software to be installed:

  * Imlib2
  * X11
  * Xft
  * freetype2
  * fontconfig
  * librsvg2
  * giflib (optional, disabled with `HAVE_GIFLIB=0`)
  * libexif (optional, disabled with `HAVE_LIBEXIF=0`)

Please make sure to install the corresponding development packages in case that
you want to build rxiv on a distribution with separate runtime and development
packages (e.g. *-dev on Debian).


Building
--------

rxiv is built using the commands:

    $ make
    # make install

Please note, that the latter one requires root privileges.
By default, rxiv is installed using the prefix "/usr/local", so the full path
of the executable will be "/usr/local/bin/rxiv".

You can install rxiv into a directory of your choice by changing the second
command to:

    # make PREFIX="/your/dir" install

The build-time specific settings of rxiv can be found in the file *config.h*.
Please check and change them, so that they fit your needs.
If the file *config.h* does not already exist, then you have to create it with
the following command:

    $ make config.h


Usage
-----

Please see the [man page](https://eylles.github.io/rxiv/rxiv.1.html) for
information on how to use sxiv.


Download & Changelog
--------------------

You can [browse](https://github.com/eylles/rxiv) the source code repository
on GitHub or get a copy using git with the following command:

    git clone https://github.com/eylles/rxiv.git


**Contribution**
------------

Only Pull Requests from topic branches will be accepted, please **DO NOT** open a PR from **your** master branch.


**Stable releases**

**rxiv**

(Aug, 2021)
  * loop patch from https://github.com/1-7-1/sxiv-loop-patch
  * added more zoom steps to default #[13](https://github.com/eylles/rxiv/pull/13)
  * fixes #[12](https://github.com/eylles/rxiv/issues/12) - issue with zoom
  * bar text and background separated into their own resources, `-B` flag removed

**[v0.0.1](https://github.com/eylles/rxiv/archive/v0.0.1.tar.gz)**
(*May, 2021*)
  * Refactor: use img_zoom function inside img_fit
  * Move sxiv changelog to sxiv-changelog.md

**[v0.0.0](https://github.com/eylles/rxiv/archive/v0.0.0.tar.gz)**
*(April, 2021)*
  * Set the _NET_WM_PID and WM_CLIENT_MACHINE X properties #[403](https://github.com/muennich/sxiv/pull/403)
  * Option to swap bar colors #[392](https://github.com/muennich/sxiv/pull/392) flag set to `-B`
  * Add support for animated WebP images #[437](https://github.com/muennich/sxiv/pull/437)
  * Update manpage for marking commands #[404](https://github.com/muennich/sxiv/pull/404)
  * Added ICCCM WM_HINTS #[406](https://github.com/muennich/sxiv/pull/406)
  * Advertise Webp support in desktop file #[411](https://github.com/muennich/sxiv/pull/411)
  * add option for dmenu like behaviour #[405](https://github.com/muennich/sxiv/pull/405) flag `-O`
  * added script `rxiv-url` to view files from URLs issue #[431](https://github.com/muennich/sxiv/issues/431)
  * added script `rxiv-browser` to provide start from file #[371](https://github.com/muennich/sxiv/pull/371)
  * added svg support (no thumbnail mode yet) #[440](https://github.com/muennich/sxiv/pull/440)
  * rename to rxiv
