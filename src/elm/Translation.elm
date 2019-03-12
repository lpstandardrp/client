module Translation exposing (Language(..), TranslationId(..), langFromString, languageDecoder, tr)

import Json.Decode as Json exposing (..)


type TranslationId
    = Cancel
    | HomeBlank
    | HomeImportJSON
    | HomeJSONFrom
    | RecentDocuments
    | LastOpened
    | OpenOtherDocuments
    | RemoveFromList
    | UnsavedChanges
    | AllChangesSaved
    | RestoreThisVersion
    | EnterKey
    | EnterAction
    | ArrowsAction
    | AddChildAction
    | AddBelowAction
    | AddAboveAction
    | ArrowKeys
    | MoveAction
    | Backspace
    | DeleteAction
    | FormattingGuide
    | WordCountSession Int
    | WordCountTotal Int
    | WordCountCard Int
    | WordCountSubtree Int
    | WordCountGroup Int
    | WordCountColumn Int


type Language
    = En
    | Es


tr : Language -> TranslationId -> String
tr lang trans =
    let
        pluralize n str =
            if n == 1 then
                str

            else
                str ++ "s"

        translationSet =
            case trans of
                Cancel ->
                    { en = "Cancel"
                    , es = "Cancelar"
                    }

                HomeBlank ->
                    { en = "Blank"
                    , es = "Vacío"
                    }

                HomeImportJSON ->
                    { en = "Import JSON"
                    , es = "Importar JSON"
                    }

                HomeJSONFrom ->
                    { en = "From Desktop or Online"
                    , es = "Del App Escritorio o Web"
                    }

                RecentDocuments ->
                    { en = "Recent Documents"
                    , es = "Documentos Recientes"
                    }

                LastOpened ->
                    { en = "Last Opened"
                    , es = "Última Apertura"
                    }

                OpenOtherDocuments ->
                    { en = "Open Other Documents"
                    , es = "Abrir Otros Documentos"
                    }

                RemoveFromList ->
                    { en = "Remove From List"
                    , es = "Elminiar de la Lista"
                    }

                UnsavedChanges ->
                    { en = "Unsaved changes..."
                    , es = "Cambios no guardados..."
                    }

                AllChangesSaved ->
                    { en = "All changes saved"
                    , es = "Todos los cambios guardados"
                    }

                RestoreThisVersion ->
                    { en = "Restore this Version"
                    , es = "Restaurar esta Versión"
                    }

                EnterKey ->
                    { en = "Enter"
                    , es = "Enter"
                    }

                EnterAction ->
                    { en = "to Edit"
                    , es = "para Editar"
                    }

                ArrowsAction ->
                    { en = "to Navigate"
                    , es = "para Navegar"
                    }

                AddChildAction ->
                    { en = "to Add Child"
                    , es = "para Agregar un Hijo"
                    }

                AddBelowAction ->
                    { en = "to Add Below"
                    , es = "para Agregar Abajo"
                    }

                AddAboveAction ->
                    { en = "to Add Above"
                    , es = "para Agregar Arriba"
                    }

                ArrowKeys ->
                    { en = "(arrows)"
                    , es = "(flechas)"
                    }

                MoveAction ->
                    { en = "to Move"
                    , es = "para Mover"
                    }

                Backspace ->
                    { en = "Backspace"
                    , es = "Backspace"
                    }

                DeleteAction ->
                    { en = "to Delete"
                    , es = "para Eliminar"
                    }

                FormattingGuide ->
                    { en = "Formatting Syntax Guide"
                    , es = "Guía de Sintaxis para Formato"
                    }

                WordCountSession n ->
                    { en = "Session: " ++ String.fromInt n ++ pluralize n " word"
                    , es = "Sesión: " ++ String.fromInt n ++ pluralize n " palabra"
                    }

                WordCountTotal n ->
                    { en = "Total : " ++ String.fromInt n ++ pluralize n " word"
                    , es = "Total : " ++ String.fromInt n ++ pluralize n " palabra"
                    }

                WordCountCard n ->
                    { en = "Card : " ++ String.fromInt n ++ pluralize n " word"
                    , es = "Tarjeta : " ++ String.fromInt n ++ pluralize n " palabra"
                    }

                WordCountSubtree n ->
                    { en = "Subtree : " ++ String.fromInt n ++ pluralize n " word"
                    , es = "Subárbol : " ++ String.fromInt n ++ pluralize n " palabra"
                    }

                WordCountGroup n ->
                    { en = "Group : " ++ String.fromInt n ++ pluralize n " word"
                    , es = "Grupo : " ++ String.fromInt n ++ pluralize n " palabra"
                    }

                WordCountColumn n ->
                    { en = "Column : " ++ String.fromInt n ++ pluralize n " word"
                    , es = "Columna : " ++ String.fromInt n ++ pluralize n " palabra"
                    }
    in
    case lang of
        En ->
            .en translationSet

        Es ->
            .es translationSet


languageDecoder : Decoder Language
languageDecoder =
    Json.map langFromString string


langFromString : String -> Language
langFromString str =
    case str of
        "en" ->
            En

        "es" ->
            Es

        _ ->
            En