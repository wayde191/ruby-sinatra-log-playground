require 'sinatra/base'
require 'json'

class MyApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, File.join(settings.root, '..', 'public')

  before do
    puts '=== before'
  end

  after do
    puts '=== end'
  end

  get '/' do
    'hello world'
  end

  get '/hello' do
    'hello yes'
  end

end

