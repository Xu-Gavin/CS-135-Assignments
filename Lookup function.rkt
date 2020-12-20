;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Lookup function|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;; Lookup function

;; This function consumes a key and a dictionary and produces the corresponding
;; value when it is found. IN THE CASE that the key is not found in the
;; association list, we produce false.

;; Examples:
(check-expect (lookup 2 (list (list 8 "Asha")
                              (list 2 "Joseph")
                              (list 5 "Sami"))) "Joseph")
(check-expect (lookup 1 (list (list 8 "Asha")
                              (list 2 "Joseph")
                              (list 5 "Sami"))) false)

;; Helper key and value functions:
(define (key kv) (first kv))
(define (val kv) (second kv))

;; (lookup-al k alst) produces the value corresponding to key k, or false if k
;; not present

;; lookup-al:
(define (lookup-al k alst)
  (cond [(empty? alst) false]
        [(= k (key (first alst))) (val (first alst))]
        [else (lookup-al k (rest alst))]))