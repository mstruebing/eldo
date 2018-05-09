module View exposing (view)

---- ELM ----

import Html exposing (Html, div, text)
import Html.Events exposing (onClick)
import Dict exposing (Dict)


---- OWN ----

import Types exposing (Model, Msg(..))
import Lib.Board exposing (size)


view : Model -> Html Msg
view model =
    div []
        [ div [ onClick <| AddTodoList (size model.board) { name = "stuff", todos = [] } ]
            [ text "Add" ]
        , div
            [ onClick <| RemoveTodoList (size model.board - 1) ]
            [ text "Remove" ]
        ]
