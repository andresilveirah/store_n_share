class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content, only: [:show, :edit, :update, :destroy]

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

  private
    def set_content
      @content = current_user.contents.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:url, attachments_attributes: [:id, :image, :_destroy])
    end
end
