
;; title: Array
;; version: 1
;; summary: Solidify clarity language knowledge
;; description: This is to solidify my knowledge of clarity language. 

;; Exercuse 1:
;; Write a square function so that (map square <list>) returns the squared value of each number (uint) of the list.
(define-private (square (n uint))
  (* n n)
)

(define-private (square2 (n uint)) (pow n u2))

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

(define-private (get-10-pseudos (ids (list 10 uint))) 
  (map get-1-psuedo ids)
)

(print (get-10-pseudos (list u0 u3 u4)))


;; Exercise 3:
;; Write a function called is-even so that (filter is-even <list>) 
;; returns the list of even numbers from the <list>.
(define-private (is-even (n uint)) 
  (is-eq (mod n u2) u0)
)
(print (filter is-even (list u1 u2 u10 u51 u42)))

;; Exercise 4:
;; Looking back at Exercise 2, the output of the get-10-pseudos could be improved. 
;; When we left it, it returned an optional utf8 string ((some u"string") or none). 
;; What if we wanted it to return only the pseudos, along with the matching id.
(define-map improved-pseudos uint (string-ascii 100))
(map-insert improved-pseudos u0 "uche")
(map-insert improved-pseudos u1 "theo")
(map-insert improved-pseudos u2 "onyii")
(map-insert improved-pseudos u4 "matt")

(define-private (get-1-improved-pseudo (id uint))
(some {
  id: id,
  pseudo: (
    unwrap! (map-get? improved-pseudos id)
    none
  )
}))

(define-private (unwrap-improved-pseudo
  (item (optional {
    id: uint,
    pseudo: (string-ascii 100)
  })))
  (unwrap-panic item)
)

(define-private (is-some-improved-pseudo
  (item (optional {
    id: uint,
    pseudo: (string-ascii 100)
  })))
  (is-some item)
)

(define-read-only (get-10-improved-pseudos (ids (list 10 uint))) 
  (map unwrap-improved-pseudo 
  (filter is-some-improved-pseudo (map get-1-improved-pseudo ids))
  )
)