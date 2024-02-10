(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates

        ; One predicate given for free!
        (hero-at ?loc - location)

        ; IMPLEMENT ME
        (corridor-connected ?cor - corridor ?to - location)
        (corridor-collapsed ?cor - corridor)
        (corridor-locked ?cor - corridor)
        (risky-corridor ?cor - corridor)

        (lock-colour ?cor - corridor ?col - colour)
        (messy ?loc - location)
        
        (holding-key ?k - key)
        (arm-free)
        (key-at-loc ?k - key ?loc - location)
        
        (key-colour ?k - key ?col - colour)
        (one-use-key ?key - key)
        (two-use-key ?key - key)
        (multi-use-key ?key - key)
        (key-used-up ?key - key)
        
    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - hero will move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky" (also causing a mess in the ?to location)
    (:action move

        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and

            ; IMPLEMENT ME
            (hero-at ?from)
            (corridor-connected ?cor ?from)
            (corridor-connected ?cor ?to)
            (not(corridor-collapsed ?cor))
            (not(corridor-locked ?cor))
            (not(= ?from ?to))
        )
        :effect (and

            ; IMPLEMENT ME
            (hero-at ?to)
            (not(hero-at ?from))
            (when(risky-corridor ?cor)(and(messy ?to)(corridor-collapsed ?cor)))
        )
    )

    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;    - the location is not messy
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and

            ; IMPLEMENT ME
            (hero-at ?loc)
            (key-at-loc ?k ?loc)
            (not(holding-key ?k))
            (not(messy ?loc))
            (arm-free)
        )

        :effect (and

            ; IMPLEMENT ME
            (holding-key ?k)
            (not(key-at-loc ?k ?loc))
            (not(arm-free))
        )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and

            ; IMPLEMENT ME
            (holding-key ?k)
            (hero-at ?loc)
            (not(arm-free))
        )

        :effect (and

            ; IMPLEMENT ME
            (not(holding-key ?k))
            (key-at-loc ?k ?loc)
            (arm-free)
        )
    )


    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left,
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and

            ; IMPLEMENT ME
            (holding-key ?k)
            (not(key-used-up ?k))
            (corridor-locked ?cor)
            (lock-colour ?cor ?col)
            (key-colour ?k ?col)
            (hero-at ?loc)
            (corridor-connected ?cor ?loc)
        )

        :effect (and
            ; IMPLEMENT ME
            (not(corridor-locked ?cor))
            (when(two-use-key ?k)(and(one-use-key ?k)(not(two-use-key ?k))))
            (when(one-use-key ?k)(and(key-used-up ?k)(not(one-use-key ?k))))
        )
    )

    ;Hero can clean a location if
    ;    - the hero is at location ?loc,
    ;    - the location is messy
    ;Effect will be that the location is no longer messy
    (:action clean

        :parameters (?loc - location)

        :precondition (and

            ; IMPLEMENT ME
            (hero-at ?loc)
            (messy ?loc)
        )

        :effect (and

            ; IMPLEMENT ME
            (not(messy ?loc))
        )
    )

)
