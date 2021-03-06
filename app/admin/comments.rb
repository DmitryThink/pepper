ActiveAdmin.register Comment, as: "Offers Comment" do
  actions :index, :show, :destroy, :update
  controller do
    def scoped_collection
      ids = []
      current_admin_user.tags.each do |tag|
        tag.offers.each do |offer|
          ids << offer.id
        end
      end
      end_of_association_chain
    end
  end
end
