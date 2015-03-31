#lang racket


(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define account-password password)
  
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: MAKE-ACCOUNT" m))))
        

  (define (check-password m pw)
    (if (eq? account-password pw)
        (dispatch m)
        (lambda (x) "Incorrect password")))
  
  check-password)


(define acc (make-account 100 'sekrit))

((acc 'withdraw 'ccc) 10)