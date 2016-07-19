class AddSendSuccessEmailToStage < ActiveRecord::Migration
  def change
    add_column :stages, :send_success_email, :boolean, default: true
end
