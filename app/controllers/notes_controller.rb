class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def new
    @note = Note.new
  end

  def show
    render :edit
  end

  def create
    @note = Note.new note_params
    set_flash_for @note.save
    if @note.errors.any?
      render :new
    else
      render :edit
    end
  end

  def update
    @note = Note.find params[:id]
    set_flash_for @note.update note_params
    render :edit
  end

  def destroy
    set_flash_for @note.destroy
    if @note.errors.any?
      render :edit
    else
      redirect_to new_note_path
    end
  end

  private

  def find_note
    @note = Note.find params[:id]
  end

  def note_params
    params.require(:note).permit(:title, :body_html, :body_text)
  end

  def set_flash_for(action_result)
    if action_result
      flash[:notice] = t("note.flash.#{action_name}.success")
    else
      flash.now[:alert] = t("note.flash.#{action_name}.failure")
    end
  end
end
