(define (domain package-transport)
  (:requirements :strips :typing :action-costs)

  (:types
    location - object
    vehicle - object
    package - object
  )

  (:predicates
    (at-vehicle ?v - vehicle ?l - location)
    (at-package ?p - package ?l - location)
    (in-vehicle ?p - package ?v - vehicle)
    (road-connected ?from ?to - location)
    (air-connected ?from ?to - location)
    (water-connected ?from ?to - location)
    (is-truck ?v - vehicle)
    (is-plane ?v - vehicle)
    (is-ship ?v - vehicle)
  )

  (:functions
    (total-cost)
    (drive-cost ?from ?to - location)
    (fly-cost ?from ?to - location)
    (sail-cost ?from ?to - location)
  )

  (:action load
    :parameters (?p - package ?v - vehicle ?l - location)
    :precondition (and
      (at-vehicle ?v ?l)
      (at-package ?p ?l)
    )
    :effect (and
      (in-vehicle ?p ?v)
      (not (at-package ?p ?l))
      (increase (total-cost) 0)
    )
  )

  (:action unload
    :parameters (?p - package ?v - vehicle ?l - location)
    :precondition (and
      (at-vehicle ?v ?l)
      (in-vehicle ?p ?v)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-vehicle ?p ?v))
      (increase (total-cost) 0)
    )
  )

  (:action drive
    :parameters (?v - vehicle ?from ?to - location)
    :precondition (and
      (at-vehicle ?v ?from)
      (road-connected ?from ?to)
      (is-truck ?v)
    )
    :effect (and
      (at-vehicle ?v ?to)
      (not (at-vehicle ?v ?from))
      (increase (total-cost) (drive-cost ?from ?to))
    )
  )

  (:action fly
    :parameters (?v - vehicle ?from ?to - location)
    :precondition (and
      (at-vehicle ?v ?from)
      (air-connected ?from ?to)
      (is-plane ?v)
    )
    :effect (and
      (at-vehicle ?v ?to)
      (not (at-vehicle ?v ?from))
      (increase (total-cost) (fly-cost ?from ?to))
    )
  )

  (:action sail
    :parameters (?v - vehicle ?from ?to - location)
    :precondition (and
      (at-vehicle ?v ?from)
      (water-connected ?from ?to)
      (is-ship ?v)
    )
    :effect (and
      (at-vehicle ?v ?to)
      (not (at-vehicle ?v ?from))
      (increase (total-cost) (sail-cost ?from ?to))
    )
  )
)
