module PlastApp
  require 'sinatra'
  require 'sinatra/activerecord'
  require 'json'
  require 'rest_client'
  require 'rubygems'
  require 'json/ext' # required for .to_json

  require 'sinatra/asset_pipeline'
  
  class User < ActiveRecord::Base
  end
  
  class YunakQuiz < Sinatra::Base
    register Sinatra::AssetPipeline
    
    set :database, 'sqlite3:./db/quiz.db'

    get '/' do
      erb :index
    end

    get '/assessments' do
      content_type :json
      [{id: 1, name: 'assessment 1'}, {id: 2, name: 'assessment 2'}].to_json
    end

    put '/assessments' do
      content_type :json
      {response: 'Added an assessment'}.to_json
    end

    post '/assessments/:id' do
      content_type :json
      {response: "Updated to #{params['id']} assessment"}.to_json
    end

    delete '/assessments/:id' do
      content_type :json
      {response: "Assessment #{params['id']} has been deleted"}.to_json
    end

  end

end