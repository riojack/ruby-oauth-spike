require File.expand_path(File.join(__dir__, '../db/mongo'))

class CheckAppCredentials
  def self.validate(client_id, client_secret)
    has_client_and_secret = AppMongo::DbInit::clients::find({'client_id': client_id, 'secret': client_secret}).to_a.any?

    unless has_client_and_secret
      raise Exception('No client match found')
    end
  end
end