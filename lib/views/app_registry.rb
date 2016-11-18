require File.expand_path(File.join(__dir__, '../db/mongo'))
require 'securerandom'

class AppRegistry
  def handle
    client_id = SecureRandom::uuid
    client_secret = SecureRandom::uuid
    puts "Client Id:      #{client_id}"
    puts "Client Secret:  #{client_secret}"

    print 'App name: '
    app_name = gets

    print 'App user: '
    app_user = gets

    AppMongo::DbInit::clients::insert_one({
        'name' => app_name,
        'user_id' => app_user,
        'client_id' => client_id,
        'secret' => client_secret
    })
  end
end

if __FILE__ == $0
  AppMongo::DbInit::init
  app_registry = AppRegistry.new
  app_registry.handle
  AppMongo::DbInit::quit
end