#!/usr/bin/env gsi
;; QjackCtl delayed start script
;; Requires Gambit Scheme (gsi)

(define (system-safe command)
  (let ((result (shell-command command)))
    (if (= result 0)
        #t
        #f)))

(define (sleep-seconds n)
  (thread-sleep! n))

(define (start-jackd)
  (display "Attempting to start QjackCtl...\n")
  (system-safe "qjackctl --start"))

(define (main)
  (display "Waiting for 5 seconds before starting QjackCtl...\n")
  (sleep-seconds 5)  ; Wait for 5 seconds
  (if (start-jackd)
      (display "QjackCtl started successfully!\n")
      (display "Failed to start QjackCtl.\n")))

;; Run the main function
(main)
