class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @translations = Translation.all
    respond_with(@translations)
  end

  def show
    respond_with(@translation)
  end

  def new
    @translation = Translation.new
    @term = Term.find(params[:term_id])
    respond_with(@translation)
  end

  def edit
  end

  def create
    @term = Term.find(params[:term_id])
    @glossaries = Glossary.all
    @translation = @term.translations.new(translation_params)
    #@translation.update_attribute(user_id: current_user.id)
    @translation.save
    respond_with(@translation)
  end

  def update
    @translation.update(translation_params)
    respond_with(@translation)
  end

  def destroy
    @translation.destroy
    respond_with(@translation)
  end

  private
    def set_translation
      @translation = Translation.find(params[:id])
    end

    def translation_params
      params.require(:translation).permit(:content, :term_id, :language_id, :user_id)
    end
end
