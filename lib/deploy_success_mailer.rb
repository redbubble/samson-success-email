module DeploySuccessMailer
  def self.deliver_success_email(deploy)
    if deploy.succeeded? && deploy.stage.send_success_email
      emails = deploy.changeset.commits.map(&:author_email).uniq

      Rails.logger.info "Sending success email"
      DeployMailer.deploy_failed_email(deploy, emails).deliver_now
      Rails.logger.info "Success email sent to #{emails.join(',')}"
    else
      Rails.logger.info "Not sending success email"
    end
  end
end
