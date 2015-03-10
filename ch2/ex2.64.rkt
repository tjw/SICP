#lang racket

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  ; if nothing to do, everything has been put into a tree
  (if (= n 0) (cons '() elts)
      ; figure out the size that is strictly less than half the input
      (let ((left-size (quotient (- n 1) 2)))
        ; build the left tree
        (let ((left-result (partial-tree elts left-size)))
          ; destructure the result into the left tree that was built, the remainder, and compute the number of elements in the right tree
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            ; get the first element of the unused results (presumably the least, if the input is sorted?) and form the right tree from the rest of the remaining elements
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts) right-size)))
              ; destructure the right tree results into a tree and stuff that didn't go into it
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                ; make a result that is a tree formed by the first, left, right, and the left over junk
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

; this seems horribly obtuse. totally not clear why this would converged and not reject everything or be wildly unbalanced.


(list->tree (list 1 3 5 7 9 11))
