module ElmResume.JsonResumeDecoder exposing (..)
import ElmResume.ResumeData exposing (..)
import Json.Decode exposing (Decoder, int, string, list, maybe, map)
import Json.Decode.Pipeline exposing (decode, required, optional)

-- just a : 
-- just = Json.Decode.map Just a
justString : Decoder (Maybe String)
justString = Json.Decode.map Just string

jsonResumeLocationDecoder : Decoder Location
jsonResumeLocationDecoder =
  decode Location
  |> optional "address" justString Nothing
  |> optional "postalCode" justString Nothing
  |> optional "city" justString Nothing
  |> optional "countryCode" justString Nothing
  |> optional "region" justString Nothing

jsonResumeProfileDecoder : Decoder Profile
jsonResumeProfileDecoder = 
  decode Profile
  |> optional "network" justString Nothing
  |> optional "username" justString Nothing
  |> optional "url" justString Nothing

educationDecoder : Decoder EducationData
educationDecoder =
  decode EducationData
  |> optional "institution" justString Nothing
  |> optional "achievement" justString Nothing
  |> optional "endDate" justString Nothing

addressDecoder : Decoder Address
addressDecoder =
  decode Address
  |> optional "city" justString Nothing
  |> optional "state" justString Nothing
  |> optional "country" justString Nothing
  

workDecoder : Decoder WorkData
workDecoder =
  decode WorkData
  |> optional "name" justString Nothing
  |> optional "description" justString Nothing
  |> optional "position" justString Nothing
  |> optional "url" justString Nothing
  |> optional "startDate" justString Nothing 
  |> optional "endDate" justString Nothing
  |> optional "summary" justString Nothing
  |> optional "highlights" (list string) []
  |> optional "location" (Json.Decode.map Just addressDecoder) Nothing

jsonResumeDecoder : Decoder JsonResume
jsonResumeDecoder = 
  decode JsonResume 
    |> optional "name" justString Nothing
    |> optional "email" justString Nothing
    |> optional "phone" justString Nothing
    |> optional "label" justString Nothing
    |> optional "summary" justString Nothing
    |> optional "location" (Json.Decode.map Just jsonResumeLocationDecoder) Nothing
    |> optional "profiles" (list jsonResumeProfileDecoder) []
    |> optional "education" (list educationDecoder) []
    |> optional "work" (list workDecoder) []