(define (problem p1)
  (:domain blocks-domain)
  (:objects b1 b2 b3 - block)
  (:init (emptyhand) (on-table b1) (on b2 b3) (on-table b3) (clear b1) (clear b2))
  (:goal (and (emptyhand) (on b1 b2) (on-table b2) (on-table b3) (clear b1) (clear b3)))
  (:goal-reward 1)
  (:metric maximize (reward))
)
