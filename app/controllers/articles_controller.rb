class ArticlesController < ApplicationController
require 'httparty'#require 'rest-client'
include HTTParty
  base_uri "http://localhost:3001/"


def index
  url = "http://localhost:3001/articles"
  response = HTTParty.get(url)
  @data = JSON.parse(response.body)
end

def show
  url = "http://localhost:3001/articles/" + params[:id]
  @response = HTTParty.get(url)
  
end

def edit
 url = "http://localhost:3001/articles/" + params[:id]
 @response = HTTParty.get(url)
 @data = JSON.parse(@response.body)

end

def update
  
  
  url = "http://api.example.com/articles/" + params[:id]
  options = { headers: { "Accept" => "application/json", "Content-Type" => "application/json", }, body: data.to_json }
  response = HTTParty.patch(url, options)
  @data =  JSON.parse(response.body)
  if response.code == 200
    if @data.update
    redirect_to articles_path
    flash[:notice] = 'API data updated successfully'
  else
    flash[:alert] = 'Error updating API data'
  end
 end 
end

# def update_article
#   options = { headers: {"Accept"=>"application/json", "Content-Type"=>"application/json"}, body: { "published" => true}.to_json }
 
#   url = "http://localhost:3001/articles/10" 
#   response = HTTParty.patch(url , options)
#   status_code = response.code
#   @data = response.parsed_response
#   if status_code == 200
#     flash[:notice] = 'Your Article was Update Successfully!'
#   end 
# end

def create_item
  options = { headers: {"Accept"=>"application/json", "Content-Type"=>"application/json"}, 
  body: { "id" => 1, "title" => 'office', "description" => 'The second home', "date" => "19/01/2023", "Day" => "Thursday"}
  .to_json}
  url = 'http://localhost:3001/articles/10'
  response = HTTParty.patch(url, options)
  @data = JSON.parse(response.body)
end

def published
  url = "http://localhost:3001/articles"
  response = HTTParty.get(url)
  @data = JSON.parse(response.body)
  @articles = @data.select{|article| article["published"] == true}
end


def display
end
end