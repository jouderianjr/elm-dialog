module Utils exposing (actionButton, attackButton, bootstrap, both, debuggingView, viewTab)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


both : (a -> b) -> ( a, a ) -> ( b, b )
both f ( x, y ) =
    ( f x, f y )


viewTab : (view -> msg) -> view -> ( view, String ) -> Html msg
viewTab viewMsg currentView ( view, title ) =
    li [ class "nav-item" ]
        [ a
            [ classList [ ( "nav-link", True ), ( "active", currentView == view ) ]
            , onClick (viewMsg view)
            , href "#"
            ]
            [ text title ]
        ]


actionButton : ( msg, String ) -> Html msg
actionButton ( action, label ) =
    button
        [ class "btn btn-info"
        , onClick action
        ]
        [ text label ]


attackButton : msg -> String -> Html msg
attackButton attackMsg label =
    button
        [ class "btn btn-success"
        , onClick attackMsg
        ]
        [ text label ]


debuggingView : List ( String, String ) -> Html msg
debuggingView data =
    let
        formattedData =
            data
                |> List.map (\( k, v ) -> k ++ " = " ++ v)
                |> String.join ", "
    in
    div [ class "alert alert-info" ]
        [ code []
            [ text <| "{ " ++ formattedData ++ " }" ]
        ]


bootstrap : Html msg
bootstrap =
    node "link"
        [ href "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
        , rel "stylesheet"
        ]
        []
