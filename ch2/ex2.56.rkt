#lang racket

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) 
         (+ a1 a2))
        (else (list '+ a1 a2))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) (caddr s))


(define (make-product m1 m2)
  (cond ((or (=number? m1 0) 
             (=number? m2 0)) 
         0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) 
         (* m1 m2))
        (else (list '* m1 m2))))

(define (make-exponentiation base power)
  (cond ((=number? power 0) 1)
        ((=number? power 1) base)
        (else (list '** base power))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))
(define (base exp)
  (cadr exp))
(define (exponent exp)
  (caddr exp))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(define (deriv exp var)
  (define (deriv-number x)
    0)

  (define (deriv-variable x)
    (if (same-variable? exp var) 1 0))
  
  (define (deriv-sum x)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
    
  (define (deriv-product x)
    (make-sum
          (make-product 
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product 
           (deriv (multiplier exp) var)
           (multiplicand exp))))
  
  (define (deriv-exponentiation exp)
    (make-product (make-product (exponent exp)
                                (make-exponentiation (base exp) (- (exponent exp) 1)))
                  (deriv (base exp) var)))
                  
  (let ((deriv-op (cond ((number? exp) deriv-number)
                        ((variable? exp) deriv-variable)
                        ((sum? exp) deriv-sum)
                        ((product? exp) deriv-product)
                        ((exponentiation? exp) deriv-exponentiation)
                        (else (error "unknown expression type: DERIV" exp)))))
    (deriv-op exp)))

(deriv '(** (** x 2) 2) 'x)
