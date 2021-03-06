(define (problem p10)
  (:domain blocks-domain)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 - block t1 t2 t3 t4 - time)
  (:init (current-time t2) (next t1 t2) (next t2 t3) (next t3 t4) (initialization) (emptyhand) (on b1 b11) (on-table b2) (on b3 b10) (on b4 b7) (on b5 b4) (on b6 b3) (on-table b7) (on b8 b1) (on b9 b13) (on-table b10) (on b11 b12) (on b12 b2) (on b13 b5) (on-table b14) (clear b6) (clear b8) (clear b9) (clear b14))
  (:goal (and (emptyhand) (on-table b1) (on-table b2) (on b3 b7) (on b4 b2) (on b5 b13) (on-table b6) (on b7 b12) (on b8 b5) (on b9 b3) (on b10 b4) (on b11 b1) (on b12 b8) (on b13 b14) (on-table b14) (clear b6) (clear b9) (clear b10) (clear b11)))
  (:goal-reward 20)
  (:metric maximize (reward))
)
