module Advanced.Heroes.Batman.Types exposing (..)


type alias Model =
  { kapows : Int
  , showDialog : Bool
  }


type Message
  = Kapow
  | Finished
