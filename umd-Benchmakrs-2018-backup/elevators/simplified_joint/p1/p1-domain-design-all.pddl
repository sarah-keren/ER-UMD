(define (domain elevators-design)
  (:requirements :probabilistic-effects :conditional-effects :negative-preconditions :equality :typing)
  (:types elevator floor pos coin)
  (:constants f1 - floor p1 - pos)
  (:predicates (dec_f ?f ?g - floor) (dec_p ?p ?q - pos) (in ?e - elevator ?f - floor) (at ?f - floor ?p - pos) (shaft ?e - elevator ?p - pos) (inside ?e - elevator) (gate ?f - floor ?p - pos) (coin-at ?c - coin ?f - floor ?p - pos) (have ?c - coin)
(execution)
(current-time ?t - time)
(next ?t1 - time ?t2 - time)	
(enabled-safety-move ?f - floor ?p - pos ?np - pos)
(enabled-add-shaft ?e - elevator ?p - pos)
(add-shaft ?e - elevator)
(safety-move ?f - floor)
)

 

  (:action go-up
    :parameters (?e - elevator ?f ?nf - floor)
    :precondition (and (dec_f ?nf ?f) (in ?e ?f)(execution))
    :effect (and (in ?e ?nf) (not (in ?e ?f)))
  )
  (:action go-down
    :parameters (?e - elevator ?f ?nf - floor)
    :precondition (and (dec_f ?f ?nf) (in ?e ?f)(execution))
    :effect (and (in ?e ?nf) (not (in ?e ?f)))
  )
  (:action step-in
    :parameters (?e - elevator ?f - floor ?p - pos)
    :precondition (and (at ?f ?p) (in ?e ?f) (shaft ?e ?p)(execution))
    :effect (and (inside ?e) (not (at ?f ?p)))
  )
  (:action step-out
    :parameters (?e - elevator ?f - floor ?p - pos)
    :precondition (and (inside ?e) (in ?e ?f) (shaft ?e ?p)(execution))
    :effect (and (at ?f ?p) (not (inside ?e)))
  )
  (:action move-left
    :parameters (?f - floor ?p ?np - pos)
    :precondition (and (at ?f ?p) (dec_p ?p ?np)(execution))
    :effect (probabilistic 0.7 (and (not (at ?f ?p)) (at ?f ?np))
                           0.3 (and (when (gate ?f ?p) (and (at f1 p1)(not (at ?f ?p))))))
  )
  (:action move-right
    :parameters (?f - floor ?p ?np - pos)
    :precondition (and (at ?f ?p) (dec_p ?np ?p)(execution))
    :effect (probabilistic 0.7 (and (not (at ?f ?p)) (at ?f ?np))
                           0.3 (and (when (gate ?f ?p) (and (at f1 p1)(not (at ?f ?p))))))
  )



  (:action collect
    :parameters (?c - coin ?f - floor ?p - pos)
    :precondition (and (coin-at ?c ?f ?p) (at ?f ?p)(execution))
    :effect (and (have ?c) (not (coin-at ?c ?f ?p)))
  )





)
(define (domain elevators)
  (:requirements :probabilistic-effects :conditional-effects :negative-preconditions :equality :typing)
  (:types elevator floor pos coin)
  (:constants f1 - floor p1 - pos)
  (:predicates (dec_f ?f ?g - floor) (dec_p ?p ?q - pos) (in ?e - elevator ?f - floor) (at ?f - floor ?p - pos) (shaft ?e - elevator ?p - pos) (inside ?e - elevator) (gate ?f - floor ?p - pos) (coin-at ?c - coin ?f - floor ?p - pos) (have ?c - coin))
  (:action go-up
    :parameters (?e - elevator ?f ?nf - floor)
    :precondition (and (dec_f ?nf ?f) (in ?e ?f))
    :effect (and (in ?e ?nf) (not (in ?e ?f)))
  )
  (:action go-down
    :parameters (?e - elevator ?f ?nf - floor)
    :precondition (and (dec_f ?f ?nf) (in ?e ?f))
    :effect (and (in ?e ?nf) (not (in ?e ?f)))
  )
  (:action step-in
    :parameters (?e - elevator ?f - floor ?p - pos)
    :precondition (and (at ?f ?p) (in ?e ?f) (shaft ?e ?p))
    :effect (and (inside ?e) (not (at ?f ?p)))
  )
  (:action step-out
    :parameters (?e - elevator ?f - floor ?p - pos)
    :precondition (and (inside ?e) (in ?e ?f) (shaft ?e ?p))
    :effect (and (at ?f ?p) (not (inside ?e)))
  )
  (:action move-left
    :parameters (?f - floor ?p ?np - pos)
    :precondition (and (at ?f ?p) (dec_p ?p ?np))
    :effect (probabilistic 0.7 (and (not (at ?f ?p)) (at ?f ?np))
                           0.3 (and (when (gate ?f ?p) (and (at f1 p1)(not (at ?f ?p))))))
  )
  (:action move-right
    :parameters (?f - floor ?p ?np - pos)
    :precondition (and (at ?f ?p) (dec_p ?np ?p))
    :effect (probabilistic 0.7 (and (not (at ?f ?p)) (at ?f ?np))
                           0.3 (and (when (gate ?f ?p) (and (at f1 p1)(not (at ?f ?p))))))
  )
  (:action collect
    :parameters (?c - coin ?f - floor ?p - pos)
    :precondition (and (coin-at ?c ?f ?p) (at ?f ?p))
    :effect (and (have ?c) (not (coin-at ?c ?f ?p)))
  )
)
(define (domain elevators-design-relaxed)
  (:requirements :probabilistic-effects :conditional-effects :negative-preconditions :equality :typing)
  (:types elevator floor pos coin)
  (:constants f1 - floor p1 - pos)
  (:predicates (dec_f ?f ?g - floor) (dec_p ?p ?q - pos) (in ?e - elevator ?f - floor) (at ?f - floor ?p - pos) (shaft ?e - elevator ?p - pos) (inside ?e - elevator) (gate ?f - floor ?p - pos) (coin-at ?c - coin ?f - floor ?p - pos) (have ?c - coin)
(execution)
(current-time ?t - time)
(next ?t1 - time ?t2 - time)	
(enabled-safety-move ?f - floor ?p - pos ?np - pos)
(enabled-add-shaft ?e - elevator ?p - pos)
(add-shaft ?e - elevator)
(safety-move ?f - floor)
)


  (:action go-up
    :parameters (?e - elevator ?f ?nf - floor)
    :precondition (and (dec_f ?nf ?f) (in ?e ?f)(execution))
    :effect (and (in ?e ?nf) (not (in ?e ?f)))
  )
  (:action go-down
    :parameters (?e - elevator ?f ?nf - floor)
    :precondition (and (dec_f ?f ?nf) (in ?e ?f)(execution))
    :effect (and (in ?e ?nf) (not (in ?e ?f)))
  )
  (:action step-in
    :parameters (?e - elevator ?f - floor ?p - pos)
    :precondition (and (at ?f ?p) (in ?e ?f) (shaft ?e ?p)(execution))
    :effect (and (inside ?e) (not (at ?f ?p)))
  )
  (:action step-out
    :parameters (?e - elevator ?f - floor ?p - pos)
    :precondition (and (inside ?e) (in ?e ?f) (shaft ?e ?p)(execution))
    :effect (and (at ?f ?p) (not (inside ?e)))
  )
  (:action move-left
    :parameters (?f - floor ?p ?np - pos)
    :precondition (and (at ?f ?p) (dec_p ?p ?np)(execution))
    :effect (probabilistic 0.7 (and (not (at ?f ?p)) (at ?f ?np))
                           0.3 (and (when (gate ?f ?p) (and (at f1 p1)(not (at ?f ?p))))))
  )
  (:action move-right
    :parameters (?f - floor ?p ?np - pos)
    :precondition (and (at ?f ?p) (dec_p ?np ?p)(execution))
    :effect (probabilistic 0.7 (and (not (at ?f ?p)) (at ?f ?np))
                           0.3 (and (when (gate ?f ?p) (and (at f1 p1)(not (at ?f ?p))))))
  )



  (:action collect
    :parameters (?c - coin ?f - floor ?p - pos)
    :precondition (and (coin-at ?c ?f ?p) (at ?f ?p)(execution))
    :effect (and (have ?c) (not (coin-at ?c ?f ?p)))
  )





)
(define (domain elevators-design-over)
  (:requirements :probabilistic-effects :conditional-effects :negative-preconditions :equality :typing)
  (:types elevator floor pos coin)
  (:constants f1 - floor p1 - pos)
  (:predicates (dec_f ?f ?g - floor) (dec_p ?p ?q - pos) (in ?e - elevator ?f - floor) (at ?f - floor ?p - pos) (shaft ?e - elevator ?p - pos) (inside ?e - elevator) (gate ?f - floor ?p - pos) (coin-at ?c - coin ?f - floor ?p - pos) (have ?c - coin)
(execution)
(current-time ?t - time)
(next ?t1 - time ?t2 - time)	
(enabled-safety-move ?f - floor ?p - pos ?np - pos)
(enabled-add-shaft ?e - elevator ?p - pos)
(add-shaft ?e - elevator)
(safety-move ?f - floor)
)

  

  (:action go-up
    :parameters (?e - elevator ?f ?nf - floor)
    :precondition (and (dec_f ?nf ?f) (in ?e ?f)(execution))
    :effect (and (in ?e ?nf) (not (in ?e ?f)))
  )
  (:action go-down
    :parameters (?e - elevator ?f ?nf - floor)
    :precondition (and (dec_f ?f ?nf) (in ?e ?f)(execution))
    :effect (and (in ?e ?nf) (not (in ?e ?f)))
  )
  (:action step-in
    :parameters (?e - elevator ?f - floor ?p - pos)
    :precondition (and (at ?f ?p) (in ?e ?f) (shaft ?e ?p)(execution))
    :effect (and (inside ?e) (not (at ?f ?p)))
  )
  (:action step-out
    :parameters (?e - elevator ?f - floor ?p - pos)
    :precondition (and (inside ?e) (in ?e ?f) (shaft ?e ?p)(execution))
    :effect (and (at ?f ?p) (not (inside ?e)))
  )
  (:action move-left
    :parameters (?f - floor ?p ?np - pos)
    :precondition (and (at ?f ?p) (dec_p ?p ?np)(execution))
    :effect (probabilistic 0.7 (and (not (at ?f ?p)) (at ?f ?np))
                           0.3 (and (when (gate ?f ?p) (and (at f1 p1)(not (at ?f ?p))))))
  )
  (:action move-right
    :parameters (?f - floor ?p ?np - pos)
    :precondition (and (at ?f ?p) (dec_p ?np ?p)(execution))
    :effect (probabilistic 0.7 (and (not (at ?f ?p)) (at ?f ?np))
                           0.3 (and (when (gate ?f ?p) (and (at f1 p1)(not (at ?f ?p))))))
  )



  (:action collect
    :parameters (?c - coin ?f - floor ?p - pos)
    :precondition (and (coin-at ?c ?f ?p) (at ?f ?p)(execution))
    :effect (and (have ?c) (not (coin-at ?c ?f ?p)))
  )






)
(define (domain elevators-design-over-relaxed)
  (:requirements :probabilistic-effects :conditional-effects :negative-preconditions :equality :typing)
  (:types elevator floor pos coin)
  (:constants f1 - floor p1 - pos)
  (:predicates (dec_f ?f ?g - floor) (dec_p ?p ?q - pos) (in ?e - elevator ?f - floor) (at ?f - floor ?p - pos) (shaft ?e - elevator ?p - pos) (inside ?e - elevator) (gate ?f - floor ?p - pos) (coin-at ?c - coin ?f - floor ?p - pos) (have ?c - coin)
(execution)
(current-time ?t - time)
(next ?t1 - time ?t2 - time)	
(enabled-safety-move ?f - floor ?p - pos ?np - pos)
(enabled-add-shaft ?e - elevator ?p - pos)
(add-shaft ?e - elevator)
(safety-move ?f - floor)
)

  

  (:action go-up
    :parameters (?e - elevator ?f ?nf - floor)
    :precondition (and (dec_f ?nf ?f) (in ?e ?f)(execution))
    :effect (and (in ?e ?nf) (not (in ?e ?f)))
  )
  (:action go-down
    :parameters (?e - elevator ?f ?nf - floor)
    :precondition (and (dec_f ?f ?nf) (in ?e ?f)(execution))
    :effect (and (in ?e ?nf) (not (in ?e ?f)))
  )
  (:action step-in
    :parameters (?e - elevator ?f - floor ?p - pos)
    :precondition (and (at ?f ?p) (in ?e ?f) (shaft ?e ?p)(execution))
    :effect (and (inside ?e) (not (at ?f ?p)))
  )
  (:action step-out
    :parameters (?e - elevator ?f - floor ?p - pos)
    :precondition (and (inside ?e) (in ?e ?f) (shaft ?e ?p)(execution))
    :effect (and (at ?f ?p) (not (inside ?e)))
  )
  (:action move-left
    :parameters (?f - floor ?p ?np - pos)
    :precondition (and (at ?f ?p) (dec_p ?p ?np)(execution))
    :effect (probabilistic 0.7 (and (not (at ?f ?p)) (at ?f ?np))
                           0.3 (and (when (gate ?f ?p) (and (at f1 p1)(not (at ?f ?p))))))
  )
  (:action move-right
    :parameters (?f - floor ?p ?np - pos)
    :precondition (and (at ?f ?p) (dec_p ?np ?p)(execution))
    :effect (probabilistic 0.7 (and (not (at ?f ?p)) (at ?f ?np))
                           0.3 (and (when (gate ?f ?p) (and (at f1 p1)(not (at ?f ?p))))))
  )



  (:action collect
    :parameters (?c - coin ?f - floor ?p - pos)
    :precondition (and (coin-at ?c ?f ?p) (at ?f ?p)(execution))
    :effect (and (have ?c) (not (coin-at ?c ?f ?p)))
  )




)
(define (problem p1)
  (:domain elevators)
  (:objects f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (have c1)(have c2)(have c3) ))
)
(define (problem p1-0-design)
  (:domain elevators-design)
  (:objects t1 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t1)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-0-design-relaxed)
  (:domain elevators-design-relaxed)
  (:objects t1 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t1)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-0-design-over)
  (:domain elevators-design-over)
  (:objects t1 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t1)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-0-design-over-relaxed)
  (:domain elevators-design-over-relaxed)
  (:objects t1 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t1)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-1-design)
  (:domain elevators-design)
  (:objects t1 t2 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t2)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-1-design-relaxed)
  (:domain elevators-design-relaxed)
  (:objects t1 t2 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t2)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-1-design-over)
  (:domain elevators-design-over)
  (:objects t1 t2 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t2)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-1-design-over-relaxed)
  (:domain elevators-design-over-relaxed)
  (:objects t1 t2 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t2)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-2-design)
  (:domain elevators-design)
  (:objects t1 t2 t3 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t3)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-2-design-relaxed)
  (:domain elevators-design-relaxed)
  (:objects t1 t2 t3 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t3)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-2-design-over)
  (:domain elevators-design-over)
  (:objects t1 t2 t3 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t3)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-2-design-over-relaxed)
  (:domain elevators-design-over-relaxed)
  (:objects t1 t2 t3 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t3)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-3-design)
  (:domain elevators-design)
  (:objects t1 t2 t3 t4 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t4)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-3-design-relaxed)
  (:domain elevators-design-relaxed)
  (:objects t1 t2 t3 t4 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t4)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-3-design-over)
  (:domain elevators-design-over)
  (:objects t1 t2 t3 t4 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t4)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-3-design-over-relaxed)
  (:domain elevators-design-over-relaxed)
  (:objects t1 t2 t3 t4 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t4)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-4-design)
  (:domain elevators-design)
  (:objects t1 t2 t3 t4 t5 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t5)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-4-design-relaxed)
  (:domain elevators-design-relaxed)
  (:objects t1 t2 t3 t4 t5 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t5)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-4-design-over)
  (:domain elevators-design-over)
  (:objects t1 t2 t3 t4 t5 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t5)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-4-design-over-relaxed)
  (:domain elevators-design-over-relaxed)
  (:objects t1 t2 t3 t4 t5 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t5)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-5-design)
  (:domain elevators-design)
  (:objects t1 t2 t3 t4 t5 t6 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t6)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-5-design-relaxed)
  (:domain elevators-design-relaxed)
  (:objects t1 t2 t3 t4 t5 t6 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t6)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-5-design-over)
  (:domain elevators-design-over)
  (:objects t1 t2 t3 t4 t5 t6 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t6)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-5-design-over-relaxed)
  (:domain elevators-design-over-relaxed)
  (:objects t1 t2 t3 t4 t5 t6 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t6)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-6-design)
  (:domain elevators-design)
  (:objects t1 t2 t3 t4 t5 t6 t7 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)(next t6 t7)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t7)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-6-design-relaxed)
  (:domain elevators-design-relaxed)
  (:objects t1 t2 t3 t4 t5 t6 t7 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)(next t6 t7)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t7)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-6-design-over)
  (:domain elevators-design-over)
  (:objects t1 t2 t3 t4 t5 t6 t7 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)(next t6 t7)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t7)(and (have c1)(have c2)(have c3) ))
)
(define (problem p1-6-design-over-relaxed)
  (:domain elevators-design-over-relaxed)
  (:objects t1 t2 t3 t4 t5 t6 t7 - time
 f1 f2 f3 - floor p1 p2 p3 p4 - pos e1 e2 - elevator c1 c2 c3 - coin)
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)(next t6 t7)
 (at f1 p1) (dec_f f2 f1) (dec_f f3 f2) (dec_p p2 p1) (dec_p p3 p2) (dec_p p4 p3) (shaft e1 p1) (in e1 f1) (shaft e2 p1) (in e2 f2) (coin-at c1 f2 p1) (coin-at c2 f3 p1) (coin-at c3 f1 p3) (gate f2 p4) (gate f3 p2))
  (:goal (and (current-time t7)(and (have c1)(have c2)(have c3) ))
)
