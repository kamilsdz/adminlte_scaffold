module AdminlteScaffold
  module Generators
    module GeneratorHelpers
      attr_accessor :options, :attributes

      def model_columns_for_attributes
        class_name.constantize.columns.reject do |column|
          column.name.to_s =~ /^(id|user_id|created_at|updated_at)$/
        end
      end

      def editable_attributes
        attributes ||= model_columns_for_attributes.map do |column|
          Rails::Generators::GeneratedAttribute.new(column.name.to_s, column.type.to_s)
        end
      end

      def view_files
        actions = %w(index new edit _form show)
      end
    end
  end
end