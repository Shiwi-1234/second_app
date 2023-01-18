class ArticlesController < ApplicationController
require 'httparty'#require 'rest-client'

def index
  url = "http://localhost:3001/articles"
  response = HTTParty.get(url)
  @data = JSON.parse(response.body)
  
end

def show
   url = "http://localhost:3001/articles/6"
  response = HTTParty.get(url)
  @data = JSON.parse(response.body)
end

def update_item
  response = HTTParty.put("http://localhost:3001/articles/5", body: {name: "updated item name"})
  puts response.body
end



private
def articles_params
   params.require(:article).permit(:title, :description, :date, :day )
end


end