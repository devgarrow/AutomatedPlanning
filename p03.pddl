(define (problem p3-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-4 loc-4-5 loc-1-2 loc-2-2 loc-3-2 loc-3-3 loc-2-5 loc-1-3 loc-2-1 loc-1-4 loc-3-5 loc-2-4 loc-4-4 loc-2-3 loc-4-3 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-1)
    (arm-free)

    ; Locationg <> Corridor Connections
    (corridor-connected c2122 loc-2-1)
    (corridor-connected c2122 loc-2-2)

    (corridor-connected c1222 loc-1-2)
    (corridor-connected c1222 loc-2-2)

    (corridor-connected c2232 loc-2-2)
    (corridor-connected c2232 loc-3-2)

    (corridor-connected c1213 loc-1-2)
    (corridor-connected c1213 loc-1-3)

    (corridor-connected c1223 loc-1-2)
    (corridor-connected c1223 loc-2-3)

    (corridor-connected c2223 loc-2-2)
    (corridor-connected c2223 loc-2-3)

    (corridor-connected c3223 loc-3-2)
    (corridor-connected c3223 loc-2-3)

    (corridor-connected c3233 loc-3-2)
    (corridor-connected c3233 loc-3-3)

    (corridor-connected c1323 loc-1-3)
    (corridor-connected c1323 loc-2-3)

    (corridor-connected c2333 loc-2-3)
    (corridor-connected c2333 loc-3-3)

    (corridor-connected c1314 loc-1-3)
    (corridor-connected c1314 loc-1-4)

    (corridor-connected c2314 loc-2-3)
    (corridor-connected c2314 loc-1-4)

    (corridor-connected c2324 loc-2-3)
    (corridor-connected c2324 loc-2-4)

    (corridor-connected c2334 loc-2-3)
    (corridor-connected c2334 loc-3-4)

    (corridor-connected c3334 loc-3-3)
    (corridor-connected c3334 loc-3-4)

    (corridor-connected c1424 loc-1-4)
    (corridor-connected c1424 loc-2-4)

    (corridor-connected c2434 loc-2-4)
    (corridor-connected c2434 loc-3-4)

    (corridor-connected c2425 loc-2-4)
    (corridor-connected c2425 loc-2-5)

    (corridor-connected c2535 loc-2-5)
    (corridor-connected c2535 loc-3-5)

    (corridor-connected c3545 loc-3-5)
    (corridor-connected c3545 loc-4-5)

    (corridor-connected c4544 loc-4-5)
    (corridor-connected c4544 loc-4-4)

    (corridor-connected c4443 loc-4-4)
    (corridor-connected c4443 loc-4-3)

    ; Key locations
    (key-at-loc key1 loc-2-1)
    (key-at-loc key2 loc-2-3)
    (key-at-loc key3 loc-2-3)
    (key-at-loc key4 loc-2-3)
    (key-at-loc key5 loc-2-3)
    (key-at-loc key6 loc-4-4)

    ; Locked corridors
    (corridor-locked c1223)
    (lock-colour c1223 red)

    (corridor-locked c2223)
    (lock-colour c2223 red)

    (corridor-locked c3223)
    (lock-colour c3223 red)

    (corridor-locked c2333)
    (lock-colour c2333 red)

    (corridor-locked c2334)
    (lock-colour c2334 red)

    (corridor-locked c2324)
    (lock-colour c2324 red)

    (corridor-locked c2314)
    (lock-colour c2314 red)

    (corridor-locked c1323)
    (lock-colour c1323 red)

    (corridor-locked c2425)
    (lock-colour c2425 purple)
    
    (corridor-locked c2535)
    (lock-colour c2535 green)
    
    (corridor-locked c3545)
    (lock-colour c3545 purple)

    (corridor-locked c4544)
    (lock-colour c4544 green)

    (corridor-locked c4443)
    (lock-colour c4443 rainbow)

    ; Risky corridors
    (risky-corridor c1223)
    (risky-corridor c2223)
    (risky-corridor c3223)
    (risky-corridor c2333)
    (risky-corridor c2334)
    (risky-corridor c2324)
    (risky-corridor c2314)
    (risky-corridor c1323)
    
    ; Key colours
    (key-colour key1 red)
    (key-colour key2 green)
    (key-colour key3 green)
    (key-colour key4 purple)
    (key-colour key5 purple)
    (key-colour key6 rainbow)

    ; Key usage properties (one use, two use, etc)
    (multi-use-key key1)
    (one-use-key key2)
    (one-use-key key3)
    (one-use-key key4)
    (one-use-key key5)
    (one-use-key key6)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-3)
    )
  )

)
