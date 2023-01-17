class ArticlesController < ApplicationController
require 'httparty'#require 'rest-client'


def edit 
  @article = Article.find(params[:id])
end
  
def index
   url = "http://localhost:3001/todolists"
   response = HTTParty.get(url)
  @data = JSON.parse(response.body)
 # render json: @data

 end




def update
  @article = Article.find(params[:id])
  if @article.update(articles_params)
    redirect_to articles_path
  else
    render 'edit'
  end
end

private

def articles_params
   params.require(:article).permit(:title, :description, :date, :day )
end


def gets_articles
  url = "http://localhost:3001/todolists"
  response = HTTParty.get(url)
  data = JSON.parse(response.body)
  data.each do |item|
    Article.create(title:item["name"])
  end 
  
  render json: @data
end



end