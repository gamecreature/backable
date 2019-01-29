require 'backable/railtie'
require 'backable/controller_concern'
require 'backable/view_helpers'

module Backable
  mattr_accessor :fallback_url do
    Rails.env.development? ? "http://watbenjedan.nl/" : :back
  end
end
