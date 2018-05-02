module Update exposing (update)

---- ELM ----

import List exposing (foldr, append)


---- OWN ----

import Types exposing (Model, Msg(..), TodoList)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        AddTodo position caption ->
            ( { model | todoLists = addTodo model.todoLists position caption }, Cmd.none )


addTodo : List TodoList -> Int -> String -> List TodoList
addTodo todoLists position caption =
    foldr
        (\todoList ->
            \list ->
                if todoList.position == position then
                    { todoList | items = append todoList.items [ caption ] } :: list
                else
                    todoList :: list
        )
        -- this is wierd
        [ { name = "Sample"
          , position = 999
          , items = []
          }
        ]
        todoLists
