include ApplicationHelper
RailsAdmin.config do |config|
 config.authorize_with do
    redirect_to main_app.login_path unless current_user.role == "admin"
  end
  config.current_user_method(&:current_user)

  config.actions do
  dashboard 
  index  
  new
  export
  bulk_delete
  show
  edit
  delete
  show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
