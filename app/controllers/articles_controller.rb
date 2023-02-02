class ArticlesController < ApplicationController
require 'httparty'#require 'rest-client'

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
 response = HTTParty.get(url)
 @data = JSON.parse(response.body)
 end

def update
  url = "http://localhost:3001/articles/"+ params[:id]
  options = { headers: { "Accept" => "application/json", "Content-Type" => "application/json" }, body: {"title" => params['title'], "description" => params['description'] , "date" => params['date'], "day" => params["day"] , "published" => params["published"]}.to_json }
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
  url = "http://localhost:3001/articles/published_article"
  response = HTTParty.get(url)
  @data = JSON.parse(response.body)
  
end

def display
end
end