;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname grades) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;
;;---------------------------
;; Gavin Xu (--------)
;; CS 135 Fall 2020
;; Assignment 2, Problem -
;;---------------------------
;;

;; Constants:
(define failing-grade 0.5) ; 50%, the failing grade is 0.5 in decimal form
(define sc-weight 0.1) ; 10%, the weight of self checks in decimal form
(define assign-weight 0.6) ; 60%, the weight of assignments in decimal form
(define mid-1-weight 0.07) ; 7%, the weight of mid term 2 in decimal form
(define mid-2-weight 0.07) ; 7%, the weight of mid term 1 in decimal form
(define final-weight 0.16) ; 16%, the weight of the final in decimal form

;; (cs135-grade sc assign mid-1 mid-2 final produces the final
;;   grade received in CS135 out of 100
;; Examples:
(check-expect (cs135-grade 0.8 0.6 0.4 0.9 0.95) 68.3)
(check-expect (cs135-grade 0.8 0.6 0.4 0.9 0) 46)

;; cs135-grade: Num Num Num Num Num -> Num
(define (cs135-grade sc assign mid-1 mid-2 final)
  (cond [(or (< final failing-grade) (< assign failing-grade))
         (cond [(< (normal_calc sc assign mid-1 mid-2 final) 46)
                (normal_calc sc assign mid-1 mid-2 final)]
               [else 46])]
        [else (normal_calc sc assign mid-1 mid-2 final)]))


;; Tests:
(check-expect (cs135-grade 0.8 0.4 0.4 0.9 0) 41.1)
(check-expect (cs135-grade 0 0 0 0 0) 0)
(check-expect (cs135-grade 1 1 1 1 1) 100)


;; (normal_calc sc assign mid-1 mid-2 final) produces the grade 
;;    received in CS135 out of 100 without any special conditions of passing.
;; Examples:
(check-expect (normal_calc 0.8 0.6 0.4 0.9 0.95) 68.3)
(check-expect (normal_calc 0.8 0.6 0.4 0.9 0) 53.1)

;; normal_calc: Num Num Num Num Num -> Num
(define (normal_calc sc assign mid-1 mid-2 final)
  (* (+ (* sc sc-weight)
        (* assign assign-weight)
        (* mid-1 mid-1-weight)
        (* mid-2 mid-2-weight)
        (* final final-weight))
     100))
