class ProductsController < ApplicationController
  filter_resource_access

  # GET /products
  # GET /products.xml

  def index
    @title = "Index Produk"
    @products = Product.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @title = "Lihat Produk"

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @title = "Tambah Produk Baru"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @title = "Edit Produk"
  end

  # POST /products
  # POST /products.xml
  def create
    @title = "Tambah Produk"
    @product.user = current_user

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Produk baru berhasil dibuat.'
        format.html { redirect_to(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @title = "Update Produk"

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Updated produk berhasil.'
        format.html { redirect_to(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @title = "Delete Produk"
    @product.destroy

    respond_to do |format|
      flash[:notice] = "Product deleted"
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  private

    def load_data
      @users = User.find(:all)
      @tags = Tag.find(:all)     
    end
end

