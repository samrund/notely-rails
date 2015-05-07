class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new note_params
    if @note.save
      flash.now[:notice] = t('note.flash.create.success')
      render :edit
    else
      flash.now[:alert] = t('note.flash.create.failure')
      render :new
    end
  end

  def update
    @note = Note.find params[:id]
    if @note.update note_params
      flash.now[:notice] = t('note.flash.update.success')
    else
      flash.now[:alert] = t('note.flash.update.failure')
    end
    render :edit
  end

  private

  def find_note
    @note = Note.find params[:id]
  end

  def note_params
    params.require(:note).permit(:title, :body_html, :body_text)
  end
end
