module Tests exposing (..)

---- TEST ----

import Test exposing (..)
import Fuzz exposing (..)
import Expect


---- ELM ----

import Dict exposing (Dict)


---- OWN ----

import Lib.TodoList exposing (createTodoList, addTodo, removeTodo, changeName)
import Lib.Board exposing (empty, addList, removeList)


-- Check out http://package.elm-lang.org/packages/elm-community/elm-test/latest to learn more about testing in Elm!


all : Test
all =
    describe "Eldo"
        [ describe "Lib.TodoList"
            [ fuzz string "createTodoList" <|
                \randomString ->
                    Expect.equal
                        (createTodoList randomString)
                        { name = randomString, todos = [] }
            , fuzz string "addTodo single" <|
                \randomString ->
                    Expect.equal
                        (addTodo { name = "list", todos = [] } randomString)
                        { name = "list", todos = [ randomString ] }
            , fuzz string "addTodo multiple" <|
                \randomString ->
                    Expect.equal
                        (addTodo { name = "list", todos = [ "one" ] } randomString)
                        { name = "list", todos = [ "one", randomString ] }
            , fuzz string "removeTodo single" <|
                \randomString ->
                    Expect.equal
                        (removeTodo { name = "stuff", todos = [ randomString ] } randomString)
                        { name = "stuff", todos = [] }
            , fuzz string "removeTodo first" <|
                \randomString ->
                    Expect.equal
                        (removeTodo { name = "stuff", todos = [ randomString, "two", "three" ] } randomString)
                        { name = "stuff", todos = [ "two", "three" ] }
            , fuzz string "removeTodo middle" <|
                \randomString ->
                    Expect.equal
                        (removeTodo { name = "stuff", todos = [ "one", randomString, "three" ] } randomString)
                        { name = "stuff", todos = [ "one", "three" ] }
            , fuzz string "removeTodo last" <|
                \randomString ->
                    Expect.equal
                        (removeTodo { name = "stuff", todos = [ "one", "two", randomString ] } randomString)
                        { name = "stuff", todos = [ "one", "two" ] }
            , fuzz string "changeName" <|
                \randomString ->
                    Expect.equal
                        (changeName { name = "stuff", todos = [ "myTodo" ] } randomString)
                        { name = randomString, todos = [ "myTodo" ] }
            ]
        , describe "Lib.Board"
            [ test "empty" <|
                \_ ->
                    Expect.equal
                        empty
                        Dict.empty
            , test "addList single" <|
                \_ ->
                    Expect.equal
                        (addList { name = "list", todos = [] } 0 empty)
                        (Dict.fromList [ ( 0, { name = "list", todos = [] } ) ])
            , test "addList multiple" <|
                \_ ->
                    Expect.equal
                        (addList { name = "first", todos = [] } 1 (addList { name = "zero", todos = [] } 0 empty))
                        (Dict.fromList [ ( 0, { name = "zero", todos = [] } ), ( 1, { name = "first", todos = [] } ) ])
            ]
        ]
