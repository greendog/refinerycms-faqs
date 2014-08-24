class CreateFaqStructure < ActiveRecord::Migration

  def up
    create_table :refinery_faqs do |t|
      t.string :title
      t.text :body
      t.datetime :publish_date
      t.integer :position

      t.timestamps
    end

    create_table :refinery_faq_categories do |t|
      t.string :title
      t.timestamps
    end

    add_index :refinery_faq_categories, :id

    create_table :refinery_faq_categories_faqs do |t|
      t.integer :faq_category_id
      t.integer :faq_id
    end

    add_index :refinery_faq_categories_faqs, [:faq_category_id, :faq_id], :name => 'index_faq_categories_faqs_on_bc_and_bp'


    Refinery::Faq::Category.create_translation_table!({
                                                           :title => :string
                                                       }, {
                                                           :migrate_data => true
                                                       })


  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-faqs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/faqs/faqs"})
    end

    drop_table :refinery_faqs

  end

end
