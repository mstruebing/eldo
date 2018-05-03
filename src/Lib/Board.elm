module Lib.Board exposing (..)

---- ELM ----

import Dict exposing (Dict)


---- OWN ----

import Lib.TodoList exposing (TodoList)


type alias Position =
    Int



-- type Board
--     = Board (Dict Position TodoList)


type alias Board =
    Dict Position TodoList


empty : Board
empty =
    Dict.empty


addList : TodoList -> Position -> Board -> Board
addList todoList position board =
    Dict.insert position todoList board


removeList : Position -> Board -> Board
removeList position board =
    Dict.remove position board
