module Refinery
  module Faq
    module Admin
      class FaqController < ::Refinery::AdminController

        crudify :'refinery/faq/faq',
                :xhr_paging => true

        before_filter :find_all_categories,
                      :only => [:new, :edit, :create, :update]

        before_filter :check_category_ids, :only => :update

        def uncategorized
          @faqs = Refinery::Faq::Faq.uncategorized.page(params[:page])
        end



        protected

        def faq_params
          params.require(:faq).permit(:title, :body, :position, :category_ids => [])
        end

        def find_all_categories
          @categories = Refinery::Faq::Category.all
        end

        def check_category_ids
          faq_params[:category_ids] ||= []
        end

      end
    end
  end
end
