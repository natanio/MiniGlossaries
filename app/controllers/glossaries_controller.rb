class GlossariesController < ApplicationController
  before_action :set_glossary, only: [:show, :edit, :update, :destroy]

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
    @glossary = Glossary.new(glossary_params)
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
