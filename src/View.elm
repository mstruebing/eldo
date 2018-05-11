module View exposing (view)

---- ELM ----

import Html exposing (Html, div, text, input, button, form)
import Html.Attributes exposing (class, value, type_)
import Html.Events exposing (onClick, onInput, onSubmit)
import Dict exposing (Dict)


---- OWN ----

import Types exposing (Model, Msg(..))
import Lib.Board exposing (Board(..))
import Lib.Board exposing (size, unwrapBoard)
import Lib.TodoList exposing (TodoList)


view : Model -> Html Msg
view model =
    div [ class "todoApp" ]
        [ printNewTodoListControl model
        , div
            [ onClick <| RemoveTodoList (size model.board - 1) ]
            [ text "Remove" ]
        , div
            [ class "todoLists" ]
            (unwrapBoard model.board
                |> Dict.toList
                |> List.map
                    (\( position, todoList ) ->
                        div [ class "todoList" ]
                            [ printTodoListName todoList
                            , printTodoListTodos todoList
                            ]
                    )
            )
        ]


printNewTodoListControl : Model -> Html Msg
printNewTodoListControl model =
    form
        [ class "todoList__new"
        , AddTodoList (size model.board) { name = model.newTodoListName, todos = [ "wha", "whe" ] }
            |> onSubmit
        ]
        [ input [ onInput ChangeNewTodoListName, value model.newTodoListName ] []
        , button
            [ type_ "submit"
            ]
            [ text "ADD" ]
        ]


printTodoListName : TodoList -> Html Msg
printTodoListName todoList =
    div [ class "todoList__head" ] [ text todoList.name ]


printTodoListTodos : TodoList -> Html Msg
printTodoListTodos todoList =
    List.map (\todo -> text todo) todoList.todos
        |> div [ class "todoList__body" ]
