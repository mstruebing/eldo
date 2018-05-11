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


unwrapBoard : Board -> Dict Position TodoList
unwrapBoard (Board board) =
    board



-- TODO


changeTodoListPosition : Position -> Position -> Board -> Board
changeTodoListPosition oldPosition newPosition (Board dict) =
    if oldPosition < newPosition then
        dict |> Board
    else
        dict |> Board
