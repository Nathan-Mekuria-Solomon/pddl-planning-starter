(define (problem package-delivery)
  (:domain package-transport)

  (:objects
    cityA cityB cityC airportA airportB portA portB - location
    truck1 truck2 - vehicle
    plane1 - vehicle
    ship1 - vehicle
    pkg1 pkg2 pkg3 - package
  )

  (:init
    ; Vehicle types
    (is-truck truck1)
    (is-truck truck2)
    (is-plane plane1)
    (is-ship ship1)

    ; Road connections (bidirectional)
    (road-connected cityA cityB)
    (road-connected cityB cityA)
    (road-connected cityB cityC)
    (road-connected cityC cityB)
    (road-connected cityA airportA)
    (road-connected airportA cityA)
    (road-connected cityC airportB)
    (road-connected airportB cityC)
    (road-connected cityA portA)
    (road-connected portA cityA)
    (road-connected cityC portB)
    (road-connected portB cityC)

    ; Air connections
    (air-connected airportA airportB)
    (air-connected airportB airportA)

    ; Water connections
    (water-connected portA portB)
    (water-connected portB portA)

    ; Vehicle positions
    (at-vehicle truck1 cityA)
    (at-vehicle truck2 cityB)
    (at-vehicle plane1 airportA)
    (at-vehicle ship1 portA)

    ; Package positions
    (at-package pkg1 cityA)
    (at-package pkg2 cityA)
    (at-package pkg3 cityB)

    ; Costs
    (= (total-cost) 0)
    (= (drive-cost cityA cityB) 5)
    (= (drive-cost cityB cityA) 5)
    (= (drive-cost cityB cityC) 5)
    (= (drive-cost cityC cityB) 5)
    (= (drive-cost cityA airportA) 2)
    (= (drive-cost airportA cityA) 2)
    (= (drive-cost cityC airportB) 2)
    (= (drive-cost airportB cityC) 2)
    (= (drive-cost cityA portA) 2)
    (= (drive-cost portA cityA) 2)
    (= (drive-cost cityC portB) 2)
    (= (drive-cost portB cityC) 2)
    (= (fly-cost airportA airportB) 10)
    (= (fly-cost airportB airportA) 10)
    (= (sail-cost portA portB) 8)
    (= (sail-cost portB portA) 8)
  )

  (:goal
    (and
      (at-package pkg1 cityC)
      (at-package pkg2 cityC)
      (at-package pkg3 cityC)
    )
  )

  (:metric minimize (total-cost))
)
