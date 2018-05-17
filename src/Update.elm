module Update exposing (update)

---- ELM ----

import Dict exposing (Dict)


---- OWN ----

import Types exposing (Model, Msg(..))
import Lib.Board exposing (addList, removeList, changeTodoListPosition)
import Lib.TodoList exposing (addTodo, removeTodo)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddTodoList position todoList ->
            ( { model | board = addList todoList position model.board, newTodoListName = "" }, Cmd.none )

        RemoveTodoList position ->
            ( { model | board = removeList position model.board }, Cmd.none )

        ChangeTodoListPosition oldPosition newPosition ->
            ( { model | board = changeTodoListPosition oldPosition newPosition model.board }, Cmd.none )

        ChangeNewTodoListName todoListName ->
            ( { model | newTodoListName = todoListName }, Cmd.none )

        ChangeNewTodoCaption position todo ->
            ( { model | newTodos = Dict.insert position todo model.newTodos }, Cmd.none )

        AddTodo todoList maybeTodo position ->
            case maybeTodo of
                Just todo ->
                    ( { model | board = addList (addTodo todoList todo) position model.board, newTodos = Dict.remove position model.newTodos }, Cmd.none )

                Nothing ->
                    ( model, Cmd.none )

        RemoveTodo todoList todo position ->
            ( { model | board = addList (removeTodo todoList todo) position model.board }, Cmd.none )
