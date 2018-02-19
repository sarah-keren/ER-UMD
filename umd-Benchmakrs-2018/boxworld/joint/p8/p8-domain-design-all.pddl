;; Generated by boxworld generator
;; http://www.cs.rutgers.edu/~jasmuth/boxworld.tar.gz
;; by John Asmuth (jasmuth@cs.rutgers.edu)

(define (domain boxworld)
 (:requirements :typing :equality :disjunctive-preconditions
                :probabilistic-effects :existential-preconditions
                :conditional-effects :negative-preconditions
                :universal-preconditions :rewards)
 (:types city box truck plane)
 (:predicates (box-at-city ?b - box ?c - city)
              (truck-at-city ?t - truck ?c - city)
              (box-on-truck ?b - box ?t - truck)
              (plane-at-city ?p - plane ?c - city)
              (box-on-plane ?b - box ?p - plane)
              (destination ?b - box ?dst - city)
              (can-drive ?src - city ?dst - city)
              (wrong-drive1 ?src - city ?wrongdst - city)
              (wrong-drive2 ?src - city ?wrongdst - city)
              (can-fly ?src - city ?dst - city)

)
 (:action load-box-on-truck-in-city
  :parameters (?b - box ?t - truck ?c - city)
  :effect (when (and (box-at-city ?b ?c)
                               (not (destination ?b ?c))
                               (truck-at-city ?t ?c)
                          )
(and (box-on-truck ?b ?t)
               (not (box-at-city ?b ?c))
                )
          )
 )
 (:action unload-box-from-truck-in-city
  :parameters (?b - box ?t - truck ?c - city)
  :effect (when (and (box-on-truck ?b ?t)
                               (truck-at-city ?t ?c)
                          )
                (and (box-at-city ?b ?c)
               (not (box-on-truck ?b ?t))
                )
          )
 )
 (:action load-box-on-plane-in-city
  :parameters (?b - box ?p - plane ?c - city)
  :effect (when (and (box-at-city ?b ?c)
                     (not (destination ?b ?c))
                     (plane-at-city ?p ?c)
                )
                (and (box-on-plane ?b ?p)
               (not (box-at-city ?b ?c))
                )
          )
 )
 (:action unload-box-from-plane-in-city
  :parameters (?b - box ?p - plane ?c - city)
  :effect (when (and (box-on-plane ?b ?p)
                     (plane-at-city ?p ?c)
                )
                (and (box-at-city ?b ?c)
               (not (box-on-plane ?b ?p))
                )
          )
 )
 (:action drive-truck
  :parameters (?t - truck ?src - city ?dst - city)
  :effect (when (and (truck-at-city ?t ?src)
                     (can-drive ?src ?dst)
                )
          (and (not (truck-at-city ?t ?src))
               (probabilistic
                0.2 (forall (?wrongdst1 - city)
                    (when (wrong-drive1 ?src ?wrongdst1)
                    (forall (?wrongdst2 - city)
                    (when (wrong-drive2 ?src ?wrongdst2)
                     (probabilistic
                      1/2 (truck-at-city ?t ?wrongdst1)
                      1/2 (truck-at-city ?t ?wrongdst2)                      
                     )
                    ))))
                0.8 (truck-at-city ?t ?dst)
               )
          )
          )
 )
 (:action fly-plane
  :parameters (?p - plane ?src - city ?dst - city)
  :effect (when (and (plane-at-city ?p ?src)
                     (can-fly ?src ?dst)
                )
(and (not (plane-at-city ?p ?src))
               (plane-at-city ?p ?dst)
          )
 )
 )
)
;; Generated by boxworld generator
;; http://www.cs.rutgers.edu/~jasmuth/boxworld.tar.gz
;; by John Asmuth (jasmuth@cs.rutgers.edu)

