class AssignsController < ApplicationController
  before_action :authenticate_user!
  include TeamHelper

  def create
    team = Team.friendly.find(params[:team_id])
    user = email_reliable?(assign_params) ? User.find_or_create_by_email(assign_params) : nil
    if user
      team.invite_member(user)
      redirect_to team_url(team), notice: 'アサインしました！'
    else
      redirect_to team_url(team), notice: 'アサインに失敗しました！'
    end
  end

  def destroy
    assign = Assign.find(params[:id])

    unless deletable_asign?(assign)
      redirect_to team_url(params[:team_id]), notice: 'リーダー・本人以外はメンバー削除はできません。'
      return
    end

    unless assign.destroy
      redirect_to team_url(params[:team_id]), notice: assign.errors.full_messages.join("\n")
      return
    end

    user = assign.user
    change_keep_team(user, user.teams.first) if user.keep_team_id == assign.team_id

    redirect_to team_url(params[:team_id]), notice: 'メンバーを削除しました。'
  end

  private

  def assign_params
    params[:email]
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end
end
