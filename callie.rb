class Callie < Sinatra::Base
  get '/queue' do
    content_type :json
    { queue: ["hi", "jacob"] }.to_json
  end
end