(define (domain boxworld-design)
 (:requirements :typing :equality :disjunctive-preconditions
                :probabilistic-effects :existential-preconditions
                :conditional-effects :negative-preconditions
                :universal-preconditions :rewards)
 (:types city box truck plane time)
 (:predicates (box-at-city ?b - box ?c - city)
              (truck-at-city ?t - truck ?c - city)
              (box-on-truck ?b - box ?t - truck)
              (plane-at-city ?p - plane ?c - city)
              (box-on-plane ?b - box ?p - plane)
              (destination ?b - box ?dst - city)
              (can-drive ?src - city ?dst - city)
              (wrong-drive1 ?src - city ?wrongdst - city)
              (wrong-drive2 ?src - city ?wrongdst - city)
              (can-fly ?src - city ?dst - city)
	      (enabled-safety-drive ?t - truck ?src - city ?dst - city)
	      (execution)
	      (current-time ?t1 - time)
	      (next ?t1 - time ?t2 - time)	


)
 (:action load-box-on-truck-in-city
  :parameters (?b - box ?t - truck ?c - city)
  :precondition (and (execution))
  :effect (when (and (box-at-city ?b ?c)
                               (not (destination ?b ?c))
                               (truck-at-city ?t ?c)
                          )
(and (box-on-truck ?b ?t)
               (not (box-at-city ?b ?c))
                )
          )
 )
 (:action unload-box-from-truck-in-city
  :parameters (?b - box ?t - truck ?c - city)
  :precondition (and (execution))
  :effect (when (and (box-on-truck ?b ?t)
                               (truck-at-city ?t ?c)
                          )
                (and (box-at-city ?b ?c)
               (not (box-on-truck ?b ?t))
                )
          )
 )
 (:action load-box-on-plane-in-city
  :parameters (?b - box ?p - plane ?c - city)
  :precondition (and (execution))
  :effect (when (and (box-at-city ?b ?c)
                     (not (destination ?b ?c))
                     (plane-at-city ?p ?c)
                )
                (and (box-on-plane ?b ?p)
               (not (box-at-city ?b ?c))
                )
          )
 )
 (:action unload-box-from-plane-in-city
  :parameters (?b - box ?p - plane ?c - city)
  :precondition (and (execution))
  :effect (when (and (box-on-plane ?b ?p)
                     (plane-at-city ?p ?c)
                )
                (and (box-at-city ?b ?c)
               (not (box-on-plane ?b ?p))
                )
          )
 )
 (:action drive-truck
  :parameters (?t - truck ?src - city ?dst - city)
  :precondition (and (execution))
  :effect (when (and (truck-at-city ?t ?src)
                     (can-drive ?src ?dst)
                )
          (and (not (truck-at-city ?t ?src))
               (probabilistic
                0.2 (forall (?wrongdst1 - city)
                    (when (wrong-drive1 ?src ?wrongdst1)
                    (forall (?wrongdst2 - city)
                    (when (wrong-drive2 ?src ?wrongdst2)
                     (probabilistic
                      0.5 (truck-at-city ?t ?wrongdst1)
                      0.5 (truck-at-city ?t ?wrongdst2)                      
                     )
                    ))))
                0.8 (truck-at-city ?t ?dst)
               )
          )
          )
 )

(:action drive-truck-safly-moderate
  :parameters (?t - truck ?src - city ?dst - city)
  :precondition (and (truck-at-city ?t ?src)(enabled-safety-drive ?t ?src ?dst) (execution))
  :effect (and (not (truck-at-city ?t ?src))
               (probabilistic
                0.1 (forall (?wrongdst1 - city)
                    (when (wrong-drive1 ?src ?wrongdst1)
                    (forall (?wrongdst2 - city)
                    (when (wrong-drive2 ?src ?wrongdst2)
                     (probabilistic
                      0.5 (truck-at-city ?t ?wrongdst1)
                      0.5 (truck-at-city ?t ?wrongdst2)                      
                     )
                    ))))
                0.9 (truck-at-city ?t ?dst)
               )
          )
          
 )

 
 (:action fly-plane
  :parameters (?p - plane ?src - city ?dst - city)
  :precondition (and (execution))
  :effect (when (and (plane-at-city ?p ?src)
                     (can-fly ?src ?dst)
                )
(and (not (plane-at-city ?p ?src))
               (plane-at-city ?p ?dst)
          )
 )
 )


 (:action design-start-execution
    :parameters ()
    :precondition (and (not(execution)))
    :effect (and (execution))
  )


 (:action design-reduce-uncertainty-drive
    :parameters (?t - truck ?src - city ?dst - city ?t1 - time ?tnext - time)
    :precondition (and (not(execution))(next ?t1 ?tnext)(current-time ?t1 ))
    :effect (and (enabled-safety-drive ?t ?src ?dst)(current-time ?tnext )(not (current-time ?t1 )))
  )

  (:action design-truck-location
    :parameters (?t - truck ?src - city ?dst - city ?t1 - time ?tnext - time)
    :precondition (and (not(execution))(next ?t1 ?tnext)(current-time ?t1 )(truck-at-city ?t ?src))
    :effect (and (current-time ?tnext )(not (current-time ?t1 ))(truck-at-city ?t ?dst))
  )



)

