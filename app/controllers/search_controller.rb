# We require the example XML.
require 'xml/results.rb'

class SearchController < ApplicationController
  
  # We include the example XM modules
  include RESULTS_XML
  
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
    xml = results_xml
    render( :xml => xml, status: :ok)
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
