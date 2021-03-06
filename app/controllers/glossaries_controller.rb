class GlossariesController < ApplicationController
  before_action :set_glossary, only: [:show, :edit, :update, :destroy]
  before_action :all_glossaries, only: [:index, :create]
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update, :edit]
  respond_to :html, :js

  respond_to :html

  def index
    @languages = Language.all
    @languages = @languages.sort_by { |lang| lang.name.downcase }
    @glossary = Glossary.new

    if params[:sorted].present?
      @lang = Language.find_by(name: params[:sorted])
      @glossaries = Glossary.where(language_id: @lang.id).order(created_at: :desc)
    end

    if params[:search]
      @glossaries = Glossary.search(params[:search]).order("created_at DESC")
    end

    respond_with(@glossaries)
  end

  def show
    @terms = @glossary.terms
    respond_with(@glossary)
  end

  def new
    @glossary = Glossary.new
    render :new
  end

  def edit
  end

  def create
    @glossary = current_user.glossaries.new(glossary_params)
    @glossary.save

    create_terms

    flash[:notice] = "Awesome! You created a glossary! Add translations or ask others to help you translate your terms"
    render :create
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

    def all_glossaries
      @glossaries = Glossary.all.order(created_at: :desc)
    end

    def create_terms
      terms = params[:terms].split(",")
      terms.each do |term|
        @glossary.terms.create(content: term, language_id: @glossary.language_id)
      end
    end
end
