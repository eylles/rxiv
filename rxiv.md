UNTITLED - LOCAL

rxiv &#45; Reisen X Image Viewer
rxiv is a simple image viewer for X.
It has two modes of operation: image and thumbnail mode. The default is image
mode, in which only the current image is shown. In thumbnail mode a grid of
small previews is displayed, making it easy to choose an image to open.
Please note, that the fullscreen mode requires an EWMH/NetWM compliant window
manager.
Play animations with a constant frame rate set to
Play animations of multi-frame images.
Do not show info bar on bottom of window.
Invert the colors of the bar.
Remove all orphaned cache files from the thumbnail cache directory and exit.
Embed rxiv's window into window whose ID is
Start in fullscreen mode.
Set image gamma to GAMMA (-32..32).
Set window position and size. See section GEOMETRY SPECIFICATIONS of X(7) for
more information on GEOMETRY argument.
Set the resource name of rxiv's X window to NAME.
Start at picture number NUM.
Print brief usage information to standard output and exit.
Read names of files to open from standard input. Also done if FILE is \`-'.
Write list of all marked files to standard output when quitting. In combination
with
rxiv can be used as a visual filter/pipe.
Like
option combined with
option but without the need to quit after
Enable private mode, in which rxiv does not write any cache or temporary files.
Be quiet, disable warnings to standard error stream.
Search the given directories recursively for images to view.
Start in slideshow mode. Set the delay between images to
seconds.
may be a floating point number.
Set scale mode according to MODE character. Supported modes are: \[d]own,
\[f]it, \[w]idth, \[h]eight.
Start in thumbnail mode.
Print version information to standard output and exit.
The same as \`&#45;z 100'.
Set zoom level to ZOOM percent.
The following keyboard commands are available in both image and thumbnail mode:
Prefix the next command with a number (denoted via
Quit rxiv.
Switch to thumbnail mode / open selected image in image mode.
Toggle fullscreen mode.
Toggle visibility of info bar on bottom of window.
Send the next key to the external key-handler. See section EXTERNAL KEY HANDLER
for more information.
Go to the first image.
Go to the last image, or image number
Reload image.
Remove current image from file list and go to next image.
Scroll left one screen width.
Scroll down one screen height.
Scroll up one screen height.
Scroll right one screen width.
Zoom in.
Zoom out.
Mark/unmark the current image.
Repeat last mark action on all images from the last marked/unmarked up to the
current one.
Reverse all image marks.
Remove all image marks.
Go
marked images forward.
Go
marked images backward.
Decrease gamma correction by
steps.
Increase gamma correction by
steps.
Reset gamma correction.
The following keyboard commands are only available in thumbnail mode:
Move selection left
times.
Move selection down
times.
Move selection up
times.
Move selection right
times.
Reload all thumbnails.
The following keyboard commands are only available in image mode:
Navigate image list:
Go
images forward.
Go
images backward.
Go
\* 10 images backward.
Go
\* 10 images forward.
Handle multi-frame images:
Go
frames of a multi-frame image forward.
Go
frames of a multi-frame image backward.
Play/stop animations of multi-frame images.
Panning:
Scroll image 1/5 of window width or
pixel left.
Scroll image 1/5 of window height or
pixel down.
Scroll image 1/5 of window height or
pixel up.
Scroll image 1/5 of window width or
pixel right.
Scroll to left image edge.
Scroll to bottom image edge.
Scroll to top image edge.
Scroll to right image edge.
Zooming:
Set zoom level to 100%, or
Set zoom level to 100%, but fit large images into window.
Fit image to window.
Fit image to window width.
Fit image to window height.
Rotation:
Rotate image counter-clockwise by 90 degrees.
Rotate image clockwise by 90 degrees.
Rotate image by 180 degrees.
Flipping:
Flip image horizontally.
Flip image vertically.
Miscellaneous:
Toggle anti-aliasing.
Toggle visibility of alpha-channel, i.e. image transparency.
Toggle slideshow mode and/or set the delay between images to
seconds.
The following mouse mappings are available in image mode:
General:
Switch to thumbnail mode.
Navigate image list:
Go to the next image if the mouse cursor is in the right part of the window or
to the previous image if it is in the left part.
Panning:
Pan the image according to the mouse cursor position in the window while
keeping this button pressed down.
Zooming:
Zoom in.
Zoom out.
The following X resources are supported:
Color of the window background and bar foreground
Color of the window foreground and bar background
Name of Xft bar font
Please see xrdb(1) on how to change them.
The information displayed on the left side of the status bar can be replaced
with the output of a user-provided script, which is called by rxiv whenever an
image gets loaded. The path of this script is
and the arguments given to it are: 1) path to image file, 2) image width,
3\) image height.
There is also an example script installed together with rxiv as
Additional external keyboard commands can be defined using a handler program
located in
The handler is invoked by pressing
The next key combo is passed as its first argument. Passed via stdin are the
images to act upon, one path per line: all marked images, if in thumbnail mode
and at least one image has been marked, otherwise the current image.
rxiv(1) will block until the handler terminates. It then checks which images
have been modified and reloads them.

The key combo argument has the following form: "\[C-]\[M-]\[S-]KEY",
where C/M/S indicate Ctrl/Meta(Alt)/Shift modifier states and KEY is the X
keysym as listed in /usr/include/X11/keysymdef.h without the "XK\_" prefix.

There is also an example script installed together with rxiv as
rxiv stores all thumbnails under
Use the command line option
to remove all orphaned cache files. Additionally, run the following command
afterwards inside the cache directory to remove empty subdirectories:
find . &#45;depth &#45;type d &#45;empty ! &#45;name '.' &#45;exec rmdir {} &#92;;
Bert Muennich (sxiv)   &lt;ber.t at posteo.de&gt;
Edgar Yllescas (rxiv)  &lt;ed.ylles1997 at gmail.com&gt;
Bastien Dejean  &lt;nihilhill at gmail.com&gt;
Dave Reisner    &lt;d at falconindy.com&gt;
Fung SzeTat     &lt;sthorde at gmail.com&gt;
Max Voit        &lt;mvdev at with-eyes.net&gt;
https://github.com/eylles/rxiv

 \- April 27, 2021
