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

(define (prime? n)
  (define (divides? n d)
    (= (remainder n d) 0))
  (define (check-from n d)
    (cond ((divides? n d) #f)
          ((>= (* d d) n) #t)
          (else (check-from n (+ 2 d)))))
  (cond ((< n 2) #f)
        ((<= n 3) #t)
        ((divides? n 2) #f)
        (else (check-from n 3))))

;(map (lambda (i)
;       (list i (prime? i)))
;     (enumerate-interval 1 100))
       
;(enumerate-interval 5 8)

(define (unique-pairs n)
  (accumulate 
   append
   null
   (map (lambda (i)
          (map (lambda (j) 
                 (list i j))
               (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) 
        (cadr pair) 
        (+ (car pair) (cadr pair))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
               
(prime-sum-pairs 4)
; '((2 1 3) (3 2 5) (4 1 5) (4 3 7))