# frozen_string_literal: true

module Admin
  class <%= class_name %>Decorator < BaseDecorator
    delegate_all

    def self.new_link(link = %i[new admin <%= singular_name %>])
      super
    end
  end
end
