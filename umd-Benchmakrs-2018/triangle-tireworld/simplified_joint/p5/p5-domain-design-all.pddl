(define (domain triangle-tire-design)
  (:requirements :typing :strips :equality :probabilistic-effects :rewards)

  (:types location time)

  (:predicates
	       (vehicle-at ?loc - location)
	       (spare-in ?loc - location)
	       (road ?from - location ?to - location)
	       (not-flattire) (hasspare)
	       (execution)
	       (current-time ?t - time)
	       (next ?t1 - time ?t2 - time)
	       (enabled-safety ?from - location ?to - location)
	       (enabled-shortcut ?from - location ?to - location)
	       (enabled-safety-from ?from - location)
	       (enabled-shortcut-from ?from - location)

	

	       		
  )


  (:action move-car-enabled
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (enabled-shortcut ?from ?to )(not-flattire)(execution))
    :effect (and (vehicle-at ?to) (not (vehicle-at ?from))
		 (probabilistic 0.5 (not (not-flattire))))
  )

   (:action move-car-safely-enabled
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (road ?from ?to) (not-flattire)(execution)(enabled-safety ?from ?to ))
    :effect (and (vehicle-at ?to) (not (vehicle-at ?from))
		 (probabilistic 0.25 (not (not-flattire))))
  )

  (:action move-car
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (road ?from ?to) (not-flattire)(execution))
    :effect (and (vehicle-at ?to) (not (vehicle-at ?from))
		 (probabilistic 0.5 (not (not-flattire))))
  )



  (:action loadtire
    :parameters (?loc - location)
    :precondition (and (vehicle-at ?loc) (spare-in ?loc)(execution))
    :effect (and (hasspare) (not (spare-in ?loc)))
  )
  
  (:action changetire
    :precondition (and(hasspare) (execution))
    :effect (and (not (hasspare)) (not-flattire))
  )
  

  

  (:action design-start-execution
    :parameters ()
    :precondition (and (not(execution)))
    :effect (and (execution))
  )

  (:action idle-design
    :parameters ( ?t - time ?tnext - time )
    :precondition (and (not(execution))(current-time ?t )(next ?t ?tnext))
    :effect (and (current-time ?tnext )(not(current-time ?t)))
  )



  (:action design-add-road
    :parameters (?from - location ?to - location ?inter - location ?t - time ?tnext - time)
    :precondition (and (not(execution))(next ?t ?tnext)(current-time ?t )(road ?from ?to)(road ?from ?inter)(road ?inter ?to))
    :effect (and (enabled-shortcut ?from ?to )(enabled-shortcut-from ?from)(current-time ?tnext )(not (current-time ?t )))
  )

  (:action design-add-road-service
    :parameters (?from - location ?to - location ?t - time ?tnext - time)
    :precondition (and (not(execution))(next ?t ?tnext)(current-time ?t )(road ?from ?to))
    :effect (and (enabled-safety ?from ?to )(enabled-safety-from ?from)(current-time ?tnext )(not (current-time ?t )))
  )
  

	       



)
(define (domain triangle-tire)

  (:requirements :typing :strips :equality :probabilistic-effects :rewards)
  (:types location)
  (:predicates (vehicle-at ?loc - location)
	       (spare-in ?loc - location)
	       (road ?from - location ?to - location)
	       (not-flattire) (hasspare))
  (:action move-car
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (road ?from ?to) (not-flattire))
    :effect (and (vehicle-at ?to) (not (vehicle-at ?from))
		 (probabilistic 0.5 (not (not-flattire)))))
  (:action loadtire
    :parameters (?loc - location)
    :precondition (and (vehicle-at ?loc) (spare-in ?loc))
    :effect (and (hasspare) (not (spare-in ?loc))))
  (:action changetire
    :precondition (hasspare)
    :effect (and (not (hasspare)) (not-flattire)))

)
(define (domain triangle-tire-design-relaxed)
  (:requirements :typing :strips :equality :probabilistic-effects :rewards)

  (:types location time)

  (:predicates
	       (vehicle-at ?loc - location)
	       (spare-in ?loc - location)
	       (road ?from - location ?to - location)
	       (not-flattire) (hasspare)
	       (execution)
	       (current-time ?t - time)
	       (next ?t1 - time ?t2 - time)
	       (enabled-safety ?from - location ?to - location)
	       (enabled-shortcut ?from - location ?to - location)
	       (enabled-safety-from ?from - location)
	       (enabled-shortcut-from ?from - location)

	

	       		
  )


  (:action move-car-enabled
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (enabled-shortcut ?from ?to )(not-flattire)(execution))
    :effect (and (vehicle-at ?to) 
		 (probabilistic 0.5 (not (not-flattire))))
  )

   (:action move-car-safely-enabled
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (road ?from ?to) (not-flattire)(execution)(enabled-safety ?from ?to ))
    :effect (and (vehicle-at ?to) 
		 (probabilistic 0.25 (not (not-flattire))))
  )

  (:action move-car
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (road ?from ?to) (not-flattire)(execution))
    :effect (and (vehicle-at ?to) 
		 (probabilistic 0.5 (not (not-flattire))))
  )



  (:action loadtire
    :parameters (?loc - location)
    :precondition (and (vehicle-at ?loc) (spare-in ?loc)(execution))
    :effect (and (hasspare) )
  )
  
  (:action changetire
    :precondition (and(hasspare) (execution))
    :effect (and (not-flattire))
  )
  

  

  (:action design-start-execution
    :parameters ()
    :precondition (and (not(execution)))
    :effect (and (execution))
  )

  (:action idle-design
    :parameters ( ?t - time ?tnext - time )
    :precondition (and (not(execution))(current-time ?t )(next ?t ?tnext))
    :effect (and (current-time ?tnext )(not(current-time ?t)))
  )

 
  (:action design-add-road
    :parameters (?from - location ?to - location ?inter - location ?t - time ?tnext - time)
    :precondition (and (not(execution))(next ?t ?tnext)(current-time ?t )(road ?from ?to)(road ?from ?inter)(road ?inter ?to))
    :effect (and (enabled-shortcut ?from ?to )(enabled-shortcut-from ?from)(current-time ?tnext )(not (current-time ?t )))
  )

  (:action design-add-road-service
    :parameters (?from - location ?to - location ?t - time ?tnext - time)
    :precondition (and (not(execution))(next ?t ?tnext)(current-time ?t )(road ?from ?to))
    :effect (and (enabled-safety ?from ?to )(enabled-safety-from ?from)(current-time ?tnext )(not (current-time ?t )))
  )
  

	       



)
(define (domain triangle-tire-design-over)
  (:requirements :typing :strips :equality :probabilistic-effects :rewards)

  (:types location time)

  (:predicates
	       (vehicle-at ?loc - location)
	       (spare-in ?loc - location)
	       (road ?from - location ?to - location)
	       (not-flattire) (hasspare)
	       (execution)
	       (current-time ?t - time)
	       (next ?t1 - time ?t2 - time)
	       (enabled-safety ?from - location ?to - location)
	       (enabled-shortcut ?from - location ?to - location)
	       (enabled-safety-from ?from - location)
	       (enabled-shortcut-from ?from - location)

	

	       		
  )



  (:action move-car-enabled
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (enabled-shortcut-from ?from)(not-flattire)(execution))
    :effect (and (vehicle-at ?to) (not (vehicle-at ?from))
		 (probabilistic 0.5 (not (not-flattire))))
  )

   (:action move-car-safely-enabled
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (road ?from ?to) (not-flattire)(execution)(enabled-safety-from ?from))
    :effect (and (vehicle-at ?to) (not (vehicle-at ?from))
		 (probabilistic 0.25 (not (not-flattire))))
  )

  (:action move-car
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (road ?from ?to) (not-flattire)(execution))
    :effect (and (vehicle-at ?to) (not (vehicle-at ?from))
		 (probabilistic 0.5 (not (not-flattire))))
  )



  (:action loadtire
    :parameters (?loc - location)
    :precondition (and (vehicle-at ?loc) (spare-in ?loc)(execution))
    :effect (and (hasspare) (not (spare-in ?loc)))
  )
  
  (:action changetire
    :precondition (and(hasspare) (execution))
    :effect (and (not (hasspare)) (not-flattire))
  )
  

  

  (:action design-start-execution
    :parameters ()
    :precondition (and (not(execution)))
    :effect (and (execution))
  )

  (:action idle-design
    :parameters ( ?t - time ?tnext - time )
    :precondition (and (not(execution))(current-time ?t )(next ?t ?tnext))
    :effect (and (current-time ?tnext )(not(current-time ?t)))
  )

  (:action design-add-road
    :parameters (?from - location ?to - location ?inter - location ?t - time ?tnext - time)
    :precondition (and (not(execution))(next ?t ?tnext)(current-time ?t )(road ?from ?to)(road ?from ?inter)(road ?inter ?to))
    :effect (and (enabled-shortcut ?from ?to )(enabled-shortcut-from ?from)(current-time ?tnext )(not (current-time ?t )))
  )

  (:action design-add-road-service
    :parameters (?from - location ?to - location ?t - time ?tnext - time)
    :precondition (and (not(execution))(next ?t ?tnext)(current-time ?t )(road ?from ?to))
    :effect (and (enabled-safety ?from ?to )(enabled-safety-from ?from)(current-time ?tnext )(not (current-time ?t )))
  )
  

	       



)
(define (domain triangle-tire-design-over-relaxed)
  (:requirements :typing :strips :equality :probabilistic-effects :rewards)

  (:types location time)

  (:predicates
	       (vehicle-at ?loc - location)
	       (spare-in ?loc - location)
	       (road ?from - location ?to - location)
	       (not-flattire) (hasspare)
	       (execution)
	       (current-time ?t - time)
	       (next ?t1 - time ?t2 - time)
	       (enabled-safety ?from - location ?to - location)
	       (enabled-shortcut ?from - location ?to - location)
	       (enabled-safety-from ?from - location)
	       (enabled-shortcut-from ?from - location)

	

	       		
  )


  (:action move-car-enabled
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (enabled-shortcut-from ?from)(not-flattire)(execution))
    :effect (and (vehicle-at ?to) 
		 (probabilistic 0.5 (not (not-flattire))))
  )

   (:action move-car-safely-enabled
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (road ?from ?to) (not-flattire)(execution)(enabled-safety-from ?from))
    :effect (and (vehicle-at ?to) 
		 (probabilistic 0.25 (not (not-flattire))))
  )

  (:action move-car
    :parameters (?from - location ?to - location)
    :precondition (and (vehicle-at ?from) (road ?from ?to) (not-flattire)(execution))
    :effect (and (vehicle-at ?to) 
		 (probabilistic 0.5 (not (not-flattire))))
  )



  (:action loadtire
    :parameters (?loc - location)
    :precondition (and (vehicle-at ?loc) (spare-in ?loc)(execution))
    :effect (and (hasspare) )
  )
  
  (:action changetire
    :precondition (and(hasspare) (execution))
    :effect (and  (not-flattire))
  )
  

  

  (:action design-start-execution
    :parameters ()
    :precondition (and (not(execution)))
    :effect (and (execution))
  )

  (:action idle-design
    :parameters ( ?t - time ?tnext - time )
    :precondition (and (not(execution))(current-time ?t )(next ?t ?tnext))
    :effect (and (current-time ?tnext )(not(current-time ?t)))
  )



  (:action design-add-road
    :parameters (?from - location ?to - location ?inter - location ?t - time ?tnext - time)
    :precondition (and (not(execution))(next ?t ?tnext)(current-time ?t )(road ?from ?to)(road ?from ?inter)(road ?inter ?to))
    :effect (and (enabled-shortcut ?from ?to )(enabled-shortcut-from ?from)(current-time ?tnext )(not (current-time ?t )))
  )

  (:action design-add-road-service
    :parameters (?from - location ?to - location ?t - time ?tnext - time)
    :precondition (and (not(execution))(next ?t ?tnext)(current-time ?t )(road ?from ?to))
    :effect (and (enabled-safety ?from ?to )(enabled-safety-from ?from)(current-time ?tnext )(not (current-time ?t )))
  )
  

	       



)
(define (problem p5)
                   (:domain triangle-tire)
                   (:objects l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5)
                   (:domain triangle-tire)
                   (:objects l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-0-design)
                   (:domain triangle-tire-design)
                   (:objects t1 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-0-design-relaxed)
                   (:domain triangle-tire-design-relaxed)
                   (:objects t1 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-0-design-over)
                   (:domain triangle-tire-design-over)
                   (:objects t1 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-0-design-over-relaxed)
                   (:domain triangle-tire-design-over-relaxed)
                   (:objects t1 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-0-design-tip)
                   (:domain triangle-tire-design)
                   (:objects t1 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-1-design)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-1-design-relaxed)
                   (:domain triangle-tire-design-relaxed)
                   (:objects t1 t2 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-1-design-over)
                   (:domain triangle-tire-design-over)
                   (:objects t1 t2 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-1-design-over-relaxed)
                   (:domain triangle-tire-design-over-relaxed)
                   (:objects t1 t2 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-1-design-tip)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-2-design)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 t3 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-2-design-relaxed)
                   (:domain triangle-tire-design-relaxed)
                   (:objects t1 t2 t3 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-2-design-over)
                   (:domain triangle-tire-design-over)
                   (:objects t1 t2 t3 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-2-design-over-relaxed)
                   (:domain triangle-tire-design-over-relaxed)
                   (:objects t1 t2 t3 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-2-design-tip)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 t3 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-3-design)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 t3 t4 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-3-design-relaxed)
                   (:domain triangle-tire-design-relaxed)
                   (:objects t1 t2 t3 t4 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-3-design-over)
                   (:domain triangle-tire-design-over)
                   (:objects t1 t2 t3 t4 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-3-design-over-relaxed)
                   (:domain triangle-tire-design-over-relaxed)
                   (:objects t1 t2 t3 t4 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-3-design-tip)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 t3 t4 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-4-design)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 t3 t4 t5 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-4-design-relaxed)
                   (:domain triangle-tire-design-relaxed)
                   (:objects t1 t2 t3 t4 t5 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-4-design-over)
                   (:domain triangle-tire-design-over)
                   (:objects t1 t2 t3 t4 t5 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-4-design-over-relaxed)
                   (:domain triangle-tire-design-over-relaxed)
                   (:objects t1 t2 t3 t4 t5 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-4-design-tip)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 t3 t4 t5 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-5-design)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 t3 t4 t5 t6 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-5-design-relaxed)
                   (:domain triangle-tire-design-relaxed)
                   (:objects t1 t2 t3 t4 t5 t6 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-5-design-over)
                   (:domain triangle-tire-design-over)
                   (:objects t1 t2 t3 t4 t5 t6 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-5-design-over-relaxed)
                   (:domain triangle-tire-design-over-relaxed)
                   (:objects t1 t2 t3 t4 t5 t6 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-5-design-tip)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 t3 t4 t5 t6 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-6-design)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 t3 t4 t5 t6 t7 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)(next t6 t7)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-6-design-relaxed)
                   (:domain triangle-tire-design-relaxed)
                   (:objects t1 t2 t3 t4 t5 t6 t7 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)(next t6 t7)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-6-design-over)
                   (:domain triangle-tire-design-over)
                   (:objects t1 t2 t3 t4 t5 t6 t7 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)(next t6 t7)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-6-design-over-relaxed)
                   (:domain triangle-tire-design-over-relaxed)
                   (:objects t1 t2 t3 t4 t5 t6 t7 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)(next t6 t7)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

