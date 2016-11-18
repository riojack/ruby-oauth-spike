module AppMongo
  require 'mongo'

  class DbInit
    def self.init
      @client = Mongo::Client.new(['localhost:27017'], :database => 'oauth')
      @db = @client.database

      @clients_collection = @client[:clients, {
          'validator' => {
              '$and' => [
                  {'name' => {'$type' => 'string'}},
                  {'client_id' => {'$type' => 'string'}},
                  {'secret' => {'$type' => 'string'}},
                  {'user_id' => {'$type' => 'string'}}
              ]
          }
      }]
      @auth_code_collection = @client[:codes, {
          'validator' => {
              '$and' => [
                  {'value' => {'$type' => 'string'}},
                  {'redirect_uri' => {'$type' => 'string'}},
                  {'user_id' => {'$type' => 'string'}},
                  {'client_id' => {'$type' => 'string'}}
              ]
          }
      }]
      @access_token_collection = @client[:tokens, {
          'validator' => {
              '$and' => [
                  {'value' => {'$type' => 'string'}},
                  {'user_id' => {'$type' => 'string'}},
                  {'client_id' => {'$type' => 'string'}}
              ]
          }
      }]
    end

    def self.quit
      @client.close
    end

    def self.clients
      @clients_collection
    end

    def self.codes
      @auth_code_collection
    end

    def self.tokens
      @access_token_collection
    end
  end
end