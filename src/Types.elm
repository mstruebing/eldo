module Types exposing (..)

---- ELM ----
---- OWN ----

import Lib.Board exposing (Board, Position, empty)
import Lib.TodoList exposing (TodoList)


initialModel : Model
initialModel =
    { board = empty
    , autosave = True
    }


type alias Model =
    { board : Board
    , autosave : Bool
    }


type Msg
    = AddTodoList Position TodoList
    | RemoveTodoList Position
    | ChangeTodoListPosition Position Position
