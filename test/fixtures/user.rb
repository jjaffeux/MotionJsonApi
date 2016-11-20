def user
  {
    "meta" => {
      "total-pages" => 2
    },
    "links" => {
      "self" => "/users?page[number]=3&page[size]=1"
    },
    "data" => {
      "id" => "36ffe4bf-85d6-45d2-8c41-7998c34cafcd",
      "relationships" => {
        "favorites" => {
          "data" => [{
            "id" => "1d5cb360-f546-46a6-b6fa-112b7ee8a0e2",
            "type" => "services"
          }]
        },
        "contributions" => {
          "data" => []
        }
      },
      "type" => "users",
      "attributes" => {
        "name" => "joffrey",
      }
    }, "included" => [{
      "id" => "1d5cb360-f546-46a6-b6fa-112b7ee8a0e2",
      "relationships" => {
        "urls" => {
          "data" => []
        },
        "addresses" => {
          "data" => []
        },
        "table" => {
          "data" => nil
        },
        "recent_contribution" => {
          "data" => {
            "id" => "afa453fe-403b-4e59-82c1-4aeaef5fa5a5",
            "type" => "contributions"
          }
        },
        "tips" => {
          "data" => []
        },
        "phonenumbers" => {
          "data" => []
        },
        "notifications" => {
          "data" => []
        }
      },
      "type" => "services",
      "attributes" => {
        "title" => "Le Kiez"
      }
    }, {
      "id" => "afa453fe-403b-4e59-82c1-4aeaef5fa5a5",
      "relationships" => {
        "author" => {
          "data" => {
            "id" => "44c9905d-5faa-4755-9851-9b8ff5d38fda",
            "type" => "users"
          },
          "links" => {
            "self" => "/users/44c9905d-5faa-4755-9851-9b8ff5d38fda",
          }
        },
        "service" => {
          "data" => {
            "id" => "1d5cb360-f546-46a6-b6fa-112b7ee8a0e2",
            "type" => "services"
          }
        }
      },
      "type" => "contributions",
      "attributes" => {
        "wait" => 8
      }
    }, {
      "id" => "44c9905d-5faa-4755-9851-9b8ff5d38fda",
      "type" => "users",
      "attributes" => {
        "name" => "marc"
      }
    }]
  }
end
