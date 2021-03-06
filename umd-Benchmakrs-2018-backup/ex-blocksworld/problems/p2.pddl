(define (problem p2)
  (:domain exploding-blocksworld)
  (:objects b1 b2 b3 b4 b5 - block t1 t2 t3 t4 - time)
  (:init (current-time t3) (next t1 t2) (next t2 t3) (next t3 t4) (next t3 t4) (initialization) (emptyhand) (on b1 b3) (on b2 b1) (on b3 b5) (on-table b4) (on b5 b4) (clear b2) (no-detonated b1) (no-destroyed b1) (no-detonated b2) (no-destroyed b2) (no-detonated b3) (no-destroyed b3) (no-detonated b4) (no-destroyed b4) (no-detonated b5) (no-destroyed b5) (no-destroyed-table))
  (:goal (and (on b2 b5) (on b4 b2) (on-table b5)))
  (:goal-reward 1)
  (:metric maximize (reward))
)
