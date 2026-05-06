class CatalogsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_catalog, only: %i[ show edit update destroy]
  def index
    @catalogs = Catalog.all
    @catalog = Catalog.new
    @note_new = Note.new

  end

  def show
  end
  def new
    @catalog = Catalog.new
  end

  def create
    @catalog = Catalog.new(catalog_params)

    if @catalog.save
      redirect_to root_path, notice: 'Новый каталог создан'
    else
      render :index, status: :unprocessable_entity, notice: 'Ошибка в создании каталога'
    end
  end

  def edit
  end

  def update

  end

  def destroy
    notes = @catalog.notes
    notes.each {|n| n.update!(catalog_id: 1)}

    if @catalog.destroy
      redirect_to root_path
    else
      render "catalogs/index", status: :unprocessable_entity
    end
  end

  private

  def set_catalog
    @catalog = Catalog.find(params[:id])
  end

  def catalog_params
    params.expect(catalog: [ :name ])
  end
end
