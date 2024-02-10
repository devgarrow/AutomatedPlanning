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
        ; Additional predicates for hero properties
        (holding-key ?k - key)
        (arm-free)
        
        ; Defining predicates for corridor and room properties 
        (corridor-connected ?cor - corridor ?to - location)
        (corridor-collapsed ?cor - corridor)
        (corridor-locked ?cor - corridor)
        (risky-corridor ?cor - corridor)
        (messy ?loc - location)

        ; Defining predicates for keys and locks
        (lock-colour ?cor - corridor ?col - colour)
        (key-colour ?k - key ?col - colour)
        (one-use-key ?key - key)
        (two-use-key ?key - key)
        (multi-use-key ?key - key)
        (key-used-up ?key - key)
        (key-at-loc ?k - key ?loc - location)

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
            ; Check hero and location to ensure valid locations
            (hero-at ?from)
            (not(= ?from ?to))
            
            ; Check that the corridor connects to and from
            (corridor-connected ?cor ?from)
            (corridor-connected ?cor ?to)
            
            ; Check corridor is valid to be passed through (i.e. not collapsed, locked)
            (not(corridor-collapsed ?cor))
            (not(corridor-locked ?cor))
        )
        :effect (and

            ; IMPLEMENT ME
            ; Update hero locations
            (hero-at ?to)
            (not(hero-at ?from))
            
            ; Collapses corridor and makes end location messy if the corridor is risky
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
            ; Check hero ability to pick up a key
            (hero-at ?loc)
            (not(messy ?loc))
            (arm-free)
            (not(holding-key ?k))
            
            ; Check key location
            (key-at-loc ?k ?loc)
        )

        :effect (and

            ; IMPLEMENT ME
            ; Update hero properties
            (holding-key ?k)
            (not(arm-free))

            ; Update key location properties
            (not(key-at-loc ?k ?loc))
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
            ; Check hero ability to drop a key
            (holding-key ?k)
            (hero-at ?loc)
            (not(arm-free))
        )

        :effect (and

            ; IMPLEMENT ME
            ; Update hero properties
            (not(holding-key ?k))
            (arm-free)
            
            ; Update hero properties
            (key-at-loc ?k ?loc)
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
            ; Check hero ability to unlock a lock
            (holding-key ?k)
            (hero-at ?loc)

            ; Check key/lock agreement
            (not(key-used-up ?k))
            (corridor-locked ?cor)
            (lock-colour ?cor ?col)
            (key-colour ?k ?col)
            
            ; Check corridor connection to current location
            (corridor-connected ?cor ?loc)
        )

        :effect (and
            ; IMPLEMENT ME
            ; Update corridor lock
            (not(corridor-locked ?cor))
            
            ; Update key use properties
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
            ; Check hero and room properties
            (hero-at ?loc)
            (messy ?loc)
        )

        :effect (and

            ; IMPLEMENT ME
            ; Update room property
            (not(messy ?loc))
        )
    )

)
