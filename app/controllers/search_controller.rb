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
    
    # We get the document type from the URL parameter.
    document_type = params[:document_type]
    
    # We substitute the hyphen as supplied in the URL, for an underscrore as used in the template name.
    document_type.gsub!( '-', '_' )
    
    # We render the appropriate template based on the document type and the format requested.
    render :template => "search/#{document_type}_results"
  end
  
  def object
    object = params[:object].to_i
    if object == 1
      json = {
        "id": 1,
        "title": "This is a pretend result title",
        "description": "This is a pretend result description.",
        "link": "https://www.youtube.com/@harrysgarage"
      }
    elsif object == 2
      json = {
        "id": 2,
        "title": "This is a second pretend result title",
        "description": "This is a second pretend result description.",
        "link": "https://www.youtube.com/@DougDeMuro"
      }
    end
    render( :json => json, status: :ok)
  end
end
