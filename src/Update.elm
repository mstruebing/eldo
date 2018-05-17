module Update exposing (update)

---- ELM ----

import Dict exposing (Dict)


---- OWN ----

import Types exposing (Model, Msg(..))
import Lib.Board exposing (addList, removeList, changeTodoListPosition, unwrapBoard, Board)
import Lib.TodoList exposing (addTodo, removeTodo)
import Ports exposing (saveBoardToLocalStorage)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddTodoList position todoList ->
            ( { model | board = addList todoList position model.board, newTodoListName = "" }
            , Cmd.batch [ saveBoard model.board ]
            )

        RemoveTodoList position ->
            ( { model | board = removeList position model.board }
            , if model.autosave then
                Cmd.batch [ saveBoard model.board ]
              else
                Cmd.none
            )

        ChangeTodoListPosition oldPosition newPosition ->
            ( { model | board = changeTodoListPosition oldPosition newPosition model.board }
            , if model.autosave then
                Cmd.batch [ saveBoard model.board ]
              else
                Cmd.none
            )

        ChangeNewTodoListName todoListName ->
            ( { model | newTodoListName = todoListName }
            , Cmd.none
            )

        ChangeNewTodoCaption position todo ->
            ( { model | newTodos = Dict.insert position todo model.newTodos }
            , Cmd.none
            )

        AddTodo todoList maybeTodo position ->
            case maybeTodo of
                Just todo ->
                    ( { model | board = addList (addTodo todoList todo) position model.board, newTodos = Dict.remove position model.newTodos }
                    , if model.autosave then
                        Cmd.batch [ saveBoard model.board ]
                      else
                        Cmd.none
                    )

                Nothing ->
                    ( model
                    , Cmd.none
                    )

        RemoveTodo todoList todo position ->
            ( { model | board = addList (removeTodo todoList todo) position model.board }
            , if model.autosave then
                Cmd.batch [ saveBoard model.board ]
              else
                Cmd.none
            )

        SaveBoard ->
            ( model
            , Cmd.batch [ saveBoard model.board ]
            )


saveBoard : Board -> Cmd msg
saveBoard board =
    unwrapBoard board
        |> Dict.toList
        |> saveBoardToLocalStorage
