#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (enumerate-interval i j)
  (if (> i j) null
      (cons i (enumerate-interval (+ 1 i) j))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;;;;

(define (sum list)
  (fold-left + 0 list))

;(define (map-interval i j f)
;  (if (> i j) null
;      (cons (f i) (map-interval (+ 1 i) j f))))

; Takes list of numbers and emits a list of lists with all numbers from 1..(n-1) prefixed
(define (lists-with-prefix-less-than-existing ns)
  (let ((n (car ns)))
    (map (lambda (i) (cons i ns))
         (enumerate-interval 1 (- n 1)))))

;(accumulate append null (map lists-with-prefix-less-than-existing (lists-with-prefix-less-than-existing (list 10))))

;(define (unique-triples n)
;  (accumulate 
;   append
;   null
;   (map (lambda (i)
;          (map (lambda (j)
;                 (map (lambda (k) (list i j k))
;                      (enumerate-interval 1 (- j 1))))
;               (enumerate-interval 1 (- i 1))))
;        (enumerate-interval 1 n))))

(define (unique-triples n)
  (accumulate append null (map lists-with-prefix-less-than-existing (lists-with-prefix-less-than-existing (list n)))))
  
;(unique-triples 5)

(define (triples-equal-to-sum n s)
  (filter (lambda (triple) (= (sum triple) s))
          (unique-triples n)))

;(enumerate-interval 4 8)
(triples-equal-to-sum 10 20)
                     