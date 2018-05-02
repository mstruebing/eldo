module View exposing (view)

---- ELM ----

import Html exposing (Html, img, div, h1, text)
import Html.Events exposing (onClick)
import List exposing (map, sortBy)


---- OWN ----

import Types exposing (Model, Msg(..), TodoList)


view : Model -> Html Msg
view model =
    printTodoLists model.todoLists
        |> div []


printTodoLists : List TodoList -> List (Html Msg)
printTodoLists todoLists =
    sortBy .position todoLists
        |> map printTodoList


printTodoList : TodoList -> Html Msg
printTodoList todoList =
    div [ onClick <| AddTodo todoList.position "HAHA" ] [ text todoList.name ]
