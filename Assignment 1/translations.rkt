;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname translations) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;
;;---------------------------
;; Gavin Xu (--------)
;; CS 135 Fall 2020
;; Assignment 1, Problem -
;;---------------------------
;;

;; a)

;; (volume r) produces the volume of a sphere
;; Examples:
(check-within (volume 1) 4.19 0.01)
(check-within (volume 3) 113.10 0.01)

;; volume: Num -> Num
;; requires r >=0
(define (volume r)
  (* 4/3 (* pi (expt r 3))))

;; Tests:
(check-expect (volume 0) 0)
(check-within (volume 0.5) 0.52 0.01)


;; b)

(define golden-ratio (/ (+ 1 (sqrt 5)) 2)) ; Golden Ratio

;; (fib n) produces the nth term of the Fibonacci sequence
;; Examples:
(check-within (fib 3) 2 0.01)
(check-within (fib 5) 5 0.01)

;; fib: Int -> Int
;; requires n > 0
(define (fib n)
  (/ (- (expt golden-ratio n)
        (expt (* golden-ratio -1)
              (* n -1)))
     (- (* 2 golden-ratio) 1)))

;; Tests:
(check-within (fib 1) 1 0.01)
(check-within (fib 2) 1 0.01)
(check-within (fib 10) 55 0.01) 