#lang racket

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree)) (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits) '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit: CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair) ; symbol
                               (cadr pair)) ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaves)
  (if (null? leaves) leaves
      (let ((first (car leaves)))
        (if (null? (cdr leaves))
            first ; done -- just one tree left
            (let ((second (cadr leaves)))
              (successive-merge (adjoin-set (make-code-tree first second) (cddr leaves))))))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((null? tree) (error "symbol not in tree"))
        ((and (leaf? tree) (eq? symbol (symbol-leaf tree))) '())
        ((memq symbol (symbols (left-branch tree))) (cons 0 (encode-symbol symbol (left-branch tree))))
        ((memq symbol (symbols (right-branch tree))) (cons 1 (encode-symbol symbol (right-branch tree))))
        (else (error "OBASSERT_NOT_REACHED"))))

;;;;

(define ex-tree (generate-huffman-tree '((A 2) (GET 2) (SHA 3) (WAH 1) (BOOM 1) (JOB 2) (NA 16) (YIP 9))))
(define ex-message '(GET A JOB
                     SHA NA NA NA NA NA NA NA NA
                     GET A JOB                     
                     SHA NA NA NA NA NA NA NA NA
                     WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
                     SHA BOOM))

(length (encode ex-message ex-tree)); 84

(decode (encode ex-message ex-tree) ex-tree)

; with a fixed length code, we'd need 3 bits per symbol.
(* 3 (length ex-message)) ; 108

