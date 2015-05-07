class NotesController < ApplicationController
  before_action :authorize_user
  before_action :load_notes
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def new
    @note = current_user.notes.new
  end

  def show
    render :edit
  end

  def create
    @note = current_user.notes.new note_params
    set_flash_for @note.save
    if @note.errors.any?
      render :new
    else
      render :edit
    end
  end

  def update
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
    @note = current_user.notes.find params[:id]
  end

  def load_notes
    @notes = current_user.notes if current_user.present?
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
