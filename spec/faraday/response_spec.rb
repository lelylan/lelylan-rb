# -*- encoding: utf-8 -*-
require 'helper'

describe Faraday::Response do

  let(:client) do
    Lelylan::Client.new
  end

  {
    400 => Lelylan::BadRequest,
    401 => Lelylan::Unauthorized,
    403 => Lelylan::Forbidden,
    404 => Lelylan::NotFound,
    406 => Lelylan::NotAcceptable,
    422 => Lelylan::UnprocessableEntity,
    500 => Lelylan::InternalServerError,
    501 => Lelylan::NotImplemented,
    502 => Lelylan::BadGateway,
    503 => Lelylan::ServiceUnavailable,
  }.each do |status, exception|

    context "when HTTP status is #{status}" do

      before do
        stub_get('http://api.lelylan.com/devices').
          to_return(:status => status)
      end

      it "should raise #{exception.name} error" do
        expect do
          client.devices
        end.to raise_error(exception)
      end
    end
  end
end
