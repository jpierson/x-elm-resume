module ElmResume.ResumeData exposing (..)



type alias Location =
  { address : String
  , postalCode : String
  , city : String
  , countryCode : String
  , region : String
  }

type alias Profile = 
  { network : String
  , username : String
  , url : String
  }

type alias EducationData =
  { institution : String
  , achievement : String
  , endDate : String
  }

type alias Address =
  { city : String
  , state : Maybe String
  , country : String
  }

type alias WorkData =
  { name : String
  , description : String
  , position : String
  , url : String
  , startDate : String 
  , endDate : String
  , summary : String
  , highlights : List String
  , location : Address
  }

type alias ResumeData =
  { name : String
  , email : String
  , phone : String
  , label : String
  , summary : String
  , location : Location
  , profiles : List Profile
  , education : List EducationData
  , work : List WorkData
  -- , endDates : String
  }