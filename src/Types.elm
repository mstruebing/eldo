module Types exposing (..)

---- ELM ----
---- OWN ----

import Lib.Board exposing (Board, Position, sampleBoard)
import Lib.TodoList exposing (TodoList, Todo)
import Dict exposing (Dict)


initialModel : Model
initialModel =
    { board = sampleBoard
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
    | RemoveTodo TodoList Todo Position
    | ChangeNewTodoCaption Position String
    | SaveBoard
    | DeleteBoard
