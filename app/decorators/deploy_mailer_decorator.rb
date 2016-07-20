DeployMailer.class_eval do
  Rails.logger.info "Decorating DeployMailer"

  def deliver_success_email(deploy, emails)
    Rails.logger.info "Sending deploy success email to #{emails.join ','}"
    # `deploy_failure_email` actually does exactly what we want,
    # it's just that the name doesn't describe what we're doing.
    deploy_failure_email(deploy, emails).deliver_now
  end
end
