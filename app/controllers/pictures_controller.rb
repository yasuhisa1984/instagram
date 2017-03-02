class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:edit, :update, :destroy]


  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = Picture.new(pictures_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "投稿しました!"
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      #redirect_to Pictures_path, notice: "ブログを作成しました!"
      #NoticeMailer.sendmail_Picture(@picture).deliver
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end

  def edit
  end

  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "更新しました！"
    else
      render 'edit'
    end
  end



  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "削除しました!"
  end


  private
    def pictures_params
      params.require(:picture).permit(:title, :content, :picture)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
