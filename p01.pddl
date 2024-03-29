(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 loc-3-3 loc-2-4 loc-3-4 loc-4-4 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-2)
    (arm-free)

    ; Locationg <> Corridor Connections
    (corridor-connected c1222 loc-1-2)
    (corridor-connected c1222 loc-2-2)

    (corridor-connected c2232 loc-2-2)
    (corridor-connected c2232 loc-3-2)

    (corridor-connected c3242 loc-3-2)
    (corridor-connected c3242 loc-4-2)

    (corridor-connected c3132 loc-3-2)
    (corridor-connected c3132 loc-3-1)

    (corridor-connected c2223 loc-2-2)
    (corridor-connected c2223 loc-2-3)

    (corridor-connected c3233 loc-3-2)
    (corridor-connected c3233 loc-3-3)

    (corridor-connected c2333 loc-2-3)
    (corridor-connected c2333 loc-3-3)

    (corridor-connected c2324 loc-2-3)
    (corridor-connected c2324 loc-2-4)

    (corridor-connected c3334 loc-3-3)
    (corridor-connected c3334 loc-3-4)

    (corridor-connected c2434 loc-2-4)
    (corridor-connected c2434 loc-3-4)

    (corridor-connected c3444 loc-3-4)
    (corridor-connected c3444 loc-4-4)

    ; Key locations
    (key-at-loc key1 loc-2-2)
    (key-at-loc key2 loc-2-4)
    (key-at-loc key3 loc-4-2)
    (key-at-loc key4 loc-4-4)

    ; Locked corridors
    (corridor-locked c3242)
    (lock-colour c3242 purple)
    
    (corridor-locked c3132)
    (lock-colour c3132 rainbow)
    
    (corridor-locked c2324)
    (lock-colour c2324 red)
    
    (corridor-locked c2434)
    (lock-colour c2434 red)
    
    (corridor-locked c3444)
    (lock-colour c3444 yellow)

    ; Risky corridors
    (risky-corridor c2324)
    (risky-corridor c2434)

    ; Key colours
    (key-colour key1 red)
    (key-colour key2 yellow)
    (key-colour key3 rainbow)
    (key-colour key4 purple)

    ; Key usage properties (one use, two use, etc)
    (multi-use-key key1)
    (two-use-key key2)
    (one-use-key key4)
    (one-use-key key3)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-3-1)
    )
  )

)
