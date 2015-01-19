#lang racket

; taking this to mean to compute a single element by its row and column

(define (pascal r c)
  (cond ((> c r) false) ; error
        ((= 0 c) 1) ; left edge
        ((= r c) 1) ; right edge
        (else (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c)))))

"row 0"
(pascal 0 0)

"row 1"
(pascal 1 0)
(pascal 1 1)

"row 2"
(pascal 2 0)
(pascal 2 1)
(pascal 2 2)

"row 3"
(pascal 3 0)
(pascal 3 1)
(pascal 3 2)
(pascal 3 3)

"row 4"
(pascal 4 0)
(pascal 4 1)
(pascal 4 2)
(pascal 4 3)
(pascal 4 4)


