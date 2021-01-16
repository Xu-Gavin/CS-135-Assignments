;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname parity) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;
;;---------------------------
;; Gavin Xu (--------)
;; CS 135 Fall 2020
;; Assignment 2, Problem -
;;---------------------------
;;

;; (parity lst) produces 'even if the number of 1s is even, otherwise it
;;   produces false.
;; Examples:
(check-expect (parity "110101") 'even)
(check-expect (parity "1110011") 'odd)

;; parity: Str -> Sym
(define (parity lst)
  (cond [(empty? (string->list lst)) 'even]
        [(even? (count-ones lst)) 'even]
        [else 'odd]))

;; Tests:
(check-expect (parity "0") 'even)
(check-expect (parity "") 'even)


;; (count-ones lst) produces the number of number 1s in the given list
(check-expect (count-ones "111") 3)
(check-expect (count-ones "0") 0)

;; count-ones: Str -> Nat
;;  Requires: string to contain either 0s or 1s
(define (count-ones lst)
  (cond [(empty? lst) 0]
        [(string? lst) (cond [(char=? (first (string->list lst)) #\1)
                           (+ 1 (count-ones (rest (string->list lst))))]
                          [else (count-ones (rest (string->list lst)))])]
        [(cons? lst)(cond [(char=? (first lst) #\1)
                           (+ 1 (count-ones (rest lst)))]
                          [else (count-ones (rest lst))])]))