(define (problem p5-6-design-tip)
                   (:domain triangle-tire-design)
                   (:objects t1 t2 t3 t4 t5 t6 t7 - time
 l-1-1 l-1-2 l-1-3 l-1-4 l-1-5 l-2-1 l-2-2 l-2-3 l-2-4 l-2-5 l-3-1 l-3-2 l-3-3 l-3-4 l-3-5 l-4-1 l-4-2 l-4-3 l-4-4 l-4-5 l-5-1 l-5-2 l-5-3 l-5-4 l-5-5 - location)
                   (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)(next t4 t5)(next t5 t6)(next t6 t7)
 (vehicle-at l-2-3)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-3 l-1-4)(road l-1-4 l-1-5)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-1-3 l-2-3)(road l-1-4 l-2-4)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(road l-2-3 l-1-4)(road l-2-4 l-1-5)(spare-in l-2-1)(spare-in l-2-2)(spare-in l-2-3)(spare-in l-2-4)(road l-3-1 l-3-2)(road l-3-2 l-3-3)(road l-2-1 l-3-1)(road l-2-3 l-3-3)(road l-3-1 l-2-2)(road l-3-3 l-2-4)(spare-in l-3-1)(spare-in l-3-3)(road l-3-1 l-4-1)(road l-3-2 l-4-2)(road l-4-1 l-3-2)(road l-4-2 l-3-3)(spare-in l-4-2)(road l-4-1 l-5-1)(road l-5-1 l-4-2)(spare-in l-5-1)(not-flattire))
                   (:goal (vehicle-at l-1-5)) (:goal-reward 100) (:metric maximize (reward)))

