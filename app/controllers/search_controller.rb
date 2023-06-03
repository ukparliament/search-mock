# We require the example XML.
require 'xml/results/written-statements/solr.rb'

# We require the example JSON.
require 'json/results/written-statements/solr.rb'

# We include the example XML modules.
include WRITTEN_STATEMENT_SOLR_RESULTS_XML

# We include the example JSON modules.
include WRITTEN_STATEMENT_SOLR_RESULTS_JSON

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
    
    # We check the requested format.
    respond_to do |format|
      
      # If the format requested is JSON ...
      format.json {
        
        # ... we check the document type and load the appropriate JSON.
        case document_type
        when 'written-statements'
          json = written_statment_results_json
        end
        
        # We render the JSON.
        render( :json => json, status: :ok)
      }
      
      # If the format requested is XML ...
      format.xml {
        
        # ... we check the document type and load the appropriate XML.
        case document_type
        when 'written-statements'
          xml = written_statment_results_xml
        end
        
        # We render the XML.
        render( :xml => xml, status: :ok)
      }
    end
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
