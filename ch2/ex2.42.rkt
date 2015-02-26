#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))
(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (enumerate-interval i j)
  (if (> i j) null
      (cons i (enumerate-interval (+ 1 i) j))))

(define (println . stuff)
  (map display stuff)
  (newline))

; builds a new list of elements from l that satisfy p? by running them through f.
(define (map-if p? f l)
  (if (null? l) l
      (let ((head (car l))
            (rest (map-if p? f (cdr l))))
        (if (p? head)
            (cons (f head) rest)
            rest))))

; Runs a list through f n times
(define (iterate n f l)
    (if (= n 0) l
        (iterate (- n 1) f (f l))))

;;;;

(define empty-board null)
(define (adjoin-position row board) 
  (cons row board))

; Check if a possible new row is safe to place next to (lets say on the left-of) an existing board.
(define (safe? row board)
  (define (safe-in-column? distance columns)
    (if (null? columns) #t ; No more rows to check!
        (let ((position (car columns)))
          (cond ((= position row) #f) ; No two queens can be in the same row
                ((= (abs (- row position)) distance) #f) ; No diagonals allowed
                (else (safe-in-column? (+ 1 distance) (cdr columns))))))) ; check the rest of the columns
  
  (safe-in-column? 1 board)) ; the first column is one step away (diagonal has to be +/-1)


(define (queens board-size)
  ; takes a single board and returns a list of boards with a new column just to the left of the existing columns, where each board is safe.
  (define (add-safe-columns board)
    (map-if (lambda (row) (safe? row board))
            (lambda (row) (adjoin-position row board))
            (enumerate-interval 1 board-size)))
  
  ; takes a list of boards and returns a new list of boards that are safe
  (define (extend-safe-boards boards)
    (flatmap add-safe-columns boards))
  
  ; starting from list of one empty board (zero columns), append columns to fill the board size
  (iterate board-size extend-safe-boards '(())))

;;;;

(queens 8)
; 92 results