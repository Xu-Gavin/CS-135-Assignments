;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname extremes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;
;;---------------------------
;; Gavin Xu (--------)
;; CS 135 Fall 2020
;; Assignment 2, Problem -
;;---------------------------
;;

;; PART A

;; (smallest numbers) produces the smallest number from a list of numbers
;; Examples:
(check-expect (smallest empty) empty)
(check-expect (smallest (cons -1 (cons -3 (cons 1 empty)))) -3)

;; smallest: (listof Num) -> Num
(define (smallest numbers)
  (cond [(empty? numbers) empty]
        [(empty? (rest numbers)) (first numbers)]
        [(< (first numbers) (smallest (rest numbers))) (first numbers)]
        [else (smallest (rest numbers))]))

;; Tests
(check-expect (smallest (cons 1 (cons 2 (cons 3 empty)))) 1)
(check-expect (smallest (cons -1 (cons -2 (cons 3 empty)))) -2)
(check-expect (smallest (cons 1 (cons 2 (cons -5 empty)))) -5)
(check-expect (smallest (cons -5 (cons 2 (cons 10.5 empty)))) -5)
(check-expect (smallest (cons 0.0000001 (cons -100000000 empty))) -100000000)
(check-expect (smallest (cons 0 (cons 0 (cons 0 empty)))) 0)


;; PART B

;; (largest numbers) produces the largest number given a list of numebrs
;; Examples:
(check-expect (largest empty) empty)
(check-expect (largest (cons 1 (cons 9 (cons 5 empty)))) 9)

;; largest: (listof Num) -> Num
(define (largest numbers)
  (cond [(empty? numbers) empty]
        [(empty? (rest numbers)) (first numbers)]
        [(> (first numbers) (largest (rest numbers))) (first numbers)]
        [else (largest (rest numbers))]))

;; Tests
(check-expect (largest (cons -5 (cons 2 (cons 10.5 empty)))) 10.5)
(check-expect (largest (cons -5 (cons -3 (cons -1 empty)))) -1)
(check-expect (largest (cons 0 (cons 0 (cons 0 empty)))) 0)
(check-expect (largest (cons 0.000000001 (cons -100000000 empty))) 0.000000001)


;; PART C

;; (max-diff numbers) produces the maximum difference from 
;; Examples:
(check-expect (max-diff empty) empty)
(check-expect (max-diff (cons -5 (cons 2 (cons 10.5 empty)))) 15.5)

;; max-diff: (listof Num) -> Num
(define (max-diff numbers)
  (cond [(empty? numbers) empty]
        [else (- (largest numbers) (smallest numbers))]))

;; Tests
(check-expect (max-diff (cons -1 (cons 5 (cons 0 empty)))) 6)
(check-expect (max-diff (cons 0 (cons 10000000 (cons -100 empty)))) 10000100)