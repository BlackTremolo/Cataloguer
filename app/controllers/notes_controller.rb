class NotesController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_note, only: %i[ show edit update destroy]

  def index
    @notes = Note.all
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to root_path, notice: "Заметка создана"
    else
      render "catalogs/index", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @note.update(note_params)

    if @note.save
      redirect_to @note
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @note.destroy
      redirect_to root_path
    else
      render "catalogs/index", status: :unprocessable_entity
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.expect(note: [:name, :link, :description, :catalog_id])
  end
end
