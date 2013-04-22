module OmniAuth::Droom
  if defined? Rails::Railtie && defined? Devise
    require 'rails'
    class Railtie < ::Rails::Railtie
      paths["app/controllers"] << File.expand_path("../../app/controllers", __FILE__)
    end
  end
end


