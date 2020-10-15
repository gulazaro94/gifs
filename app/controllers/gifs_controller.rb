class GifsController < ApplicationController
  def index
    @gifs = Gif.includes(:labels).order(id: :desc).all
  end

  def new
    @gif = Gif.new
    @label_options = Label.order(:name).pluck(:name, :id)
  end

  def create
    @gif = Gif.new(gif_params)

    if @gif.save
      redirect_to gifs_path, notice: 'GIF uploaded successfully'
    else
      render :new
    end
  end

  private

  def gif_params
    return {} unless params[:gif]

    params.require(:gif).permit(:image, label_ids: [])
  end
end
