module Main exposing (..)

---- ELM ----

import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src)


---- OWN ----

import Types exposing (initialModel, Model, Msg(..))
import Update exposing (update)
import View exposing (view)


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
