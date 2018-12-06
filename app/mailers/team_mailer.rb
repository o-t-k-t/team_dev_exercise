class TeamMailer < ApplicationMailer
  default from: 'from@example.com'

  def ownership_mail(team_name, owner_email)
    @team_name = team_name
    @owner_email = owner_email

    mail to: @owner_email, subject: 'チームリーダー任命'
  end

  def agenda_deletion_mail(agenda_title, member_emails)
    @agenda_title = agenda_title
    @member_emails = member_emails

    mail to: @member_emails, subject: 'アジェンダが削除されました'
  end
end
