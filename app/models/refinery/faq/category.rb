module Refinery
  module Faq
    class Category < ActiveRecord::Base
      extend FriendlyId

      translates :title

      friendly_id :title, :use => [:globalize]

      has_many :categorizations, :dependent => :destroy, :foreign_key => :faq_category_id
      has_many :faqs, :through => :categorizations, :source => :faq, :class_name => "Refinery::Faq::Faq"

      validates :title, :presence => true, :uniqueness => true

      def self.translated
        with_translations(::Globalize.locale)
      end

      def faq_count
        faqs.live.with_globalize.count
      end

    end
  end
end
