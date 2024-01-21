# frozen_string_literal: true
require "rails/generators"

module UnifonicIntegration
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def create_initializer_file
        copy_file "unifonic_integration_init.rb", "config/initializers/unifonic_integration.rb"
      end
    end
  end
end
