# rxiv(1) - Reisen X Image Viewer

rxiv\-VERSION

```
rxiv [-abBcfhiopqrtvZ] [-A FRAMERATE] [-e WID] [-G GAMMA] [-g GEOMETRY] [-N NAME] [-n NUM] [-S DELAY] [-s MODE] [-z ZOOM] FILE... 
 rxiv-browser [-abBcfhiopqtvZ] [-A FRAMERATE] [-e WID] [-G GAMMA] [-g GEOMETRY] [-N NAME] [-n NUM] [-S DELAY] [-s MODE] [-z ZOOM] FILE 
 rxiv-url [-abBcfhiopqtvZ] URL...
```

<a name="description"></a>

# Description

rxiv is a simple image viewer for X.

It has two modes of operation: image and thumbnail mode. The default is image
mode, in which only the current image is shown. In thumbnail mode a grid of
small previews is displayed, making it easy to choose an image to open.

Please note, that the fullscreen mode requires an EWMH/NetWM compliant window
manager.

<a name="options"></a>

# Options


* **-A **_FRAMERATE_  
  Play animations with a constant frame rate set to
  _FRAMERATE_.
* **-a**  
  Play animations of multi-frame images.
* **-b**  
  Do not show info bar on bottom of window.
* **-B**  
  Invert the colors of the bar.
* **-c**  
  Remove all orphaned cache files from the thumbnail cache directory and exit.
* **-e **_WID_  
  Embed rxiv's window into window whose ID is
  _WID_.
* **-f**  
  Start in fullscreen mode.
* **-G **_GAMMA_  
  Set image gamma to GAMMA (-32..32).
* **-g **_GEOMETRY_  
  Set window position and size. See section GEOMETRY SPECIFICATIONS of X(7) for
  more information on GEOMETRY argument.
* **-N **_NAME_  
  Set the resource name of rxiv's X window to NAME.
* **-n **_NUM_  
  Start at picture number NUM.
* **-h**  
  Print brief usage information to standard output and exit.
