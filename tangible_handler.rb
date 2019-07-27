class AuthenticatedHandler < ::Tangible::Handler
  before do
    send unauthorized unless current_user? && has_permission?
  end
end

class UpdateUser < AuthenticatedHandler
  use_form UserForm

  listen :update_user do
    result = App::Core.update_user(form.to_h)
    if result.good?
      return 200
    else
      return 500
    end
  end
end
