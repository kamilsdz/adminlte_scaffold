# frozen_string_literal: true

require 'rails_helper'

describe Admin::<%= controller_class_name %>Controller do
  render_views
  describe '#index' do
    before do
      moderator = create(:moderator)
      sign_in moderator
      @<%= singular_name %> = create(:<%= singular_name %>)
      get :index
    end
    
    it 'returns index' do
      expect(response.status).to be 200
    end

    it 'checks if index contain <%= singular_name %> id' do
      expect(response.body).to have_content(@<%= singular_name %>.id)
    end
  end
  
  describe '#show' do
    before do
      moderator = create(:moderator)
      sign_in moderator
      @<%= singular_name %> = create(:<%= singular_name %>)
      get :show, params: { id: @<%= singular_name %>.id }
    end

    it 'returns show' do
      expect(response.status).to be 200
    end
    <% editable_attributes.each do |attribute| %>
    it 'checks if index contain <%= singular_name %> <%= attribute.name %>' do
      expect(response.body).to have_content(@<%= singular_name %>.<%= attribute.name %>)
    end 
    <% end -%>
  end

  describe '#new' do
    before do
      moderator = create(:moderator)
      sign_in moderator
      get :new
    end

    it 'returns new' do
      expect(response.status).to be 200
    end
  end

  describe '#destroy' do
    before do
      moderator = create(:moderator)
      sign_in moderator
      @<%= singular_name %> = create(:<%= singular_name %>)
    end

    it 'deletes the <%= singular_name %>' do
      expect { delete :destroy, params: { id: @<%= singular_name %>.id } }.to change(<%= class_name %>, :count).by(-1)
    end
  
    it 'redirects to admin/<%= plural_name %>#index' do
      delete :destroy, params: { id: @<%= singular_name %>.id }
      expect(response).to redirect_to admin_<%= plural_name %>_path
    end
  end

  describe '#create' do
    before do
      moderator = create(:moderator)
      sign_in moderator
    end

    it 'creates a new <%= singular_name %>' do
      expect  do
        post :create, params: { <%= singular_name %>: attributes_for(:<%= singular_name %>) }
      end.to change(<%= class_name %>, :count).by(1)
    end

    it 'redirects to admin/<%= plural_name %>#index' do
      post :create, params: { <%= singular_name %>: attributes_for(:<%= singular_name %>) }
      expect(response).to redirect_to admin_<%= plural_name %>_path
    end
  end

  describe '#update' do
    before do
      moderator = create(:moderator)
      sign_in moderator
      @<%= singular_name %> = create(:<%= singular_name %>)
    end

    it 'updates the <%= singular_name %>' do
      put :update, params: { id: @<%= singular_name %>.id, <%= singular_name %>: attributes_for(:<%= singular_name %>, TODO:atrib_name: 'My new title') }
      @<%= singular_name %>.reload
      expect(@<%= singular_name %>.TODO:atrib_name).to eq('My new title')
    end

    it 'redirects to admin/<%= plural_name %>#index' do
      put :update, params: { id: @<%= singular_name %>.id, <%= singular_name %>: attributes_for(:<%= singular_name %>) }
      expect(response).to redirect_to admin_<%= plural_name %>_path
    end
  end

  describe '#index' do
    before do
      @<%= singular_name %> = create(:<%= singular_name %>)
      get :index
    end

    it 'returns 302 not authorized' do
      expect(response.status).to be 302
    end
  end
end
