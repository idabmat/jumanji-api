module Social
  class FacebookPoster
    require 'koala'

    attr_reader :graph_client

    def initialize(access_token:)
      @graph_client = Koala::Facebook::API.new(access_token, APP_ID)
    end

    def post(message: 'I HAVE FAILED')
      graph_client.put_wall_post(message)
    end
  end
end
