require 'generators/adminlte_scaffold/generator_helpers'
require 'rails/generators/active_model'

module AdminlteScaffold
  module Generators
    class ControllerGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      include AdminlteScaffold::Generators::GeneratorHelpers
      desc "Generates controller, controller_spec and views for the model with the given NAME."

      source_root File.expand_path('../templates', __FILE__)

      def copy_controller_and_spec_files
        template "controller.rb", File.join("app/controllers/admin", "#{controller_file_name}_controller.rb")
        template "spec/controller.rb", File.join("spec/controllers/admin", "#{controller_file_name}_controller_spec.rb")
        template "factories/model.rb", File.join("spec/factories", "#{singular_name}.rb")
        template "decorator/decorator.rb", File.join("app/decorators/admin", "#{singular_name}_decorator.rb")
      end

      def copy_view_files
        directory_path = File.join("app/views/admin", controller_file_path)
        empty_directory directory_path

        view_files.each do |file_name|
          template "views/#{file_name}.haml", File.join(directory_path, "#{file_name}.haml")
        end
      end
    end
  end
end