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
  Rails.logger.info "SuccessEmail after_deploy hook running - Deploy status #{deploy.status}, Send success email #{deploy.stage.send_success_email}."
  if deploy.succeeded? && deploy.stage.send_success_email
    Rails.logger.info "Sending success email"
    committers = deploy.changeset.commits.map(&:author_email).uniq
    DeployMailer.deploy_failed_email(deploy, committers).deliver_now
    Rails.logger.info "Success email sent to #{committers.join(',')}"
  else
    Rails.logger.info "Not sending success email."
  end
end
