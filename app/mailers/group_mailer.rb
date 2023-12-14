class GroupMailer < ApplicationMailer
  default from: 'notifications@steamers.com'    # このメイラーの送り元のデフォルトメールアドレスを設定

  def send_mail
      mail(                                    # メールの作成
        from: params[:owner_email],            # 送り元のメールアドレス
        to: params[:user_email],               # 宛先のメールアドレス
        subject: params[:title]                # メールのタイトル
      )
  end
end
