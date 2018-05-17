module Main exposing (..)

---- ELM ----

import Html exposing (Html)
import Dict exposing (Dict)


---- OWN ----

import Types exposing (initialModel, Model, Msg(..))
import Update exposing (update)
import View exposing (view)
import Lib.TodoList exposing (TodoList)
import Lib.Board exposing (Board(..))


main : Program (Maybe (List ( Int, TodoList ))) Model Msg
main =
    Html.programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }


init : Maybe (List ( Int, TodoList )) -> ( Model, Cmd Msg )
init maybeBoard =
    case maybeBoard of
        Just jsonBoard ->
            ( { initialModel | board = Board <| Dict.fromList jsonBoard }
            , Cmd.none
            )

        Nothing ->
            ( initialModel
            , Cmd.none
            )
