require 'koala'

APP_ID = '1404236039627673'.freeze
APP_SECRET = '33576132e5aeb78ebca69a4107208d7d'.freeze
CALLBACK = 'http://jumanji.butts.rip/'.freeze


@facebook_client = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, CALLBACK)
