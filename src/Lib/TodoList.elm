module Lib.TodoList exposing (..)


type alias Todo =
    String


type alias TodoList =
    { name : String
    , todos : List Todo
    }


createTodoList : String -> TodoList
createTodoList name =
    { name = name
    , todos = []
    }


addTodo : TodoList -> Todo -> TodoList
addTodo todoList todo =
    { todoList | todos = List.append todoList.todos [ todo ] }


removeTodo : TodoList -> Todo -> TodoList
removeTodo todoList todo =
    { todoList | todos = List.filter (\item -> item /= todo) todoList.todos }


changeName : TodoList -> String -> TodoList
changeName todoList name =
    { todoList | name = name }
