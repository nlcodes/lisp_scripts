#!/usr/bin/env gsi

; records whole screen + audio in x11 using ffmpeg
; continues until user exits program (ctrl + c); saves the capture

(define (main)
  (shell-command "mkdir -p ~/pictures")
  (shell-command "ffmpeg -f x11grab -probesize 10M -s 1920x1080 -i :0.0 -f alsa -i hw:2,0 -ac 2 -ar 48000 -r 30 -c:v libx264 -preset fast -crf 23 ~/pictures/recording_$(date +'%Y%m%d_%H%M%S').mp4"))

(main)

