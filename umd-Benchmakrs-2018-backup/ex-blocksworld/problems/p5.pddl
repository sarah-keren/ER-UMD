(define (problem p5)
  (:domain exploding-blocksworld)
  (:objects b1 b2 b3 b4 b5 b6 b7 - block t1 t2 t3 t4 - time)
  (:init (current-time t3) (next t1 t2) (next t2 t3) (next t3 t4) (next t3 t4) (initialization) (emptyhand) (on-table b1) (on b2 b1) (on b3 b4) (on-table b4) (on b5 b3) (on-table b6) (on b7 b2) (clear b5) (clear b6) (clear b7) (no-detonated b1) (no-destroyed b1) (no-detonated b2) (no-destroyed b2) (no-detonated b3) (no-destroyed b3) (no-detonated b4) (no-destroyed b4) (no-detonated b5) (no-destroyed b5) (no-detonated b6) (no-destroyed b6) (no-detonated b7) (no-destroyed b7) (no-destroyed-table))
  (:goal (and (on-table b1) (on b2 b1) (on b3 b6) (on b5 b3) (on b7 b2)))
  (:goal-reward 1)
  (:metric maximize (reward))
)