* **-i**  
  Read names of files to open from standard input. Also done if FILE is \`-'.
* **-o**  
  Write list of all marked files to standard output when quitting. In combination
  with
  **-i**
  rxiv can be used as a visual filter/pipe.
* **-O**  
  Like
  **-o**
  option combined with
  **-i**
  option but without the need to quit after
* **-p**  
  Enable private mode, in which rxiv does not write any cache or temporary files.
* **-q**  
  Be quiet, disable warnings to standard error stream.
* **-r**  
  Search the given directories recursively for images to view.
* **-S **_DELAY_  
  Start in slideshow mode. Set the delay between images to
  _DELAY_
  seconds.
  _DELAY_
  may be a floating point number.
* **-s **_MODE_  
  Set scale mode according to MODE character. Supported modes are: [d]own,
  [f]it, [w]idth, [h]eight.
* **-t**  
  Start in thumbnail mode.
* **-v**  
  Print version information to standard output and exit.
* **-Z**  
  The same as \`-z 100'.
* **-z **_ZOOM_  
  Set zoom level to ZOOM percent.

<a name="keyboard-commands"></a>

# Keyboard Commands


<a name="general"></a>

### General

The following keyboard commands are available in both image and thumbnail mode:

* **0**-**9**  
  Prefix the next command with a number (denoted via
  _count_).
* **q**  
  Quit rxiv.
* **Return**  
  Switch to thumbnail mode / open selected image in image mode.
* **f**  
  Toggle fullscreen mode.
* **b**  
  Toggle visibility of info bar on bottom of window.
* **Ctrl-x**  
  Send the next key to the external key-handler. See section EXTERNAL KEY HANDLER
  for more information.
* **g**  
  Go to the first image.
* **G**  
  Go to the last image, or image number
  _count_.
* **r**  
  Reload image.
* **D**  
  Remove current image from file list and go to next image.
* **Ctrl-h**, **Ctrl-Left**  
  Scroll left one screen width.
* **Ctrl-j**, **Ctrl-Down**  
  Scroll down one screen height.
* **Ctrl-k**, **Ctrl-Up**  
  Scroll up one screen height.
* **Ctrl-l**, **Ctrl-Right**  
  Scroll right one screen width.
* **+**  
  Zoom in.
* **-**  
  Zoom out.
* **m**  
  Mark/unmark the current image.
* **M**  
  Repeat last mark action on all images from the last marked/unmarked up to the
  current one.
* **Ctrl-m**  
  Reverse all image marks.
* **Ctrl-u**  
  Remove all image marks.
* **N**  
  Go
  _count_
  marked images forward.
* **P**  
  Go
  _count_
  marked images backward.
* **{**  
  Decrease gamma correction by
  _count_
  steps.
* **}**  
  Increase gamma correction by
  _count_
  steps.
* **Ctrl-g**  
  Reset gamma correction.

<a name="thumbnail-mode"></a>

### Thumbnail mode

The following keyboard commands are only available in thumbnail mode:

* **h**, **Left**  
  Move selection left
  _count_
  times.
* **j**, **Down**  
  Move selection down
  _count_
  times.
* **k**, **Up**  
  Move selection up
  _count_
  times.
* **l**, **Right**  
  Move selection right
  _count_
  times.
* **R**  
  Reload all thumbnails.

<a name="image-mode"></a>

### Image mode

The following keyboard commands are only available in image mode:

* Navigate image list:  
* **n**, **Space**  
  Go
  _count_
  images forward.
* **p**, **Backspace**  
  Go
  _count_
  images backward.
* **[**  
  Go
  _count_
  * 10 images backward.
* **]**  
  Go
  _count_
  * 10 images forward.
* Handle multi-frame images:  
* **Ctrl-n**  
  Go
  _count_
  frames of a multi-frame image forward.
* **Ctrl-p**  
  Go
  _count_
  frames of a multi-frame image backward.
* **Ctrl-Space**  
  Play/stop animations of multi-frame images.
* Panning:  
* **h**, **Left**  
  Scroll image 1/5 of window width or
  _count_
  pixel left.
* **j**, **Down**  
  Scroll image 1/5 of window height or
  _count_
  pixel down.
* **k**, **Up**  
  Scroll image 1/5 of window height or
  _count_
  pixel up.
* **l**, **Right**  
  Scroll image 1/5 of window width or
  _count_
  pixel right.
* **H**  
  Scroll to left image edge.
* **J**  
  Scroll to bottom image edge.
* **K**  
  Scroll to top image edge.
* **L**  
  Scroll to right image edge.
* Zooming:  
* **=**  
  Set zoom level to 100%, or
  _count_%.
* **w**  
  Set zoom level to 100%, but fit large images into window.
* **W**  
  Fit image to window.
* **e**  
  Fit image to window width.
* **E**  
  Fit image to window height.
* Rotation:  
* **&lt;**  
  Rotate image counter-clockwise by 90 degrees.
* **&gt;**  
  Rotate image clockwise by 90 degrees.
* **?**  
  Rotate image by 180 degrees.
* Flipping:  
* **|**  
  Flip image horizontally.
* **_**  
  Flip image vertically.
* Miscellaneous:  
* **a**  
  Toggle anti-aliasing.
* **A**  
  Toggle visibility of alpha-channel, i.e. image transparency.
* **s**  
  Toggle slideshow mode and/or set the delay between images to
  _count_
  seconds.

<a name="mouse-commands"></a>

# Mouse Commands

The following mouse mappings are available in image mode:

* General:  
* **Button3**  
  Switch to thumbnail mode.
* Navigate image list:  
* **Button1**  
  Go to the next image if the mouse cursor is in the right part of the window or
  to the previous image if it is in the left part.
* Panning:  
* **Button2**  
  Pan the image according to the mouse cursor position in the window while
  keeping this button pressed down.
* Zooming:  
* **ScrollUp**  
  Zoom in.
* **ScrollDown**  
  Zoom out.

<a name="configuration"></a>

# Configuration

The following X resources are supported:

* **background**  
  Color of the window background and bar foreground
* **foreground**  
  Color of the window foreground and bar background
* **font**  
  Name of Xft bar font
* Please see xrdb(1) on how to change them.  

<a name="status-bar"></a>

# Status Bar

The information displayed on the left side of the status bar can be replaced
with the output of a user-provided script, which is called by rxiv whenever an
image gets loaded. The path of this script is
_$XDG_CONFIG_HOME/rxiv/exec/image-info_
and the arguments given to it are: 1) path to image file, 2) image width,
3) image height.

There is also an example script installed together with rxiv as
_PREFIX/share/rxiv/exec/image-info_.

<a name="external-key-handler"></a>

# External Key Handler

Additional external keyboard commands can be defined using a handler program
located in
_$XDG_CONFIG_HOME/rxiv/exec/key-handler_.
The handler is invoked by pressing
**Ctrl-x**.
The next key combo is passed as its first argument. Passed via stdin are the
images to act upon, one path per line: all marked images, if in thumbnail mode
and at least one image has been marked, otherwise the current image.
rxiv(1) will block until the handler terminates. It then checks which images
have been modified and reloads them.

The key combo argument has the following form: "[C-][M-][S-]KEY",
where C/M/S indicate Ctrl/Meta(Alt)/Shift modifier states and KEY is the X
keysym as listed in /usr/include/X11/keysymdef.h without the "XK_" prefix.

There is also an example script installed together with rxiv as
_PREFIX/share/rxiv/exec/key-handler_.

<a name="thumbnail-caching"></a>

# Thumbnail Caching

rxiv stores all thumbnails under
_$XDG_CACHE_HOME/rxiv/_.

Use the command line option
_-c_
to remove all orphaned cache files. Additionally, run the following command
afterwards inside the cache directory to remove empty subdirectories:

find . -depth -type d -empty ! -name '.' -exec rmdir {} \\;

<a name="author"></a>

# Author

.EX
Bert Muennich (sxiv)   &lt;ber.t at posteo.de&gt;
Edgar Yllescas (rxiv)  &lt;ed.ylles1997 at gmail.com&gt;
.EE

<a name="contributors"></a>

# Contributors

.EX
Bastien Dejean  &lt;nihilhill at gmail.com&gt;
Dave Reisner    &lt;d at falconindy.com&gt;
Fung SzeTat     &lt;sthorde at gmail.com&gt;
Max Voit        &lt;mvdev at with-eyes.net&gt;
.EE

<a name="homepage"></a>

# Homepage

.EX
https://github.com/eylles/rxiv
.EE

<a name="see-also"></a>

# See Also

**X**(7),
**xrdb**(1)
