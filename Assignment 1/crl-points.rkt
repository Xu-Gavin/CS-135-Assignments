;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname crl-points) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;
;;---------------------------
;; Gavin Xu (--------)
;; CS 135 Fall 2020
;; Assignment 1, Problem -
;;---------------------------
;;

(define major-penalty 0.75) ; Percentage of points kept by competitor with major violation
(define minor-penalty 0.95) ; Percentage of points kept by competitor with minor violation

;; (crl-points f s t standing) produces the number of points a competitor has in the tour given
;;   the number of first, second, and third place results as well as the penalities received.
;; Examples:
(check-expect (crl-points 1 2 3 'major-violation) 101)
(check-expect (crl-points 1 0 2 'good-standing) 70)

;; crl-points: Nat Nat Nat Sym -> Nat
(define (crl-points f s t standing)
  (cond [(symbol=? standing 'disqualified) 0]
        [(symbol=? standing 'major-violation) (floor (* (raw-points f s t) major-penalty))]
        [(symbol=? standing 'minor-violation) (floor (* (raw-points f s t) minor-penalty))]
        [(symbol=? standing 'good-standing) (floor (raw-points f s t))]))

;; Tests:
(check-expect (crl-points 5 5 5 'disqualified) 0)
(check-expect (crl-points 1 0 0 'minor-violation) 47)
(check-expect (crl-points 0 0 0 'good-standing) 0)


;; raw-points produces the "raw" amount of points exclusive any deductions but inclusive of the
;;   the consistency bonus.
;; Examples:
(check-expect (raw-points 1 2 3) 135)
(check-expect (raw-points 1 0 1) 60)

;; raw-points: Nat Nat Nat -> Nat
(define (raw-points f s t)
  (cond [(>= (+ f s t) 5) (+ (* 50 f) (* 20 s) (* 10 t) 15)]
        [else (+ (* 50 f) (* 20 s) (* 10 t))]))

;; Tests:
(check-expect (raw-points 0 0 0) 0)
(check-expect (raw-points 0 0 5) 65)