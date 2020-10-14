class GifsController < ApplicationController
  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.new(gif_params)

    if @gif.save
      redirect_to new_gif_path, notice: 'GIF uploaded successfully'
    else
      render :new
    end
  end

  private

  def gif_params
    return {} unless params[:gif]

    params.require(:gif).permit(:image)
  end
end
