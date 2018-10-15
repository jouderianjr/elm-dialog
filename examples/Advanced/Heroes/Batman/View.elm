module Advanced.Heroes.Batman.View exposing (dialog, root)

import Advanced.Heroes.Batman.Types exposing (..)
import Dialog
import Html exposing (..)
import Utils exposing (..)


root : Model -> Html Msg
root model =
    div []
        [ h2 [] [ text "Batman" ]
        , debuggingView
            [ ( "kapows", String.fromInt model.kapows )
            , ( "showDialog"
              , if model.showDialog then
                    "True"

                else
                    "False"
              )
            ]
        , attackButton Kapow "Kapow!"
        ]


dialog : Model -> Maybe (Dialog.Config Msg)
dialog model =
    if model.showDialog then
        Just
            { closeMessage = Just Finished
            , containerClass = Just "batman-modal-container"
            , header = Just (h1 [] [ text "Kapow!" ])
            , body = Just (text "Batman swipes at you!")
            , footer = [ actionButton ( Finished, "OK" ) ]
            }

    else
        Nothing
