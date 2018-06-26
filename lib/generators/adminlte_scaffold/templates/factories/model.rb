# frozen_string_literal: true

FactoryBot.define do
  factory :<%= singular_name %> do <% editable_attributes.each do |attribute| %>
    <%= attribute.name %> 'TODO: insert value' <% end -%>

  end
end
