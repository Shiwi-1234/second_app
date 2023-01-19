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
  url = "http://localhost:3001/articles/6"
  response = HTTParty.get(url)
  @data = JSON.parse(response.body)
  
end

#def update_item
  #options = { headers: {"Accept"=>"application/json", "Content-Type"=>"application/json"}, :debug_output => $stdout, body: { "param1" => 1, "param2" => 'sports'}
  #.to_json, basic_auth: {:username=>'shiwi11@gmail.com', :password=>'123456'} }
  #url = "http://localhost:3001/articles/6"
  #response = HTTParty.patch(url, options)
 # @data = response.parsed_response
#end

#def create_item
 # HTTParty.patch('http://localhost:3001/articles/6', body: { id: 1, title: "sports" })
#end

def update_item
  options = { headers: {"Accept"=>"application/json", "Content-Type"=>"application/json"}, 
  body: { "id" => 1, "title" => 'office', "description" => 'The second home', "date" => "19/01/2023", "Day" => "Thursday"}
  .to_json}

  url = "http://localhost:3001/articles/10"
  response = HTTParty.patch(url, options)
  @data = JSON.parse(response.body)
end



def display
end
end