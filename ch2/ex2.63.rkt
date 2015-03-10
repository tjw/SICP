#lang racket

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
(define (make-leaf entry) (make-tree entry '() '()))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  
  (copy-to-list tree '()))

; tree-list-1 produces sorted lists in ascending order
; tree-list-2 produces reverse sorted lists
; ... huh, nope: sorted list

(define t1 (make-tree 7
                      (make-tree 3 (make-leaf 1) (make-leaf 5))
                      (make-tree 9 '() (make-leaf 11))))
(define t2 (make-tree 3
                      (make-leaf 1)
                      (make-tree 7
                                 (make-leaf 5)
                                 (make-tree 9 '() (make-leaf 11)))))

(define t3 (make-tree 5
                      (make-tree 3 (make-leaf 1) '())
                      (make-tree 9 (make-leaf 7) (make-leaf 11))))

(tree->list-1 t3)
                      
(tree->list-2 t3)

; same lists for all of t1, t2, t3

; tree->list-2 avoids append, so seems more O(n) while tree->list-1 seems more O(n * log(n))

