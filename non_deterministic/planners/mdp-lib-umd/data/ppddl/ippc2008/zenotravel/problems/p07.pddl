(define (domain zenotravel)
  (:requirements :typing :universal-preconditions :probabilistic-effects :rewards)
  (:types aircraft person city flevel - object)
  (:predicates (at-person ?p - person ?c - city)
               (at-aircraft ?a - aircraft ?c - city)
           (boarding ?p - person ?a - aircraft)
           (not-boarding ?p - person)
           (in ?p - person ?a - aircraft)
           (debarking ?p - person ?a - aircraft)
           (not-debarking ?p - person)
           (fuel-level ?a - aircraft ?l - flevel)
           (next ?l1 ?l2 - flevel)
           (flying ?a - aircraft ?c - city)
           (zooming ?a - aircraft ?c - city)
           (refueling ?a - aircraft)
           (not-refueling ?a - aircraft)
  )
  (:action start-boarding
    :parameters (?p - person ?a - aircraft ?c - city)
    :precondition (and (at-person ?p ?c) (at-aircraft ?a ?c))
    :effect (and (not (at-person ?p ?c)) (not (not-boarding ?p)) (boarding ?p ?a))
  )
  (:action complete-boarding
    :parameters (?p - person ?a - aircraft ?c - city)
    :precondition (and (boarding ?p ?a) (at-aircraft ?a ?c))
    :effect (probabilistic 1/2 (and (not (boarding ?p ?a)) (in ?p ?a) (not-boarding ?p)))
  )
  (:action start-debarking
    :parameters (?p - person ?a - aircraft ?c - city)
    :precondition (and (in ?p ?a) (at-aircraft ?a ?c))
    :effect (and (not (in ?p ?a)) (not (not-debarking ?p)) (debarking ?p ?a))
  )
  (:action complete-debarking
    :parameters (?p - person ?a - aircraft ?c - city)
    :precondition (and (debarking ?p ?a) (at-aircraft ?a ?c))
    :effect (probabilistic 1/4 (and (not (debarking ?p ?a)) (at-person ?p ?c) (not-debarking ?p)))
  )
  (:action start-flying
    :parameters (?a - aircraft ?c1 ?c2 - city ?l1 ?l2 - flevel)
    :precondition (and (at-aircraft ?a ?c1) (fuel-level ?a ?l1) (next ?l2 ?l1) (not-refueling ?a)
                       (forall (?p - person) (and (not-boarding ?p) (not-debarking ?p))))
    :effect (and (not (at-aircraft ?a ?c1)) (flying ?a ?c2))
  )
  (:action complete-flying
    :parameters (?a - aircraft ?c2 - city ?l1 ?l2 - flevel)
    :precondition (and (flying ?a ?c2) (fuel-level ?a ?l1) (next ?l2 ?l1))
    :effect (and
         (decrease reward 10)
         (probabilistic 1/25 (and (not (flying ?a ?c2)) (at-aircraft ?a ?c2) (not (fuel-level ?a ?l1)) (fuel-level ?a ?l2)))
         )
  )
  (:action start-zooming
    :parameters (?a - aircraft ?c1 ?c2 - city ?l1 ?l2 - flevel)
    :precondition (and (at-aircraft ?a ?c1) (fuel-level ?a ?l1) (next ?l2 ?l1) (not-refueling ?a)
                       (forall (?p - person) (and (not-boarding ?p) (not-debarking ?p))))
    :effect (and (not (at-aircraft ?a ?c1)) (zooming ?a ?c2))
  )
  (:action complete-zooming
   :parameters (?a - aircraft ?c2 - city ?l1 ?l2 - flevel)
   :precondition (and (zooming ?a ?c2) (fuel-level ?a ?l1) (next ?l2 ?l1))
   :effect (and
        (decrease reward 25)
        (probabilistic 1/15 (and (not (zooming ?a ?c2)) (at-aircraft ?a ?c2) (not (fuel-level ?a ?l1)) (fuel-level ?a ?l2)))
        )
  )
  (:action start-refueling
    :parameters (?a - aircraft ?c - city ?l ?l1 - flevel)
    :precondition (and (at-aircraft ?a ?c) (not-refueling ?a) (fuel-level ?a ?l) (next ?l ?l1))
    :effect (and (refueling ?a) (not (not-refueling ?a)))
  )
  (:action complete-refuling
    :parameters (?a - aircraft ?l ?l1 - flevel)
    :precondition (and (refueling ?a) (fuel-level ?a ?l) (next ?l ?l1))
    :effect (probabilistic 1/7 (and (not (refueling ?a)) (not-refueling ?a) (fuel-level ?a ?l1) (not (fuel-level ?a ?l))))
  )
)

(define (problem p07)
  (:domain zenotravel)
  (:objects c0 c1 c2 c3 c4 c5 c6 - city p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 - person a0 a1 a2 a3 a4 a5 - aircraft f0 f1 f2 f3 f4 - flevel)
  (:init (next f0 f1) (next f1 f2) (next f2 f3) (next f3 f4)
         (at-person p0 c5) (not-boarding p0) (not-debarking p0)
         (at-person p1 c4) (not-boarding p1) (not-debarking p1)
         (at-person p2 c0) (not-boarding p2) (not-debarking p2)
         (at-person p3 c6) (not-boarding p3) (not-debarking p3)
         (at-person p4 c3) (not-boarding p4) (not-debarking p4)
         (at-person p5 c6) (not-boarding p5) (not-debarking p5)
         (at-person p6 c1) (not-boarding p6) (not-debarking p6)
         (at-person p7 c2) (not-boarding p7) (not-debarking p7)
         (at-person p8 c1) (not-boarding p8) (not-debarking p8)
         (at-person p9 c6) (not-boarding p9) (not-debarking p9)
         (at-aircraft a0 c4) (fuel-level a0 f2) (not-refueling a0)
         (at-aircraft a1 c6) (fuel-level a1 f1) (not-refueling a1)
         (at-aircraft a2 c6) (fuel-level a2 f0) (not-refueling a2)
         (at-aircraft a3 c3) (fuel-level a3 f2) (not-refueling a3)
         (at-aircraft a4 c4) (fuel-level a4 f3) (not-refueling a4)
         (at-aircraft a5 c3) (fuel-level a5 f2) (not-refueling a5)
  )
  (:goal (and (at-person p0 c1) (at-person p1 c4) (at-person p2 c3) (at-person p3 c1) (at-person p4 c1) (at-person p5 c3) (at-person p6 c0) (at-person p7 c5) (at-person p8 c1) (at-person p9 c2)))
  (:goal-reward 10000)
  (:metric maximize (reward))
)
