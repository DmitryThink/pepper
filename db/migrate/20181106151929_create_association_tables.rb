class CreateAssociationTables < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users_tags do |t|
      t.belongs_to :admin_user, index: true
      t.belongs_to :tag, index: true
    end

    create_table :offers_tags do |t|
      t.belongs_to :offer, index: true
      t.belongs_to :tag, index: true
    end

    create_table :offers_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :offer, index: true
    end

    create_table :tags_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :tag, index: true
    end
  end
end
