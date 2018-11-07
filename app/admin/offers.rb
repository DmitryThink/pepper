ActiveAdmin.register Offer do
  index do
    selectable_column
    column :name
    column :description
    column :actual_price
    column :original_price
    column :discount
    column :url
    column :created_at
    column :user
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :actual_price
      row :original_price
      row :discount
      row :url
      row :created_at
      row :user
    end

    panel :comments do
      table_for(offer.comments) do
        column :id do |comment|
          link_to(comment.id, admin_offers_comment_url(comment.id))
        end
        column :text
        column :user
      end
    end
  end

  controller do
    def scoped_collection
      end_of_association_chain.where(tags: current_admin_user.tags)
    end
  end
end
