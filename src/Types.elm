module Types exposing (..)

---- ELM ----
---- OWN ----

import Lib.Board exposing (Board, Position, empty)
import Lib.TodoList exposing (TodoList, Todo)


initialModel : Model
initialModel =
    { board = empty
    , autosave = True
    , newTodoListName = ""
    , newTodoCaption = ""
    }


type alias Model =
    { board : Board
    , autosave : Bool
    , newTodoListName : String
    , newTodoCaption : String
    }


type Msg
    = AddTodoList Position TodoList
    | RemoveTodoList Position
    | ChangeTodoListPosition Position Position
    | ChangeNewTodoListName String
    | AddTodo TodoList Todo Position
    | ChangeNewTodoCaption String
