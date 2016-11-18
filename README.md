# ruby-oauth-spike
Spike on studying the

  - http://scottksmith.com/blog/2014/07/02/beer-locker-building-a-restful-api-with-node-oauth2-server/
  - http://cakebaker.42dh.com/2011/01/10/2-legged-vs-3-legged-oauth/
  - http://stackoverflow.com/a/13384100/425533

Need to track apps that can be authenticated (in-memory or in db or something)...
  - Application name
  - Application id   # App client id (should be gen'd)
  - Application secret  # App secret (should be gen'd)
  - Application userId

Need to authenticate app client accessing a resource...
  - If the username (app id) and password (secret) are not found, user is not authenticated
  - Otherwise, authenticated.

Need to gen and store authorization codes...
  - Application authorization code
  - Application redirect URI
  - Application userId, from the other table
  - Application id, from other table

Need to gen and hold access tokens...
  - Access token value (strong hash)
  - Application userId, from other table
  - Application id, from other table

Need way to authenticate using access tokens
  - As soon as an authorization code is used, it needs to be trashed
 
------------------------------------------------

Client (Application registry)
  - name (App name)
  - id (App client id)
  - secret (App secret)
  - userId (App userId)

Code (Authorization codes)
  - value (App authorization code)
  - redirectUri (used for grants and grant exchange for access token)
  - userId <Client.userId>
  - clientId <Client.id>

Token (Access tokens)
  - value (strong hash)
  - userId <Client.userId>
  - clientId <Client.id>


