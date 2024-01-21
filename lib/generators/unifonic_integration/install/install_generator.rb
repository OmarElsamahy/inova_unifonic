# frozen_string_literal: true

require "rails/generators"

module UnifonicIntegration
  module Generators
    # The `Generator` class provides a copy of the initialization file to the config/initializers folder in directory.
    # It allows setting up the credentials for unifonic integration
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def create_initializer_file
        copy_file "unifonic_integration_init.rb", "config/initializers/unifonic_integration.rb"
      end
    end
  end
end
