class TeamMailer < ApplicationMailer
  default from: 'from@example.com'

  def ownership_mail(team_name, owner_email)
    @team_name = team_name
    @owner_email = owner_email

    mail to: @owner_email, subject: 'チームリーダー任命'
  end
end
