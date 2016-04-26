class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  def index
    @vendors = Vendor.all
  end

  def show
  end

  def new
    @vendor = Vendor.new
  end

  def edit
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      redirect_to vendors_path, notice: 'La nuova marca è stata inserita.'
    else
      render :new
    end
  end

  def update
    if @vendor.update(vendor_params)
      redirect_to vendors_path, notice: 'La marca è stata aggiornata.'
    else
      render :edit
    end
  end

  def destroy
    @vendor.destroy
    redirect_to vendors_path, notice: 'La marca è stata eliminata.'
  end

  private
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    def vendor_params
      params[:vendor].permit(:name)
    end
end
