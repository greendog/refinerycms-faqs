module Refinery
  module Faq
    class Categorization < ActiveRecord::Base

      self.table_name = 'refinery_faq_categories_faqs'
      belongs_to :faq, :class_name => 'Refinery::Faq', :foreign_key => :faq_id
      belongs_to :faq_category, :class_name => 'Refinery::Faq::Category', :foreign_key => :faq_category_id

    end
  end
end
