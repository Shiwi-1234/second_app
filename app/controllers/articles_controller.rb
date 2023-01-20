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
  response = HTTParty.get(url)
  
end

def edit
 url = "http://localhost:3001/articles/" + params[:id]
 response = HTTParty.get(url)
 @data = JSON.parse(response.body)
end

def update_article
  options = { headers: {"Accept"=>"application/json", "Content-Type"=>"application/json"}, body: { "published" => true}.to_json }
 
  url = "http://localhost:3001/articles/10" 
  response = HTTParty.patch(url , options)
  status_code = response.code
  @data = response.parsed_response
  if status_code == 200
    flash[:notice] = 'Your Article was Update Successfully!'
  end 
end

def update
  options = { headers: {"Accept"=>"application/json", "Content-Type"=>"application/json"}, body: { "published" => true}
  .to_json }
  #url = "http://localhost:3001/articles/" 
  response = HTTParty.patch(@url , options)
  status_code = response.code
  @data = response.parsed_response
  if status_code == 200
    flash[:notice] = 'Your Article was Update Successfully!'
  end 
  redirect_to  update_article_articles_path
end

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