ActiveAdmin.register Product do
  scope :not_exp


  index do
    column :name
    column :description
    column :expire
    column :store
    column "Release Date", :created_at
    column :price, :sortable => :price do |product|
      div :class => "price" do
        number_to_currency product.price
      end
    end
    actions
  end
end
