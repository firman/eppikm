class BeritasController < ApplicationController
  # GET /beritas
  # GET /beritas.xml
  def index
    @beritas = Berita.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @beritas }
    end
  end

  # GET /beritas/1
  # GET /beritas/1.xml
  def show
    @berita = Berita.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @berita }
    end
  end

  # GET /beritas/new
  # GET /beritas/new.xml
  def new
    @berita = Berita.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @berita }
    end
  end

  # GET /beritas/1/edit
  def edit
    @berita = Berita.find(params[:id])
  end

  # POST /beritas
  # POST /beritas.xml
  def create
    @berita = Berita.new(params[:berita])

    respond_to do |format|
      if @berita.save
        flash[:notice] = 'Berita was successfully created.'
        format.html { redirect_to(@berita) }
        format.xml  { render :xml => @berita, :status => :created, :location => @berita }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @berita.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /beritas/1
  # PUT /beritas/1.xml
  def update
    @berita = Berita.find(params[:id])

    respond_to do |format|
      if @berita.update_attributes(params[:berita])
        flash[:notice] = 'Berita was successfully updated.'
        format.html { redirect_to(@berita) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @berita.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /beritas/1
  # DELETE /beritas/1.xml
  def destroy
    @berita = Berita.find(params[:id])
    @berita.destroy

    respond_to do |format|
      format.html { redirect_to(beritas_url) }
      format.xml  { head :ok }
    end
  end
end

