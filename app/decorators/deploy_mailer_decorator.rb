DeployMailer.class_eval do
  def deploy_success_email(deploy, emails)
    # `deploy_failure_email` actually does exactly what we want,
    # it's just that the name doesn't describe what we're doing.
    deploy_failure_email(deploy, emails)
  end
end
