class GlossariesController < ApplicationController
  before_action :set_glossary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update, :edit]

  respond_to :html

  def index
    @glossaries = Glossary.all
    respond_with(@glossaries)
  end

  def show
    respond_with(@glossary)
  end

  def new
    @glossary = Glossary.new
    respond_with(@glossary)
  end

  def edit
  end

  def create
    @glossary = current_user.glossaries.new(glossary_params)
    @glossary.save
    respond_with(@glossary)
  end

  def update
    @glossary.update(glossary_params)
    respond_with(@glossary)
  end

  def destroy
    @glossary.destroy
    respond_with(@glossary)
  end

  private
    def set_glossary
      @glossary = Glossary.find(params[:id])
    end

    def glossary_params
      params.require(:glossary).permit(:user_id, :topic, :language_id, :description)
    end
end
