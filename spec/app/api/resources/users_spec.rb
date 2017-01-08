require_relative '../../../spec_helper.rb'

describe API do
  include Rack::Test::Methods
  ENV['RACK_ENV'] = 'test'

  def app
    API
  end

  context 'GET /api/v1/users' do
    it 'returns Fred and Sue users' do
      get '/api/v1/users'
      expect(last_response.status).to eq(200)
      result = JSON.parse(last_response.body)
      expect(result.length).to eq(2)
      expect(result[0]['first_name']).to eq('Fred')
      expect(result[0]['last_name']).to eq('Fredley')
      expect(result[0]['username']).to eq('fredguy')
      expect(result[0]['email']).to eq('fredguy@gmail.com')
      expect(result[1]['first_name']).to eq('Sue')
      expect(result[1]['last_name']).to eq('Sueley')
      expect(result[1]['username']).to eq('suesue')
      expect(result[1]['email']).to eq('suesue@gmail.com')
    end
  end
end
