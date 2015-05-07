class API::V1::NotesController < ApplicationController
  def index
    @notes = current_user.notes
  end

  def show
    @note = current_user.notes.find params[:id]
  end

  private

  def current_user
    User.first
  end
end
