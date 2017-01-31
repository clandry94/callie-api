class Callie < Sinatra::Base
  register Sinatra::CrossOrigin
  configure do
    enable :cross_origin
  end

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
    resp = pop_song_queue
    resp.to_json
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

  def pop_song_queue
    begin
      $REDIS.rpop("songs")
      return { status: "ok" }
    rescue
      return { status: "error" }
    end
  end
end
