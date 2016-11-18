require File.expand_path(File.join(__dir__, '../db/mongo'))

class CheckAccessToken
  def self.valid(full_access_token, user_id)
    bearer_and_token = full_access_token.split(%r/\s+/)

    raise Exception('Expected the auth header to be in the form: Bearer <token>') if bearer_and_token.size != 2
    raise Exception('Expected the auth type to be "Bearer"') if bearer_and_token[0] != 'Bearer'

    access_token = bearer_and_token[1]

    has_access_token_for_user = AppMongo::DbInit::tokens::find({'user_id': user_id, 'value': access_token}).to_a.any?

    unless has_access_token_for_user
      raise Exception('No access token for the user')
    end

  end
end