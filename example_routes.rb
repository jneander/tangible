require "web/api_v1/app"

class Router
  include ::Tangible::Routing

  get  "/auth/sign-in", :show_sign_in
  post "/auth/sign-in", :sign_in
  delete "/users/:key", :delete_user

  within "/auth" do
    get "/sign-in", :show_sign_in
  end

  within "/admin", :admin do
    get "/index", :show_index #=> :admin_show_index
    get "/all", :show_all__ #=> :show_all_admin
    get "/some", :show__some #=> :show_admin_some
  end

  map "/api/v1", :api_v1, ::Project::Web::API::V1::App
end
