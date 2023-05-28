class SearchController < ApplicationController
  
  def index
  end
  
  def form
    json = {
      "title": "this is some pretend configuration json that might surface available facets and etc.",
      "description": "this is a description"
    }
    render( :json => json, status: :ok)
  end
  
  def results
    json = {
      "results": [
        {
          "title": "This is a pretend result title",
          "description": "This is a pretend result description.",
          "link": "https://www.youtube.com/@harrysgarage"
        },
        {
          "title": "This is a second pretend result title",
          "description": "This is a second pretend result description.",
          "link": "https://www.youtube.com/@DougDeMuro"
        }
      ],
      "result_set":{
        "result_count": 357,
        "limit": 30,
        "offset": 10
      }
    }
    render( :json => json, status: :ok)
  end
  
  def object
    json = {
      "title": "this is a pretend object title in some pretend json",
      "description": "this is a pretend object description in some pretend json"
    }
    render( :json => json, status: :ok)
  end
end
