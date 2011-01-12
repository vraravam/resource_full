module ResourceFull
  module Render
    module HTML
      protected

      def show_html
        self.model_object = self.find_model_object
      rescue ActiveRecord::RecordNotFound => e
        flash[:error] = e.message
      rescue => e
        flash[:error] = e.message
        redirect_to :back
      end

      def index_html
        self.model_objects = self.find_all_model_objects
      end

      def count_html
        self.count_all_model_objects
      end

      def new_html
        self.model_object = self.new_model_object
      end

      def create_html_success_message
        "Successfully created #{model_name.humanize} with ID of #{model_object.id}."
      end
      def create_html_success_action
        redirect_to :action => :index, :format => :html
      end
      def create_html_failure_action
        render :action => "new"
      end
      def create_html
        self.model_object = transactional_create_model_object
        if model_object.errors.empty?
          flash[:notice] = create_html_success_message
          create_html_success_action
        else
          flash[:error] = "There was an error creating the #{model_name.humanize}"
          create_html_failure_action
        end
      rescue => e
        flash[:error] = "There was an error creating the #{model_name.humanize}" + e.message
        redirect_to :back
      end

      def edit_html
        self.model_object = self.edit_model_object
      end

      def update_html_success_message
        "Successfully updated #{model_name.humanize} with ID of #{model_object.id}."
      end
      def update_html_success_action
        redirect_to :action => :index, :format => :html
      end
      def update_html_failure_action
        render :action => "edit"
      end
      def update_html
        self.model_object = transactional_update_model_object
        if model_object.errors.empty?
          flash[:notice] = update_html_success_message
          update_html_success_action
        else
          flash[:error] = "There was an error updating the #{model_name.humanize}"
          update_html_failure_action
        end
      rescue => e
        flash[:error] = "There was an error updating the #{model_name.humanize}" + e.message
        redirect_to :back
      end

      def destroy_html_success_message
        "Successfully destroyed #{model_name.humanize} with ID of #{params[:id]}."
      end
      def destroy_html_success_action
        redirect_to :action => :index, :format => :html
      end
      def destroy_html
        self.model_object = transactional_destroy_model_object
        if model_object.errors.empty?
          flash[:notice] = destroy_html_success_message
          destroy_html_success_action
        else
          flash[:error] = model_object.errors
        end
      rescue ActiveRecord::RecordNotFound => e
        flash[:error] = "There was an error destroying the #{model_name.humanize}" + e.message
        redirect_to :back
      rescue => e
        flash[:error] = "There was an error destroying the #{model_name.humanize}" + e.message
        redirect_to :back
      end
    end
  end
end
