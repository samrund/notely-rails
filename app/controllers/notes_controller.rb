class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def new
    @note = Note.new
  end

  def edit
  end

  private

  def find_note
    @note = Note.find params[:id]
  end
end
