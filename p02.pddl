(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-2)
    (arm-free)

    ; Locationg <> Corridor Connections
    (corridor-connected c2122 loc-2-1)
    (corridor-connected c2122 loc-2-2)

    (corridor-connected c1222 loc-1-2)
    (corridor-connected c1222 loc-2-2)

    (corridor-connected c2232 loc-2-2)
    (corridor-connected c2232 loc-3-2)

    (corridor-connected c3242 loc-3-2)
    (corridor-connected c3242 loc-4-2)

    (corridor-connected c2223 loc-2-2)
    (corridor-connected c2223 loc-2-3)

    ; Key locations
    (key-at-loc key1 loc-2-1)
    (key-at-loc key2 loc-1-2)
    (key-at-loc key3 loc-2-2)
    (key-at-loc key4 loc-2-3)

    ; Locked corridors
    (corridor-locked c1222)
    (lock-colour c1222 yellow)
    
    (corridor-locked c2232)
    (lock-colour c2232 yellow)
    
    (corridor-locked c2122)
    (lock-colour c2122 purple)
    
    (corridor-locked c2223)
    (lock-colour c2223 green)
    
    (corridor-locked c3242)
    (lock-colour c3242 rainbow)

    ; Risky corridors
    ; none

    ; Key colours
    (key-colour key1 green)
    (key-colour key2 rainbow)
    (key-colour key3 purple)
    (key-colour key4 yellow)

    ; Key usage properties (one use, two use, etc)
    (one-use-key key1)
    (one-use-key key2)
    (one-use-key key3)
    (two-use-key key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-2)
    )
  )

)
