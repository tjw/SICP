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

; Takes list of numbers and emits a list of lists with all numbers from 1..(n-1) prefixed
(define (lists-with-prefix-less-than-existing ns)
  (let ((n (car ns)))
    (map (lambda (i) (cons i ns))
         (enumerate-interval 1 (- n 1)))))

(define (unique-triples n)
  (accumulate append null (map lists-with-prefix-less-than-existing (lists-with-prefix-less-than-existing (list n)))))

(define (triples-equal-to-sum n s)
  (filter (lambda (triple) (= (sum triple) s))
          (unique-triples n)))

(triples-equal-to-sum 10 20)
                     