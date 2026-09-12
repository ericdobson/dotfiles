# Useful `yt-dlp` Commands

Download a video using the configured defaults:
`yt-dlp 'URL'``

Download audio in its best available/native format:
`yt-dlp -x 'URL'``

Download audio and convert it to MP3:
`yt-dlp -x --audio-format mp3 'URL'``

Explicitly download an entire playlist:
`yt-dlp --yes-playlist 'PLAYLIST_URL'``

Temporarily bypass the config:
`yt-dlp --ignore-config 'URL'``
