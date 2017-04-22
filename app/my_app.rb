require 'sinatra/base'
require 'json'

require_relative '../app/use_try'
require_relative '../app/use_2'
require_relative '../app/lib/ucenter'

class MyApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, File.join(settings.root, '..', 'public')

  use Rack::Auth::Basic do |name, pass|
    name == 'admin' && pass == 'pass'
  end

  register do
    def auth
      condition do
        redirect '/' unless p 'yep'
      end
    end
  end

  before do
    puts '=== before'
  end

  after do
    puts '=== end'
  end

  get '/', :auth => () do
    'hello world'
  end

  get '/ucenter' do
    UCenter.configure do |config|
      config.appid   = 3
      config.charset = 'gbk' # or 'utf-8'
      config.api     = 'http://localhost:8810/'
      config.key     = '123456'
    end

    uc = UCenter.connect

    res = uc.user_login 'test', 'test'
    p res

    'hello ucenter'
  end

  use UseTry
  use Use2


end

