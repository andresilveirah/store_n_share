class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content, only: [:show, :edit, :update, :destroy, :share]

  respond_to :html
  
  def index
    @contents = current_user.contents
  end

  def show
    respond_with(@content)
  end

  def new
    @content = current_user.contents.build
    respond_with(@content)
  end

  def edit
  end

  def create
    @content = current_user.contents.build(content_params)
    @content.save
    respond_with(@content)
  end

  def update
    @content.update(content_params)
    respond_with(@content)
  end
  
  def destroy
    @content.destroy
    redirect_to root_path
  end
  
  def share
    friend = User.find_or_create_by(email: params[:share][:email])
    friend.shared_contents << @content
    redirect_to content_path(@content), notice: 'Content shared'
  end
  
  def shared
    @content = Content.find(params[:id])
    if @content.shared_users.include?(current_user)
      render
    else
      redirect_to root_path, error: "This content wasn't shared with you."
    end
  end

  private
    def set_content
      @content = current_user.contents.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:url, attachments_attributes: [:id, :image, :_destroy])
    end
end
