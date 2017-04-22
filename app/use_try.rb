require 'sinatra/base'
require 'json'

class UseTry < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, File.join(settings.root, '..', 'public')


  before do
    puts '=== before 11111'
  end

  after do
    puts '=== end 111111'
  end

  get '/123' do
    'hello world'
  end

  get '/hello/use' do
    'hello yes'
  end

end

