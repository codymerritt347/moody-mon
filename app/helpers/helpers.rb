require 'sinatra/base'

class Helpers

  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

  def self.level_check(session)
    @monster = Monster.find_by(user_id: session[:user_id])
    if @monster.exp_points >= 100
      @monster.level += 1
      new_exp = @monster.exp_points - 100
      @monster.exp_points = new_exp
      @monster.save
    end
  end
end