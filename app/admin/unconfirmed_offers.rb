ActiveAdmin.register Offer, as: "Unconfirmed Offer" do
  actions :index, :show, :edit, :update
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
    column :confirm do |offer|
      link_to("Confirm",
              confirm_admin_unconfirmed_offer_url(offer.id),
              method: :post)
    end
    actions
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
    def scoped_collection
      if current_admin_user.email == 'admin@example.com'
        end_of_association_chain.where(confirmed: false)
      else
        end_of_association_chain.where(confirmed: false).where(tags: current_admin_user.tags)
      end
    end
  end


  member_action :confirm, method: :post do
    resource.update!(confirmed: !resource.confirmed)
    redirect_to admin_unconfirmed_offers_url
  end
end
