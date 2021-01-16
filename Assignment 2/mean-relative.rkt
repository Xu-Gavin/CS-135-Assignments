;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mean-relative) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;
;;---------------------------
;; Gavin Xu (--------)
;; CS 135 Fall 2020
;; Assignment 2, Problem -
;;---------------------------
;;

;; a (ne-lst of X) is a (lstof X)
;;   requires: (lstof X) to be non-empty

;; (mean-relative lst) produces a list of symbols 'below-mean, 'above-mean,
;;   'mean acording ot the inputs given.
;; Examples:
(check-expect (mean-relative (cons 5 (cons 7 (cons 9 (cons 12 empty)))))
  (cons 'below-mean (cons 'below-mean (cons 'above-mean (cons 'above-mean empty)))))

;; mean-relative: (lstof Int) -> (lstof Sym)
(define (mean-relative lst)
  (cond [(empty? lst) empty]
        [(cons? lst) (constructor lst (mean lst))]))

;; Tests:
(check-expect (mean-relative empty) empty)


;; (sum lst) produces a numeric value equal to the sum of the numeric values
;;   in a list.
;; Examples:
(check-expect (sum (cons 3 (cons 2 (cons 1 empty)))) 6)

;; sum: (lstof Num) -> Num
(define (sum lst)
  (cond [(empty? lst) 0]
        [(cons? lst) (+ (first lst) (sum (rest lst)))]))

;; Tests:
(check-expect (sum empty) 0)
(check-expect (sum (cons 1 empty)) 1)
(check-expect (sum (cons 0 (cons -1 (cons 1 empty)))) 0)


;; (mean lst) produces the mean of a given list of numeric values.
;; Examples:
(check-expect (mean (cons 1 (cons 2 (cons 3 empty)))) 2)

;; mean: (ne-lst of Num) -> Num
(define (mean lst)
  (/ (sum lst) (length lst)))


;; (constructor lst mean) constructs the list of symbols needed in mean-relative
;;   recursively.
;; Examples:
(check-expect (constructor (cons 1 (cons 2 (cons 3 empty)))
                           (mean (cons 1 (cons 2 (cons 3 empty)))))
              (cons 'below-mean (cons 'mean (cons 'above-mean empty))))

;; constructor: (lstof Int) -> (lstof Sym)
(define (constructor lst mean-value)
  (cond [(empty? lst) empty]
        [(cons? lst) (cons (cond [(> (first lst) mean-value) 'above-mean]
                            [(< (first lst) mean-value) 'below-mean]
                            [else 'mean]) (constructor (rest lst) mean-value))]))
