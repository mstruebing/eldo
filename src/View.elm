module View exposing (view)

---- ELM ----

import Html exposing (Html, img, div, h1, text)
import Html.Attributes exposing (src)


---- OWN ----

import Types exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        ]
