(define (problem p12)
  (:domain exploding-blocksworld)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 - block)
  (:init (emptyhand) (on b1 b8) (on-table b2) (on b3 b5) (on b4 b7) (on-table b5) (on b6 b9) (on b7 b1) (on b8 b2) (on-table b9) (clear b3) (clear b4) (clear b6)
(no-detonated b1) (no-destroyed b1) (no-detonated b2) (no-destroyed b2) (no-detonated b3) (no-destroyed b3) (no-detonated b4) (no-destroyed b4) (no-detonated b5) (no-destroyed b5) (no-detonated b6) (no-destroyed b6)(no-detonated b7) (no-destroyed b7) (no-detonated b8) (no-destroyed b8) (no-detonated b9) (no-destroyed b9) (no-destroyed-table)
)
  (:goal (and (emptyhand) (on b2 b6) (on b1 b5) (on-table b3) (on-table b4) (on b5 b9) (on-table b6) (on b7 b1) (on b8 b3) (on b9 b8) (clear b2) (clear b4) (clear b7)))
  (:goal-reward 1)
  (:metric maximize (reward))
)