;; Relaxation by removing delete effects
;; Relaxation by increasing success probability

(define (domain boxworld-design-relaxed)
 (:requirements :typing :equality :disjunctive-preconditions
                :probabilistic-effects :existential-preconditions
                :conditional-effects :negative-preconditions
                :universal-preconditions :rewards)
 (:types city box truck plane time)
 (:predicates (box-at-city ?b - box ?c - city)
              (truck-at-city ?t - truck ?c - city)
              (box-on-truck ?b - box ?t - truck)
              (plane-at-city ?p - plane ?c - city)
              (box-on-plane ?b - box ?p - plane)
              (destination ?b - box ?dst - city)
              (can-drive ?src - city ?dst - city)
              (wrong-drive1 ?src - city ?wrongdst - city)
              (wrong-drive2 ?src - city ?wrongdst - city)
              (can-fly ?src - city ?dst - city)
	      (enabled-safety-drive ?t - truck ?src - city ?dst - city)
	      (execution)
	      (current-time ?t1 - time)
	      (next ?t1 - time ?t2 - time)	


)
 (:action load-box-on-truck-in-city
  :parameters (?b - box ?t - truck ?c - city)
  :precondition (and (execution))
  :effect (when (and (box-at-city ?b ?c)
                               (not (destination ?b ?c))
                               (truck-at-city ?t ?c)
                          )
(and (box-on-truck ?b ?t)

                )
          )
 )
 (:action unload-box-from-truck-in-city
  :parameters (?b - box ?t - truck ?c - city)
  :precondition (and (execution))
  :effect (when (and (box-on-truck ?b ?t)
                               (truck-at-city ?t ?c)
                          )
                (and (box-at-city ?b ?c)
               
                )
          )
 )
 (:action load-box-on-plane-in-city
  :parameters (?b - box ?p - plane ?c - city)
  :precondition (and (execution))
  :effect (when (and (box-at-city ?b ?c)
                     (not (destination ?b ?c))
                     (plane-at-city ?p ?c)
                )
                (and (box-on-plane ?b ?p)

                )
          )
 )
 (:action unload-box-from-plane-in-city
  :parameters (?b - box ?p - plane ?c - city)
  :precondition (and (execution))
  :effect (when (and (box-on-plane ?b ?p)
                     (plane-at-city ?p ?c)
                )
                (and (box-at-city ?b ?c)
                )
          )
 )
 (:action drive-truck
  :parameters (?t - truck ?src - city ?dst - city)
  :precondition (and (execution))
  :effect (when (and (truck-at-city ?t ?src)
                     (can-drive ?src ?dst)
                )
          (and (not (truck-at-city ?t ?src))
               (probabilistic
                0.2 (forall (?wrongdst1 - city)
                    (when (wrong-drive1 ?src ?wrongdst1)
                    (forall (?wrongdst2 - city)
                    (when (wrong-drive2 ?src ?wrongdst2)
                     (probabilistic
                      0.5 (truck-at-city ?t ?wrongdst1)
                      0.5 (truck-at-city ?t ?wrongdst2)                      
                     )
                    ))))
                0.8 (truck-at-city ?t ?dst)
               )
          )
          )
 )

(:action drive-truck-safly-moderate
  :parameters (?t - truck ?src - city ?dst - city)
  :precondition (and (truck-at-city ?t ?src)(enabled-safety-drive ?t ?src ?dst) (execution))
  :effect (and (not (truck-at-city ?t ?src))
               (probabilistic
                0.01 (forall (?wrongdst1 - city)
                    (when (wrong-drive1 ?src ?wrongdst1)
                    (forall (?wrongdst2 - city)
                    (when (wrong-drive2 ?src ?wrongdst2)
                     (probabilistic
                      0.5 (truck-at-city ?t ?wrongdst1)
                      0.5 (truck-at-city ?t ?wrongdst2)                      
                     )
                    ))))
                0.99 (truck-at-city ?t ?dst)
               )
          )
          
 )

 
 (:action fly-plane
  :parameters (?p - plane ?src - city ?dst - city)
  :precondition (and (execution))
  :effect (when (and (plane-at-city ?p ?src)
                     (can-fly ?src ?dst)
                )
(and (plane-at-city ?p ?dst)
          )
 )
 )


 (:action design-start-execution
    :parameters ()
    :precondition (and (not(execution)))
    :effect (and (execution))
  )


 (:action design-reduce-uncertainty-drive
    :parameters (?t - truck ?src - city ?dst - city ?t1 - time ?tnext - time)
    :precondition (and (not(execution))(next ?t1 ?tnext)(current-time ?t1 ))
    :effect (and (enabled-safety-drive ?t ?src ?dst)(current-time ?tnext )(not (current-time ?t1 )))
  )

  (:action design-truck-location
    :parameters (?t - truck ?src - city ?dst - city ?t1 - time ?tnext - time)
    :precondition (and (not(execution))(next ?t1 ?tnext)(current-time ?t1 )(truck-at-city ?t ?src))
    :effect (and (current-time ?tnext )(not (current-time ?t1 ))(truck-at-city ?t ?dst))
  )



)

