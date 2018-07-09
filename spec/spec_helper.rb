require 'vindicate'
require 'shoulda/matchers'

RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
end
