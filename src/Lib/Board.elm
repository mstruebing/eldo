module Lib.Board exposing (..)

---- ELM ----

import Dict exposing (Dict)


---- OWN ----

import Lib.TodoList exposing (TodoList)


type alias Position =
    Int


type Board
    = Board (Dict Position TodoList)


empty : Board
empty =
    Dict.empty |> Board


size : Board -> Int
size (Board dict) =
    Dict.size dict


addList : TodoList -> Position -> Board -> Board
addList todoList position (Board dict) =
    Dict.insert position todoList dict |> Board


removeList : Position -> Board -> Board
removeList position (Board dict) =
    Dict.remove position dict |> Board



-- TODO


changeTodoListPosition : Position -> Position -> Board -> Board
changeTodoListPosition oldPosition newPosition (Board dict) =
    dict |> Board
