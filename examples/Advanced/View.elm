module Advanced.View exposing (root)

import Advanced.Heroes.View as Heroes
import Advanced.Types exposing (..)
import Advanced.Villains.View as Villains
import Dialog
import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Utils exposing (..)


root : Model -> Html Message
root model =
  div [ style [ ( "margin", "15px" ) ] ]
    [ bootstrap
    , div [ class "container-fluid" ]
        [ h1 [] [ text "Advanced Demo" ]
        , instructions
        , div [ class "row" ]
            [ div [ class "col-md-6" ]
                [ Heroes.root model.heroes
                    |> Html.App.map HeroesMessage
                ]
            , div [ class "col-md-6" ]
                [ Villains.root model.villains
                    |> Html.App.map VillainsMessage
                ]
            ]
          -- What if both the heroes and villans want to show a dialog? How do we ensure we only show one at a time? Like this:
        , Maybe.oneOf
            [ Dialog.mapMaybe HeroesMessage (Heroes.dialog model.heroes)
            , Dialog.mapMaybe VillainsMessage (Villains.dialog model.villains)
            ]
            |> Dialog.view
        ]
    ]


instructions : Html msg
instructions =
  div []
    [ h2 [] [ text "Instructions" ]
    , div [ class "well" ]
        [ ul []
            [ li [] [ text "Each character in this demo is its own Elm component, with its own types, and its own update and view functions. None of them are aware of the others." ]
            , li [] [ text "Click on any of the character tabs to switch views - this shows each sub-component acting independently." ]
            , li [] [ text "Select Penguin and click his action button, 'Wark!' This shows a sub-component triggering the dialog." ]
            , li [] [ text "Select Batman and click his action button, 'Kapow!' This shows a sub-component triggering another sub-component's dialog." ]
            ]
        ]
    ]