(define
 (problem p8)
  (:domain boxworld)
  (:objects box0 - box
            box1 - box
            truck0 - truck
            plane0 - plane
            plane1 - plane
            city0 - city
            city1 - city
            city2 - city
            city3 - city
  )
  (:init (box-at-city box0 city1)
         (destination box0 city2)
         (box-at-city box1 city2)
         (destination box1 city0)
         (truck-at-city truck0 city0)
         (plane-at-city plane0 city0)
         (plane-at-city plane1 city1)
         (can-drive city0 city1)
         (can-drive city0 city2)
         (can-drive city0 city3)
         (wrong-drive1 city0 city1)
         (wrong-drive2 city0 city2)
         (can-fly city0 city1)
         (can-drive city1 city0)
         (can-drive city1 city2)
         (can-drive city1 city3)
         (wrong-drive1 city1 city0)
         (wrong-drive2 city1 city2)
         (can-fly city1 city0)
         (can-drive city2 city0)
         (can-drive city2 city1)
         (can-drive city2 city3)
         (wrong-drive1 city2 city0)
         (wrong-drive2 city2 city1)
         (can-drive city3 city0)
         (can-drive city3 city1)
         (can-drive city3 city2)
         (wrong-drive1 city3 city0)
         (wrong-drive2 city3 city1)
  )
  (:goal (forall (?b - box)
                 (exists (?c - city)
                         (and (destination ?b ?c)
                              (box-at-city ?b ?c)
                         )
                 )
         )
  )
  (:goal-reward 1)
  (:metric maximize (reward))
)
(define
 (problem p8_design_0_relaxed)
  (:domain boxworld-design-relaxed)
  (:objects t1 - time
 box0 - box
            box1 - box
            truck0 - truck
            plane0 - plane
            plane1 - plane
            city0 - city
            city1 - city
            city2 - city
            city3 - city
  )
  (:init (current-time t1)
 (box-at-city box0 city1)
         (destination box0 city2)
         (box-at-city box1 city2)
         (destination box1 city0)
         (truck-at-city truck0 city0)
         (plane-at-city plane0 city0)
         (plane-at-city plane1 city1)
         (can-drive city0 city1)
         (can-drive city0 city2)
         (can-drive city0 city3)
         (wrong-drive1 city0 city1)
         (wrong-drive2 city0 city2)
         (can-fly city0 city1)
         (can-drive city1 city0)
         (can-drive city1 city2)
         (can-drive city1 city3)
         (wrong-drive1 city1 city0)
         (wrong-drive2 city1 city2)
         (can-fly city1 city0)
         (can-drive city2 city0)
         (can-drive city2 city1)
         (can-drive city2 city3)
         (wrong-drive1 city2 city0)
         (wrong-drive2 city2 city1)
         (can-drive city3 city0)
         (can-drive city3 city1)
         (can-drive city3 city2)
         (wrong-drive1 city3 city0)
         (wrong-drive2 city3 city1)
  )
  (:goal (forall (?b - box)
                 (exists (?c - city)
                         (and (destination ?b ?c)
                              (box-at-city ?b ?c)
                         )
                 )
         )
  )
  (:goal-reward 1)
  (:metric maximize (reward))
)
(define
 (problem p8_design_0)
  (:domain boxworld-design)
  (:objects t1 - time
 box0 - box
            box1 - box
            truck0 - truck
            plane0 - plane
            plane1 - plane
            city0 - city
            city1 - city
            city2 - city
            city3 - city
  )
  (:init (current-time t1)
 (box-at-city box0 city1)
         (destination box0 city2)
         (box-at-city box1 city2)
         (destination box1 city0)
         (truck-at-city truck0 city0)
         (plane-at-city plane0 city0)
         (plane-at-city plane1 city1)
         (can-drive city0 city1)
         (can-drive city0 city2)
         (can-drive city0 city3)
         (wrong-drive1 city0 city1)
         (wrong-drive2 city0 city2)
         (can-fly city0 city1)
         (can-drive city1 city0)
         (can-drive city1 city2)
         (can-drive city1 city3)
         (wrong-drive1 city1 city0)
         (wrong-drive2 city1 city2)
         (can-fly city1 city0)
         (can-drive city2 city0)
         (can-drive city2 city1)
         (can-drive city2 city3)
         (wrong-drive1 city2 city0)
         (wrong-drive2 city2 city1)
         (can-drive city3 city0)
         (can-drive city3 city1)
         (can-drive city3 city2)
         (wrong-drive1 city3 city0)
         (wrong-drive2 city3 city1)
  )
  (:goal (forall (?b - box)
                 (exists (?c - city)
                         (and (destination ?b ?c)
                              (box-at-city ?b ?c)
                         )
                 )
         )
  )
  (:goal-reward 1)
  (:metric maximize (reward))
)
(define
 (problem p8_design_1_relaxed)
  (:domain boxworld-design-relaxed)
  (:objects t1 t2 - time
 box0 - box
            box1 - box
            truck0 - truck
            plane0 - plane
            plane1 - plane
            city0 - city
            city1 - city
            city2 - city
            city3 - city
  )
  (:init (current-time t1)(next t1 t2)
 (box-at-city box0 city1)
         (destination box0 city2)
         (box-at-city box1 city2)
         (destination box1 city0)
         (truck-at-city truck0 city0)
         (plane-at-city plane0 city0)
         (plane-at-city plane1 city1)
         (can-drive city0 city1)
         (can-drive city0 city2)
         (can-drive city0 city3)
         (wrong-drive1 city0 city1)
         (wrong-drive2 city0 city2)
         (can-fly city0 city1)
         (can-drive city1 city0)
         (can-drive city1 city2)
         (can-drive city1 city3)
         (wrong-drive1 city1 city0)
         (wrong-drive2 city1 city2)
         (can-fly city1 city0)
         (can-drive city2 city0)
         (can-drive city2 city1)
         (can-drive city2 city3)
         (wrong-drive1 city2 city0)
         (wrong-drive2 city2 city1)
         (can-drive city3 city0)
         (can-drive city3 city1)
         (can-drive city3 city2)
         (wrong-drive1 city3 city0)
         (wrong-drive2 city3 city1)
  )
  (:goal (forall (?b - box)
                 (exists (?c - city)
                         (and (destination ?b ?c)
                              (box-at-city ?b ?c)
                         )
                 )
         )
  )
  (:goal-reward 1)
  (:metric maximize (reward))
)
(define
 (problem p8_design_1)
  (:domain boxworld-design)
  (:objects t1 t2 - time
 box0 - box
            box1 - box
            truck0 - truck
            plane0 - plane
            plane1 - plane
            city0 - city
            city1 - city
            city2 - city
            city3 - city
  )
  (:init (current-time t1)(next t1 t2)
 (box-at-city box0 city1)
         (destination box0 city2)
         (box-at-city box1 city2)
         (destination box1 city0)
         (truck-at-city truck0 city0)
         (plane-at-city plane0 city0)
         (plane-at-city plane1 city1)
         (can-drive city0 city1)
         (can-drive city0 city2)
         (can-drive city0 city3)
         (wrong-drive1 city0 city1)
         (wrong-drive2 city0 city2)
         (can-fly city0 city1)
         (can-drive city1 city0)
         (can-drive city1 city2)
         (can-drive city1 city3)
         (wrong-drive1 city1 city0)
         (wrong-drive2 city1 city2)
         (can-fly city1 city0)
         (can-drive city2 city0)
         (can-drive city2 city1)
         (can-drive city2 city3)
         (wrong-drive1 city2 city0)
         (wrong-drive2 city2 city1)
         (can-drive city3 city0)
         (can-drive city3 city1)
         (can-drive city3 city2)
         (wrong-drive1 city3 city0)
         (wrong-drive2 city3 city1)
  )
  (:goal (forall (?b - box)
                 (exists (?c - city)
                         (and (destination ?b ?c)
                              (box-at-city ?b ?c)
                         )
                 )
         )
  )
  (:goal-reward 1)
  (:metric maximize (reward))
)
(define
 (problem p8_design_2_relaxed)
  (:domain boxworld-design-relaxed)
  (:objects t1 t2 t3 - time
 box0 - box
            box1 - box
            truck0 - truck
            plane0 - plane
            plane1 - plane
            city0 - city
            city1 - city
            city2 - city
            city3 - city
  )
  (:init (current-time t1)(next t1 t2)(next t2 t3)
 (box-at-city box0 city1)
         (destination box0 city2)
         (box-at-city box1 city2)
         (destination box1 city0)
         (truck-at-city truck0 city0)
         (plane-at-city plane0 city0)
         (plane-at-city plane1 city1)
         (can-drive city0 city1)
         (can-drive city0 city2)
         (can-drive city0 city3)
         (wrong-drive1 city0 city1)
         (wrong-drive2 city0 city2)
         (can-fly city0 city1)
         (can-drive city1 city0)
         (can-drive city1 city2)
         (can-drive city1 city3)
         (wrong-drive1 city1 city0)
         (wrong-drive2 city1 city2)
         (can-fly city1 city0)
         (can-drive city2 city0)
         (can-drive city2 city1)
         (can-drive city2 city3)
         (wrong-drive1 city2 city0)
         (wrong-drive2 city2 city1)
         (can-drive city3 city0)
         (can-drive city3 city1)
         (can-drive city3 city2)
         (wrong-drive1 city3 city0)
         (wrong-drive2 city3 city1)
  )
  (:goal (forall (?b - box)
                 (exists (?c - city)
                         (and (destination ?b ?c)
                              (box-at-city ?b ?c)
                         )
                 )
         )
  )
  (:goal-reward 1)
  (:metric maximize (reward))
)
(define
 (problem p8_design_2)
  (:domain boxworld-design)
  (:objects t1 t2 t3 - time
 box0 - box
            box1 - box
            truck0 - truck
            plane0 - plane
            plane1 - plane
            city0 - city
            city1 - city
            city2 - city
            city3 - city
  )
  (:init (current-time t1)(next t1 t2)(next t2 t3)
 (box-at-city box0 city1)
         (destination box0 city2)
         (box-at-city box1 city2)
         (destination box1 city0)
         (truck-at-city truck0 city0)
         (plane-at-city plane0 city0)
         (plane-at-city plane1 city1)
         (can-drive city0 city1)
         (can-drive city0 city2)
         (can-drive city0 city3)
         (wrong-drive1 city0 city1)
         (wrong-drive2 city0 city2)
         (can-fly city0 city1)
         (can-drive city1 city0)
         (can-drive city1 city2)
         (can-drive city1 city3)
         (wrong-drive1 city1 city0)
         (wrong-drive2 city1 city2)
         (can-fly city1 city0)
         (can-drive city2 city0)
         (can-drive city2 city1)
         (can-drive city2 city3)
         (wrong-drive1 city2 city0)
         (wrong-drive2 city2 city1)
         (can-drive city3 city0)
         (can-drive city3 city1)
         (can-drive city3 city2)
         (wrong-drive1 city3 city0)
         (wrong-drive2 city3 city1)
  )
  (:goal (forall (?b - box)
                 (exists (?c - city)
                         (and (destination ?b ?c)
                              (box-at-city ?b ?c)
                         )
                 )
         )
  )
  (:goal-reward 1)
  (:metric maximize (reward))
)
(define
 (problem p8_design_3_relaxed)
  (:domain boxworld-design-relaxed)
  (:objects t1 t2 t3 t4 - time
 box0 - box
            box1 - box
            truck0 - truck
            plane0 - plane
            plane1 - plane
            city0 - city
            city1 - city
            city2 - city
            city3 - city
  )
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)
 (box-at-city box0 city1)
         (destination box0 city2)
         (box-at-city box1 city2)
         (destination box1 city0)
         (truck-at-city truck0 city0)
         (plane-at-city plane0 city0)
         (plane-at-city plane1 city1)
         (can-drive city0 city1)
         (can-drive city0 city2)
         (can-drive city0 city3)
         (wrong-drive1 city0 city1)
         (wrong-drive2 city0 city2)
         (can-fly city0 city1)
         (can-drive city1 city0)
         (can-drive city1 city2)
         (can-drive city1 city3)
         (wrong-drive1 city1 city0)
         (wrong-drive2 city1 city2)
         (can-fly city1 city0)
         (can-drive city2 city0)
         (can-drive city2 city1)
         (can-drive city2 city3)
         (wrong-drive1 city2 city0)
         (wrong-drive2 city2 city1)
         (can-drive city3 city0)
         (can-drive city3 city1)
         (can-drive city3 city2)
         (wrong-drive1 city3 city0)
         (wrong-drive2 city3 city1)
  )
  (:goal (forall (?b - box)
                 (exists (?c - city)
                         (and (destination ?b ?c)
                              (box-at-city ?b ?c)
                         )
                 )
         )
  )
  (:goal-reward 1)
  (:metric maximize (reward))
)
(define
 (problem p8_design_3)
  (:domain boxworld-design)
  (:objects t1 t2 t3 t4 - time
 box0 - box
            box1 - box
            truck0 - truck
            plane0 - plane
            plane1 - plane
            city0 - city
            city1 - city
            city2 - city
            city3 - city
  )
  (:init (current-time t1)(next t1 t2)(next t2 t3)(next t3 t4)
 (box-at-city box0 city1)
         (destination box0 city2)
         (box-at-city box1 city2)
         (destination box1 city0)
         (truck-at-city truck0 city0)
         (plane-at-city plane0 city0)
         (plane-at-city plane1 city1)
         (can-drive city0 city1)
         (can-drive city0 city2)
         (can-drive city0 city3)
         (wrong-drive1 city0 city1)
         (wrong-drive2 city0 city2)
         (can-fly city0 city1)
         (can-drive city1 city0)
         (can-drive city1 city2)
         (can-drive city1 city3)
         (wrong-drive1 city1 city0)
         (wrong-drive2 city1 city2)
         (can-fly city1 city0)
         (can-drive city2 city0)
         (can-drive city2 city1)
         (can-drive city2 city3)
         (wrong-drive1 city2 city0)
         (wrong-drive2 city2 city1)
         (can-drive city3 city0)
         (can-drive city3 city1)
         (can-drive city3 city2)
         (wrong-drive1 city3 city0)
         (wrong-drive2 city3 city1)
  )
  (:goal (forall (?b - box)
                 (exists (?c - city)
                         (and (destination ?b ?c)
                              (box-at-city ?b ?c)
                         )
                 )
         )
  )
  (:goal-reward 1)
  (:metric maximize (reward))
)
