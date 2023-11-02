class AdminMailer < ApplicationMailer
  def update_email(current_admin, modified_admin)
    @current_admin = current_admin
    @modified_admin = modified_admin

    mail(to: @modified_admin.email, subject: "Seus dados foram alterados!")
  end
end
