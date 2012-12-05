class Clients::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    auth = request.env["omniauth.auth"]
    data = auth.info

    @client = Client.where(:email => data["email"]).first

    unless @client
      @client = Client.create(:name     => data["name"],
                              :email    => data["email"],
                              :provider => auth.provider,
                              :uid      => auth.uid,
                              :password => Devise.friendly_token[0,20])
    end

    if @client.persisted?
      sign_in_and_redirect @client, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_client_registration_url
    end 
  end
end
