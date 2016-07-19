require 'faraday'

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

# TODO: Something similar, but email, and only when it's successful.
Samson::Hooks.callback :after_deploy do |deploy|
  if deploy.succeeded? && deploy.stage.send_success_email
    committers = deploy.changeset.commits.map(&:author_email).uniq
    DeployMailer.deploy_success_email(deploy, committers)
  end
end
