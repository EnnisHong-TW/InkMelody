class SessionsController < ApplicationController
  def create
    # 檢查帳密
    # 雜湊 hashed
    # pw = Digest::SHA256.hexdigest("*xx#{params[:user][:password]}yy-")
    # user = User.find_by(email: params[:email], password: encrypt_password(params[:password]))
    user = User.login(params[:user])
    if user
      session[:__user_ticket__] = user.id
      redirect_to root_path, notice: '登入成功'
    else
      redirect_to sign_in_users_path, alert: '登入失敗'
    end
    # render html: params
  end

  def destroy
    # session[@__user_ticket__] = nil
    session.delete(:__user_ticket__)
    redirect_to root_path, notice: '已登出'
  end
end
