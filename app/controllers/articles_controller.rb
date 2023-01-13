class ArticlesController < ApplicationController
require 'httparty'

  def index
    @articles = Article.all
  end

  
  def create
    response = HTTParty.get("http://localhost:3000/todolists")
    data = JSON(response.body)
    data.each do |item|
      Article.create(title: item["name"], description: item["email"])
     end 
  end

  def new
  end

end
