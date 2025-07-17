#!/usr/bin/env gsi

;; automates command line args for redshift red light program

;; default val when script is run for red light temp
(define current_temp 3600)

;; set default val
(define (set_redshift temp)
  (shell-command (string-append "redshift -O " (number->string temp))))

(define (turn_on temp)
  (set_redshift temp)
  (display (string-append "redshift on; level: " (number->string temp) "K\n")))

(define (turn_off)
  (shell-command "redshift -x")
  (display "redshift off\n"))

(define (adjust delta)
  (let ((new_temp (+ current_temp delta)))
    (set_redshift new_temp)
    (display (string-append "red light increased\n"))))

;; cli args
(let ((args (cdr (command-line))))
  (cond
    ((null? args) (turn_on current_temp))
    ((string=? (car args) "+") (adjust 900))
    ((string=? (car args) "-") (turn_off))
    (else (display "usage: redshift.scm {+|-}\n"))))
