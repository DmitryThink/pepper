ActiveAdmin.register Offer, as: "Confirmed Offer" do
  permit_params :name, :url, :description, :original_price, :actual_price, :user, :avatar
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
    column "Image" do |product|
      image_tag product.avatar.url(:medium), class: 'my_image_size'
    end
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
      row "Image" do |product|
        image_tag product.avatar.url(:medium), class: 'my_image_size'
      end
    end

    panel :comments do
      table_for(resource.comments) do
        column :id do |comment|
          link_to(comment.id, admin_offers_comment_url(comment.id))
        end
        column :text
        column :user
      end
    end

    panel :tags do
      table_for(resource.tags) do
        column :name
        column :delete do |tag|
          link_to("Delete", tag_delete_admin_confirmed_offer_url(tag.id, resource.id),
                  method: :post)
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :avatar, as: :file
      f.input :name
      f.input :description
      f.input :original_price
      f.input :actual_price
      f.input :url
      f.input :tag, :as => :select, :collection => Tag.all
    end
    f.actions
  end

  controller do
    def create
      super
      Offer.last.tags << Tag.find(params[:offer][:tag]) if params[:offer][:tag].present?
    end

    def update
      Offer.find(params[:id]).tags << Tag.find(params[:offer][:tag]) if params[:offer][:tag].present?
      super
    end

    def scoped_collection
      if current_admin_user.email == 'admin@example.com'
        end_of_association_chain.where(confirmed: true)
      else
        end_of_association_chain.where(confirmed: true).where(tags: current_admin_user.tags)
      end
    end

    # def user_params
    #   params.require(:offer).permit(:name, :description, :url, :actual_price, :original_price, :avatar, :user_id)
    # end
  end

  member_action :tag_delete, method: :post do
    Offer.find(params[:format]).tags.delete(Tag.find(params[:id]))
    redirect_to admin_confirmed_offer_url(params[:format])
  end
end
