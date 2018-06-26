# frozen_string_literal: true

module Admin
  class <%= controller_class_name %>Controller < BaseController
    def index
      collection = <%= class_name %>
      @<%= plural_name %> = <%= class_name %>Decorator.decorate_collection collection.page(params[:page])
      @decorator_class = <%= class_name %>Decorator
    end
    
    def show
      @<%= singular_name %> = find_<%= singular_name %>
    end
    
    def new
      @<%= singular_name %> = <%= class_name %>.new
    end
    
    def edit
      @<%= singular_name %> = find_<%= singular_name %>
    end
    
    def create
      @<%= singular_name %> = <%= class_name %>.new(<%= singular_name %>_params)
      if @<%= singular_name %>.save
        redirect_to admin_<%= plural_name %>_path
      else
        render 'new'
      end
    end
    
    def update
      @<%= singular_name %> = find_<%= singular_name %>
      if @<%= singular_name %>.update(<%= singular_name %>_params)
        redirect_to admin_<%= plural_name %>_path
      else
        render 'edit'
      end
    end
    
    def destroy
      @<%= singular_name %> = find_<%= singular_name %>
      @<%= singular_name %>.destroy
      redirect_to admin_<%= plural_name %>_path
    end

    private
    
    def <%= singular_name %>_params
      params.require(:<%= singular_name %>).permit(<%= editable_attributes.map! { |a| a.name.dup.prepend(':') }.join(', ') %>)
    end
    
    def find_<%= singular_name %>
      <%= class_name %>.find(params[:id])
    end
  end
end