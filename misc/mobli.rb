require 'rubygems'
require 'rest-client'
require 'json'

resp = JSON.parse(RestClient.post('https://api.mobli.com/media',
  'file' => File.new('/Users/chris/Projects/ProjectStalker/misc/binoculars.jpg'),
  #'access_token' => 'a.489hbemkuod5l2v06eu5orp0t4',
  'access_token' => 'a.2kg2vfk2akfaref2rbdpq50pq1',
  'type' => 'photo',
  'extension' => 'jpg',
  'channels_list[]' => '4',
  'channels_list[]' => '3',
  'text' => 'Blah 123',
  'date_taken' => '18.05.2012',
  'geo_lat' => '32.0701',
  'geo_long' => '34.5678'))
if resp['success']
  id = resp['payload']['id']
  puts resp['payload']['assets']
end

#puts resp.inspect
#"{\"success\":true,\"payload\":{\"id\":\"7773851\",\"owner_id\":\"4171945\",\"type\":1,\"title\":\"Blah 123\",\"geo_lat\":32.0701,\"geo_long\":34.5678,\"city_id\":\"59\",\"country_id\":\"4\",\"view_count\":0,\"favorites_count\":0,\"love_count\":0,\"width\":616,\"height\":569,\"comment_count\":0,\"orientation\":-1,\"created_at\":\"2012-05-20 12:28:04\",\"updated_at\":\"2012-05-20 12:28:04\",\"assets\":{\"image\":\"http:\\/\\/stat.mobli.com\\/media_stills\\/media_7773851.jpg\",\"thumbs\":{\"prefix\":\"http:\\/\\/stat.mobli.com\\/thumbs\\/thumb_7773851_\",\"ext\":\"jpg\",\"sizes\":[\"80x80\",\"30x30\",\"156x156\",200,300,400]}},\"Channels\":[{\"id\":\"3\",\"name\":\"Gadget\",\"description\":\"\",\"category_id\":\"16\",\"viewers_count\":14837,\"media_count\":8208,\"is_mobile_branded\":\"0\",\"type\":\"subject\",\"created_at\":\"2010-10-06 15:30:32\",\"updated_at\":\"2012-01-03 17:35:49\",\"thumbnails\":{\"prefix\":\"http:\\/\\/stat.mobli.com\\/thumbs\\/thumb_7770928_\",\"ext\":\"jpg\",\"sizes\":[\"80x80\",\"156x156\"]},\"Category\":{\"id\":\"16\",\"name\":\"Tech & Gadgets\",\"color_name\":\"blue3\",\"color_rgb\":\"(80,103,200)\"}},{\"id\":\"195126\",\"name\":\"Tel Aviv\",\"category_id\":\"1\",\"viewers_count\":553,\"media_count\":31323,\"is_mobile_branded\":\"0\",\"type\":\"city\",\"geo_lat\":\"32.183300\",\"geo_long\":\"34.876700\",\"city_id\":\"59\",\"country_id\":\"4\",\"created_at\":\"2012-01-18 11:30:59\",\"updated_at\":\"2012-01-18 11:30:59\",\"Category\":{\"id\":\"1\",\"name\":\"Other\",\"color_name\":\"blue2\",\"color_rgb\":\"(23,139,197)\"}},{\"id\":\"477378\",\"user_id\":\"4171945\",\"name\":\"developeruser\",\"category_id\":\"1\",\"viewers_count\":1,\"media_count\":0,\"is_mobile_branded\":\"0\",\"type\":\"user\",\"created_at\":\"2012-05-19 18:28:51\",\"updated_at\":\"2012-05-19 18:28:51\",\"Category\":{\"id\":\"1\",\"name\":\"Other\",\"color_name\":\"blue2\",\"color_rgb\":\"(23,139,197)\"}}],\"Tags\":[],\"Fans\":[],\"Likes\":[],\"Owner\":{\"id\":\"4171945\",\"gender\":\"0\",\"location\":\"Netanya, Israel\",\"viewers_count\":1,\"media_count\":0,\"notifications_count\":1,\"watch_count\":60,\"watching_channels_count\":20,\"media_favorited_count\":0,\"thumbnails\":{\"prefix\":\"http:\\/\\/www.mobli.com\\/images\\/content_images\\/user_thumb_\",\"ext\":\"jpg\",\"sizes\":[\"small\",\"normal\"]},\"first_name\":\"developer \",\"last_name\":\"user\",\"username\":\"developeruser\"}}}"
