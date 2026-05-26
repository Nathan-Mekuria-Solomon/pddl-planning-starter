(define (problem clean-all-rooms)
  (:domain robot-cleaner)

  (:objects
    robot - robot
    room1 room2 room3 - room
  )

  (:init
    ; Robot starts in room1
    (at robot room1)

    ; All rooms are dirty
    (dirty room1)
    (dirty room2)
    (dirty room3)

    ; Room connectivity (all rooms connected to each other)
    (connected room1 room2)
    (connected room2 room1)
    (connected room2 room3)
    (connected room3 room2)
    (connected room1 room3)
    (connected room3 room1)
  )

  (:goal
    (and
      (clean room1)
      (clean room2)
      (clean room3)
    )
  )
)
