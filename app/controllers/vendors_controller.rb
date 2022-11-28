class VendorsController < ApplicationController
  before_action :set_vendor_and_check_permission, only: [:show, :edit, :update, :destroy]

  def index
    @vendors = Vendor.all
  end

  def show
  end

  def new
    @vendor = Vendor.new
    authorize @vendor
  end

  def edit
  end

  def create
    @vendor = Vendor.new(vendor_params)
    authorize @vendor
    if @vendor.save
      redirect_to vendors_path, notice: 'La nuova marca è stata inserita.'
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def update
    if @vendor.update(vendor_params)
      redirect_to vendors_path, notice: 'La marca è stata aggiornata.'
    else
      render action: :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vendor.destroy
    redirect_to vendors_path, notice: 'La marca è stata eliminata.'
  end

  private
    def set_vendor_and_check_permission
      @vendor = Vendor.find(params[:id])
      authorize @vendor
    end

    def vendor_params
      params[:vendor].permit(:name)
    end
end
