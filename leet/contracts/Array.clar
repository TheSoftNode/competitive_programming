
;; title: Array
;; version: 1
;; summary: Solidify clarity language knowledge
;; description: This is to solidify my knowledge of clarity language. 

;; Exercuse 1:
;; Write a square function so that (map square <list>) returns the squared value of each number (uint) of the list.
(define-private (square (n uint))
  (* n n)
)

(print (map square (list u1 u2 u3 u4 u5)))

(print (is-eq (map square (list u1 u2 u3 u4 u5)) (list u1 u4 u9 u16 u25)))


;; Exercise 2:
;; Define a data-map matching IDs (uint) to Pseudos (string-utf8). 
;; Write a public function get-10-pseudos that takes a list of up to 10 IDs 
;; and returns the matching 10 pseudos.
(define-map psuedos uint (string-utf8 100))

(map-insert psuedos u0 u"uche")
(map-insert psuedos u1 u"theo")
(map-insert psuedos u2 u"onyi")
(map-insert psuedos u4 u"matt")

(define-private (get-1-psuedo (id uint)) 
  (map-get? psuedos id)
)

(define-private (get-10-pseudo (ids (list 10 uint))) 
  (map get-1-psuedo ids)
)