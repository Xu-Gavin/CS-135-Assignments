;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sequences) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;
;;---------------------------
;; Gavin Xu (--------)
;; CS 135 Fall 2020
;; Assignment 1, Problem -
;;---------------------------
;;

;; (sequence-type a b c d) produces the symbol 'arithmetic, 'geometric, 'neither, or 'both
;;   that corresponds to the type of sequence, a b c d, that was inputted.
;; Examples:
(check-expect (sequence-type 1 2 3 4) 'arithmetic)
(check-expect (sequence-type 3 6 12 24) 'geometric)

;; sequence-type: Num Num Num Num -> Symbol
(define (sequence-type a b c d)
  (cond [(and (arithmetic-check a b c d) (geometric-check a b c d)) 'both]
        [(arithmetic-check a b c d) 'arithmetic]
        [(geometric-check a b c d) 'geometric]
        [else 'neither]))

;; Tests:
(check-expect (sequence-type 1 5 2 7) 'neither)
(check-expect (sequence-type 0 0 0 0) 'both)


;; (arithmetic-check a b c d) produces true if the sequence, a b c d, is arithmetic and
;;   false otherwise.
;; Examples:
(check-expect (arithmetic-check 1 2 3 4) true)
(check-expect (arithmetic-check 1 3 9 27) false)

;; arithemtic-check: Num Num Num Num -> Bool
(define (arithmetic-check a b c d)
  (cond [(= (- b a) (- c b) (- d c)) true]
        [else false]))

;; Tests:
(check-expect (arithmetic-check 0 -2 -4 -6) true)
(check-expect (arithmetic-check -6 -1 4 9) true)
(check-expect (arithmetic-check 0 0 0 0) true)


;; (geometric-check a b c d) produces true if the sequence, a b c d, is geometric and false
;;   otherwise.
;; Examples:
(check-expect (geometric-check 1 3 9 27) true)
(check-expect (geometric-check 1 2 3 4) false)

;; geometric-check: Num Num Num Num -> Bool
(define (geometric-check a b c d)
  (cond [(and (= a 0) (= a b c d)) true]
        [(= (/ b a) (/ c b) (/ d c)) true]
        [else false]))

;; Tests:
(check-expect (geometric-check 1 -2 4 -8) true)
(check-expect (geometric-check -1 -2 -4 -8) true)
(check-expect (geometric-check 18 9 4.5 2.25) true)
(check-expect (geometric-check 0 0 0 0) true)