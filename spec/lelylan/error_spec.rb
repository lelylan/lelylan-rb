require 'helper'

describe 'Lelylan Error' do

  let(:lelylan) do
    a_client
  end

  describe 'Unauthorized Access' do

    before do
      stub_get('/devices/1').to_return(status: 401, body: fixture('errors/401.json'))
    end

    it 'raises a Lelylan::Unauthorized' do
      expect{ lelylan.device('1') }.to raise_error(Lelylan::Unauthorized, 'Token not valid')
    end
  end


  describe 'Not Found' do

    before do
      stub_get('/devices/1').to_return(status: 404, body: fixture('errors/404.json'))
    end

    it 'raises a Lelylan::NotFound' do
      expect{ lelylan.device('1') }.to raise_error(Lelylan::NotFound, 'Resource not found')
    end
  end


  describe 'Unprocessable Entity' do

    before do
      stub_get('/devices/1').to_return(status: 422, body: fixture('errors/422.json'))
    end

    it 'raises a Lelylan::UnprocessableEntity' do
      expect{ lelylan.device('1') }.to raise_error(Lelylan::UnprocessableEntity, 'Name can\'t be blank.')
    end
  end


  describe 'Internal Server Error' do

    before do
      stub_get('/devices/1').to_return(status: 500, body: 'Internal Error Server')
    end

    it 'raises a Lelylan::InternalServerError' do
      expect{ lelylan.device('1') }.to raise_error(Lelylan::InternalServerError, 'Internal Error Server')
    end
  end
end
