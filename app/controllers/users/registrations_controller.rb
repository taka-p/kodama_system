class Users::RegistrationsController < Devise::RegistrationsController
# 管理者ユーザーの作成について参考URL
# http://blog.panicblanket.com/archives/2054
# http://qiita.com/MasatoYoshioka@github/items/7de96ac05bc0c17b7535

    prepend_before_filter :require_no_authentication, :only => [ :cancel]
    prepend_before_filter :authenticate_scope!, :only => [:new, :create ,:edit, :update, :destroy]

  def new
    @user = User.new
    @noadmin = User.where('admin = ?', true).empty?
  end

end