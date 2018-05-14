module Types exposing (..)

---- ELM ----
---- OWN ----

import Lib.Board exposing (Board, Position, empty)
import Lib.TodoList exposing (TodoList, Todo)
import Dict exposing (Dict)


initialModel : Model
initialModel =
    { board = empty
    , autosave = True
    , newTodoListName = ""
    , newTodos = Dict.empty
    }


type alias Model =
    { board : Board
    , autosave : Bool
    , newTodoListName : String
    , newTodos : Dict Position String
    }


type Msg
    = AddTodoList Position TodoList
    | RemoveTodoList Position
    | ChangeTodoListPosition Position Position
    | ChangeNewTodoListName String
    | AddTodo TodoList (Maybe Todo) Position
    | ChangeNewTodoCaption Position String
