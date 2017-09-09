module ResumeData exposing (..)

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
  , label : String
  , summary : String
  , education : List EducationData
  , work : List WorkData
  -- , endDates : String
  }