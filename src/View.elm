module View exposing (view)

---- ELM ----

import Html exposing (Html, div, text)


---- OWN ----

import Types exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    div [] [ text "HELLO WORLD" ]
