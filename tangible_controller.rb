class Controller
  include ::Tangible::Control

  listen :update_profile, form: ProfileForm do
    result = Core.update_profile(form.to_h)
    case result.message
    when :not_found
      render views.not_found
    when :success
      set user_profile: result.profile
      render views.show_profile
    else
      raise OutOfExamples
    end
  end
end

class Controller
  use form: Project::Web::ProfileForm

  use_form edit_user: Project::Web::ProfileForm
  use_forms {
    edit_user: Project::Web::EditProfileForm,
    new_user: Project::Web::NewProfileForm
  }

  listen :show_profile, [:id]
    # logic
  end

  listen :update_profile, [:id]
    Core.profiles.update(id, edit_form)
    # logic
  end
end
