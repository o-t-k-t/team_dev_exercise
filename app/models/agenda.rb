class Agenda < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :articles, dependent: :destroy

  def destroy_with_notification
    member_emails = team.members.map(&:email)
    TeamMailer.agenda_deletion_mail(title, member_emails).deliver
    destroy
  end
end
