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
  url = "http://localhost:3001/articles/"+ params[:id]
  options = { headers: { "Accept" => "application/json", "Content-Type" => "application/json", }, body: {"title" => params['title'], "description" => params['description']}.to_json }
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

def published
  url = "http://localhost:3001/articles"
  response = HTTParty.get(url)
  @data = JSON.parse(response.body)
  @articles = @data.select{|article| article["published"] == true}
end

def display
end
end