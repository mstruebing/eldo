module Update exposing (update)

---- ELM ----
---- OWN ----

import Types exposing (Model, Msg(..))
import Lib.Board exposing (addList, removeList, changeTodoListPosition)


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
