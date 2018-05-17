port module Ports exposing (saveBoardToLocalStorage)

import Lib.TodoList exposing (TodoList)


port saveBoardToLocalStorage : List ( Int, TodoList ) -> Cmd msg
