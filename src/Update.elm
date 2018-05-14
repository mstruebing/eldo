module Update exposing (update)

---- ELM ----
---- OWN ----

import Types exposing (Model, Msg(..))
import Lib.Board exposing (addList, removeList, changeTodoListPosition)
import Lib.TodoList exposing (addTodo)


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

        ChangeNewTodoCaption todo ->
            ( { model | newTodoCaption = todo }, Cmd.none )

        AddTodo todoList todo position ->
            ( { model | board = addList (addTodo todoList todo) position model.board, newTodoCaption = "" }, Cmd.none )
