class SellersController < ApplicationController
  # GET /sellers
  # GET /sellers.xml
  def index
    @sellers = Seller.find(:all, :order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sellers }
    end
  end

  # GET /sellers/1
  # GET /sellers/1.xml
  def show
    @seller = Seller.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seller }
    end
  end

  # GET /sellers/new
  # GET /sellers/new.xml
  def new
    @seller = Seller.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seller }
    end
  end

  # GET /sellers/1/edit
  def edit
    @seller = Seller.find(params[:id])
  end

  # POST /sellers
  # POST /sellers.xml
  def create
    @seller = Seller.new(params[:seller])

    respond_to do |format|
      if @seller.save
        flash[:notice] = "Seller #{@seller.name} berhasil dibuat."
        format.html { redirect_to(:action=>:index) }
        format.xml  { render :xml => @seller, :status => :created, :location => @seller }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @seller.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sellers/1
  # PUT /sellers/1.xml
  def update
    @seller = Seller.find(params[:id])

    respond_to do |format|
      if @seller.update_attributes(params[:seller])
        flash[:notice] = "Seller #{@seller.name} berhasil diupdated."
        format.html { redirect_to(:action=>:index) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @seller.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/1
  # DELETE /sellers/1.xml
  def destroy
    @seller = Seller.find(params[:id])
    begin
      @seller.destroy
        flash[:notice] = "User #{seller.name} berhasil dihapus"
    rescue Exeption => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to(sellers_url) }
      format.xml  { head :ok }
    end
  end
end

