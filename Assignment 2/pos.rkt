;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname pos) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;
;;---------------------------
;; Gavin Xu (--------)
;; CS 135 Fall 2020
;; Assignment 2, Problem -
;;---------------------------
;;

;; Common helper function:

;; (sum lst) sums the numbers in a list
;; Examples:
(check-expect (sum (cons 10 (cons 20 empty))) 30)

;; sum: (lstof Num) -> Num
(define (sum lst)
  (cond [(empty? lst) 0]
        [(cons? lst) (+ (first lst) (sum (rest lst)))]))

;; Tests:
(check-expect (sum empty) 0)
(check-expect (sum (cons 1 empty)) 1)
(check-expect (sum (cons 0 (cons -1 (cons 1 empty)))) 0)

;; Test constant: (for examples and testing only)
(define prices1
  (cons 2.65 (cons 23.30 (cons 7.99 (cons 59.99 empty)))))


;; PART A

;; (change-due cost paid) produces the amount of change that is owed to
;;    a customer
;; Examples:
(check-expect (change-due prices1 100) 6.07)
(check-expect (change-due prices1 93.93) 0)

;; change-due: (lstof Num) Num -> Num
;;  Requires: costs <= paid
(define (change-due costs paid)
  (- paid (sum costs)))

;; Tests:
(check-expect (change-due (cons 0 empty) 300) 300)


;; PART B

;; paid-enough? produces true if they have paid enough money to cover costs
;;   otherwise, the function returns false.
;; Examples:
(check-expect (paid-enough? prices1 100) true)
(check-expect (paid-enough? prices1 90) false)

;; paid-enough?: (ne-lstof Num) Num -> Bool
(define (paid-enough? costs paid)
  (cond [(<= (sum costs) paid) true]
        [else false]))

;; Tests:
(check-expect (paid-enough? prices1 93.93) true)
(check-expect (paid-enough? prices1 0) false)


;; PART C

;; (free-item costs paid) produces the price of the first item that when
;;   ommitted, allows a customer to have enough to pay for their purchases.
;; Examples:
(check-expect (free-item prices1 80) 23.3)
(check-expect (free-item prices1 60) 59.99)

;; free-item: (ne-lstof Num) Num -> Num
;;  Requires: costs > paid
(define (free-item costs paid)
  (cond [(>= (first costs) (abs (change-due costs paid)))
         (first costs)]
        [else (rest-free-item (rest costs) (abs (change-due costs paid)))]))

;; Tests:
(check-expect (free-item prices1 92) 2.65)

;; (rest-free-item costs needed) checks and produces the remaining items in a
;;   list returns the first item that is larger than the needed amount.
;; Examples:
(check-expect (rest-free-item prices1 20) 23.3)

;; res-free-item: (ne-listof Num) Num -> Num
(define (rest-free-item costs needed)
  (cond [(>= (first costs) needed) (first costs)]
        [else (rest-free-item (rest costs) needed)]))
  