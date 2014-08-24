module Refinery
  module Faq
    class Faq < Refinery::Core::BaseModel
      self.table_name = 'refinery_faqs'


      validates :title, :presence => true, :uniqueness => true
      validates :body,  :presence => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:title]

      has_many :categorizations, :dependent => :destroy, :foreign_key => :faq_id
      has_many :categories, :through => :categorizations, :source => :faq_category


      def newest_first
        order("published_at DESC")
      end


      def uncategorized
        newest_first.live.includes(:categories).where(
            Refinery::Faq::Categorization.table_name => { :faq_category_id => nil }
        )
      end

    end
  end
end
