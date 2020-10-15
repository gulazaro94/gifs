class LabelsController < ApplicationController
  def index
    @labels = Label.order(id: :desc).all
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)

    if @label.save
      redirect_to(labels_path, notice: 'Label created successfully')
    else
      render(:new)
    end
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end
end
