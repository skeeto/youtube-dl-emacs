# A youtube-dl download manager for Emacs

This package manages a video download queue for [youtube-dl][yt], which
serves as the back end. It manages a single youtube-dl subprocess,
downloading one video at a time. New videos can be queued at any time.

The `youtube-dl` command queues a single URL for download. Failures are
retried up to `youtube-dl-max-failures`. Items can be paused or set to
download at a slower rate (`youtube-dl-slow-rate`).

The `youtube-dl-playlist` command queues an entire playlist, just as if
you had individually queued each video on the playlist.

The `youtube-dl-list` command displays a list of all active video
downloads. From this list, items under point can be canceled
(<kbd>d</kbd>), paused (<kbd>p</kbd>), slowed (<kbd>s</kbd>), and have
its priority adjusted (<kbd>[</kbd> and <kbd>]</kbd>).

![](https://i.imgur.com/wDWNsMf.png)

[yt]: https://rg3.github.io/youtube-dl/
