port module Ports exposing (saveBoardToLocalStorage, deleteBoardFromLocalStorage)

import Lib.TodoList exposing (TodoList)


port saveBoardToLocalStorage : ( String, List ( Int, TodoList ) ) -> Cmd msg


port deleteBoardFromLocalStorage : String -> Cmd msg
