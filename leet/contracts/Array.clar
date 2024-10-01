
;; title: Array
;; version: 1
;; summary: This is the leetcode answers under array with clarity.
;; description: This is to solidify my knowledge of clarity language. It features the easy questions under array in clarity language.


(define-public (two-sum (nums (list 100 uint)) (target uint))
  (let ((result (find-two-sum nums target 0 {})))
    (if (is-none result)
        (err u404) ;; Return an error if no solution is found
        (ok (unwrap! result (err u500))) ;; Return the result if found
    )
  )
)

;; Helper function to recursively find two numbers that add up to the target
(define-private (find-two-sum (nums (list 100 uint)) (target uint) (index uint) (index-map (map uint uint)))
  (match (get index nums)
    ;; If no more numbers are left to check, return none
    value-none (none)

    ;; If there are still numbers to check, proceed
    value-some
    (let
      (
        ;; Current number
        (current (unwrap-panic value-some))

        ;; Difference between target and current number
        (difference (uint-sub target current))

        ;; Check if the difference exists in the index-map
        (found-index (map-get? index-map difference))
      )

      ;; If we find the difference, return the indices
      (if found-index
        (some {index1: (unwrap-panic found-index), index2: index})

        ;; Otherwise, update the map and check the next number recursively
        (find-two-sum nums target (uint-add index u1) (map-set index-map current index))
      )
    )
  )
)


