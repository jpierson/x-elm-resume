module ElmResume.ResumeData exposing (..)



type alias Location =
  { address : Maybe String
  , postalCode : Maybe String
  , city : Maybe String
  , countryCode : Maybe String
  , region : Maybe String
  }

type alias Profile = 
  { network : Maybe String
  , username : Maybe String
  , url : Maybe String
  }

type alias EducationData =
  { institution : Maybe String
  , achievement : Maybe String
  , endDate : Maybe String
  }

type alias Address =
  { city : Maybe String
  , state : Maybe String
  , country : Maybe String
  }

type alias WorkData =
  { name : Maybe String
  , description : Maybe String
  , position : Maybe String
  , url : Maybe String
  , startDate : Maybe String 
  , endDate : Maybe String
  , summary : Maybe String
  , highlights : List String
  , location : Maybe Address
  }

type alias JsonResume =
  { name : Maybe String
  , email : Maybe String
  , phone : Maybe String
  , label : Maybe String
  , summary : Maybe String
  , location : Maybe Location
  , profiles : List Profile
  , education : List EducationData
  , work : List WorkData
  -- , endDates : String
  }