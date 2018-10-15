module Advanced.App exposing (main)

import Advanced.State as State
import Advanced.Types exposing (Model, Msg)
import Advanced.View as View
import Browser


main : Program () Model Msg
main =
    Browser.element
        { init =
            \_ ->
                ( State.initialModel
                , State.initialCommands
                )
        , view = View.root
        , update = State.update
        , subscriptions = always Sub.none
        }
