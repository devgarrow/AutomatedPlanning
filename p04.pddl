(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-1-3 loc-3-3 loc-4-3 loc-3-4 - location
    c2122 c1222 c1213 c2232 c3233 c3343 c3334 - corridor
    key1 key2 key3 key4 key5 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-3)
    (arm-free)

    ; Locationg <> Corridor Connections
    (corridor-connected c2122 loc-2-1)
    (corridor-connected c2122 loc-2-2)

    (corridor-connected c1222 loc-1-2)
    (corridor-connected c1222 loc-2-2)

    (corridor-connected c1213 loc-1-2)
    (corridor-connected c1213 loc-1-3)

    (corridor-connected c2232 loc-2-2)
    (corridor-connected c2232 loc-3-2)

    (corridor-connected c3233 loc-3-2)
    (corridor-connected c3233 loc-3-3)

    (corridor-connected c3343 loc-1-2)
    (corridor-connected c3343 loc-1-3)

    (corridor-connected c3334 loc-3-3)
    (corridor-connected c3334 loc-3-4)

    ; Key locations
    (key-at-loc key1 loc-1-3)
    (key-at-loc key2 loc-2-1)
    (key-at-loc key3 loc-3-2)
    (key-at-loc key4 loc-3-3)
    (key-at-loc key5 loc-3-4)

    ; Locked corridors
    (corridor-locked c1223)
    (lock-colour c1223 red)

    (corridor-locked c2223)
    (lock-colour c2223 red)

    ; Risky corridors
    (risky-corridor c3233)

    ; Key colours
    (key-colour key1 purple)
    (key-colour key2 red)
    (key-colour key3 yellow)
    (key-colour key4 green)
    (key-colour key5 rainbow)

    ; Key usage properties (one use, two use, etc)
    (one-use-key key1)
    (multi-use-key key2)
    (one-use-key two)
    (one-use-key one)
    (one-use-key one)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-3)
    )
  )

)
