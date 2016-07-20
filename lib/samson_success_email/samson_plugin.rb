require_relative '../deploy_success_mailer'

module SamsonSuccessEmail
  class Engine < Rails::Engine
  end
end

Samson::Hooks.view :stage_form, "samson_success_email/fields"

Samson::Hooks.callback :stage_clone do |old_stage, new_stage|
  new_stage.send_success_email = old_stage.send_success_email
end

Samson::Hooks.callback :stage_permitted_params do
  [:send_success_email]
end

Samson::Hooks.callback :after_deploy do |deploy, _|
  DeploySuccessMailer.deliver_success_email(deploy)
end
