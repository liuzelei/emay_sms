require "mongoid"

module EmaySms
  module Models
    class Log
      include Mongoid::Document
      field :method, type: String
      field :params, type: Hash
      field :response, type: Hash
      field :logged_at, type: DateTime

      before_create do
        self.logged_at = Time.now
      end
    end
  end
end