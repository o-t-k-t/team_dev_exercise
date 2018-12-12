class Assign < ApplicationRecord
  belongs_to :user
  belongs_to :team

  before_destroy :require_owner_assign
  before_destroy :require_assined_user

  private

  def require_owner_assign
    return unless user == team.owner

    errors.add :base, 'リーダーは削除できません。'
    throw :abort
  end

  def require_assined_user
    return unless user.assigns.count > 1

    errors.add :base, 'このユーザーはこのチームにしか所属していないため、削除できません。'
    throw :abort
  end
end
