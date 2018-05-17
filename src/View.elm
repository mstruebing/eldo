module View exposing (view)

---- ELM ----

import Html exposing (Html, div, text, input, button, form)
import Html.Attributes exposing (class, value, type_)
import Html.Events exposing (onClick, onInput, onSubmit)
import Dict exposing (Dict)


---- OWN ----

import Types exposing (Model, Msg(..))
import Lib.Board exposing (size, unwrapBoard, Position, Board(..))
import Lib.TodoList exposing (TodoList, Todo, createTodoList)
import Utils exposing (maybeHelper)


view : Model -> Html Msg
view model =
    div [ class "todoApp" ]
        [ printNewTodoListControl model
        , div
            [ class "todoLists" ]
            (unwrapBoard model.board
                |> Dict.toList
                |> List.map
                    (\( position, todoList ) ->
                        div [ class "todoList" ]
                            [ printTodoListName todoList
                            , printTodoListTodos todoList position
                            , printTodoListAddTodo todoList (Dict.get position model.newTodos) position
                            , printRemoveTodoList position model.board
                            ]
                    )
            )
        ]


printNewTodoListControl : Model -> Html Msg
printNewTodoListControl model =
    form
        [ class "todoList__new"
        , AddTodoList (size model.board) (createTodoList model.newTodoListName)
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


printTodoListTodos : TodoList -> Position -> Html Msg
printTodoListTodos todoList position =
    List.map
        (\todo ->
            div [ class "todoList__body__todo" ]
                [ text todo
                , button [ onClick <| RemoveTodo todoList todo position ] [ text "REMOVE" ]
                ]
        )
        todoList.todos
        |> div [ class "todoList__body" ]


printTodoListAddTodo : TodoList -> Maybe Todo -> Position -> Html Msg
printTodoListAddTodo todoList maybeTodo position =
    form
        [ class "todoList__todo__new"
        , AddTodo todoList maybeTodo position
            |> onSubmit
        ]
        [ input
            [ ChangeNewTodoCaption position
                |> onInput
            , maybeHelper value maybeTodo ""
            ]
            []
        , button
            [ type_ "submit"
            ]
            [ text "ADD" ]
        ]


printRemoveTodoList : Position -> Board -> Html Msg
printRemoveTodoList position board =
    button
        [ onClick <| RemoveTodoList position ]
        [ text "Remove" ]
