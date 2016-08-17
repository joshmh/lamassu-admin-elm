module Fields exposing (..)


type FieldStatus
    = FieldUpdated
    | FieldError String
    | FieldIdle


type alias Field =
    { code : String
    , display : String
    , secret : Bool
    , required : Bool
    , value : FieldValue
    , status : FieldStatus
    }


type FieldValue
    = FieldString String
    | FieldPassword (Maybe String)


type alias FieldList =
    List Field


updateFieldValue : String -> FieldValue -> FieldValue
updateFieldValue stringValue oldFieldValue =
    case oldFieldValue of
        FieldString _ ->
            FieldString stringValue

        FieldPassword _ ->
            FieldPassword (Just stringValue)