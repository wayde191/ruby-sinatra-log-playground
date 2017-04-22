require 'sinatra/base'
require 'json'

class Use2 < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, File.join(settings.root, '..', 'public')


  before do
    puts '=== before 22222'
  end

  after do
    puts '=== end 22222'
  end

  get '/1234' do
    'hello world'
  end

end

