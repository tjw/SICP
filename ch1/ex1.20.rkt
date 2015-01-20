#lang racket

; p70

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; normal-order (gcd 206 40)
(gcd 206 40)
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

; bored now.
