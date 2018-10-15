module Advanced.Villains.Joker.Types exposing (JokerState(..), Model, Msg(..), jokerStateToString)


type JokerState
    = Laughing
    | Screaming


type alias Model =
    { shots : Int
    , health : Int
    , state : JokerState
    }


type Msg
    = Shoot
    | Close
    | TakeDamage


jokerStateToString : JokerState -> String
jokerStateToString state =
    case state of
        Laughing ->
            "Laughing"

        Screaming ->
            "Screaming"
