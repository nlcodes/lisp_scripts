#!/usr/bin/env gsi

;; Function to check if a process is already running
(define (process-running? name)
  (= 0 (shell-command (string-append "pgrep -x " name " > /dev/null"))))

;; Function to launch an app in st only if it's not already running
(define (launch-in-terminal name command)
  (if (not (process-running? name))
      (begin
        (display (string-append "Launching " name "...\n"))
        (shell-command 
          (string-append 
            "st -t '" name "' -e sh -c '" command "' &")))
      (display (string-append name " is already running.\n"))))

;; Launch apps in sequence
(define (main)

  (launch-in-terminal "qjackctl" "qjackctl")
  (thread-sleep! 2)

  (launch-in-terminal "catia" "catia")
  (thread-sleep! 2)

  (launch-in-terminal "Rack" "cd /home/user/Rack2free && ./Rack")
  (thread-sleep! 2)


  (launch-in-terminal "carla" "carla")
  (thread-sleep! 2))
  




;; Run the main function
(main)
