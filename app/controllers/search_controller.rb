# # The one and only search controller.
class SearchController < ApplicationController
  
  
  # ## A method to render the home page.
  def index
  end
  
  
  # ## A method to render the search form.
  def form
    json = {
      "title": "this is some pretend configuration json that might surface available facets and etc.",
      "description": "this is a description"
    }
    render( :json => json, status: :ok)
  end
  
  # ## A method to render a results list view.
  def results
    
    # We get the document type from the URL parameter.
    document_type = params[:document_type]
    
    # We substitute the hyphen as supplied in the URL, for an underscrore as used in the template name.
    document_type.gsub!( '-', '_' )
    
    # We render the appropriate template based on the document type and the format requested.
    render :template => "search/results/#{document_type}/results"
  end
  
  # ## A method to render an object view.
  def object
    
    # We get the object uri from the URL object parameter.
    object_uri = params[:object]
    
    # We construct the path to the template file.
    file_path = construct_object_file_path( object_uri )
    
    # We render the appropriate object template.
    render :template => "search/objects/#{file_path}/object"
  end
  
  # ## A method to construct an object file path.
  def construct_object_file_path( object_uri )
    
    # We parse the object URI as a Ruby URI.
    object_uri = URI.parse( object_uri )
    
    # We extract the path from the URI.
    file_path = object_uri.path
    
    # We swap out any slashes for hyphens.
    file_path.gsub!( '/', '-' )
    
    # We strip out the first hyphen.
    file_path = file_path[1..-1]
    
    # We return the file path.
    file_path
  end
end
