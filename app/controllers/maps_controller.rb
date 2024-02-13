class MapsController < ApplicationController
  def index
    render 'index'
    @api_key = ENV['API_KEY']
  end
end
