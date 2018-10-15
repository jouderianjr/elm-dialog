module Advanced.Villains.Penguin.Types exposing (Model, Msg(..), PenguinState(..), penquinStateToString)


type PenguinState
    = Quiet
    | Warking
    | Hurt


type alias Model =
    { warks : Int
    , health : Int
    , state : PenguinState
    }


type Msg
    = Wark
    | Close
    | TakeDamage


penquinStateToString : PenguinState -> String
penquinStateToString state =
    case state of
        Quiet ->
            "Quiet"

        Warking ->
            "Warking"

        Hurt ->
            "Hurt"
