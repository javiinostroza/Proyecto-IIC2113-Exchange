ActiveAdmin.register Balance do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :amount, :wallet_id, :market_id, :cryptocurrency_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:amount, :wallet_id, :market_id, :cryptocurrency_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
