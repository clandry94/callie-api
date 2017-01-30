class Callie < Sinatra::Base
  get '/queue' do
    content_type :json
    { queue: get_song_queue }.to_json
  end

  post '/queue' do
    content_type :json
    push_song_queue params[:url]
    { queue: get_song_queue }.to_json
  end

  post '/queue/pop' do
    content_type :json
    #pop_song_queue
   
  end

  def push_song_queue url
    $REDIS.rpush "songs", url
  end

  def get_song_queue
    $REDIS.lrange "songs", -100, 100
  end

  def get_top
    $REDIS.lindex "songs", 0
  end
end
