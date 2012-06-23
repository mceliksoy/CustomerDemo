class CustomersController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  
  # GET /customers
  # GET /customers.json
  def index
    @ajax_search = params[:ajax_search] == "true" ? true : false

    @customers = Customer.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.js   # index.js.erb
      format.json { render json: @customers }
    end    
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.js   # new.js.erb
      format.json { render json: @customer }
    end    
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_url, flash[:info]="Customer was successfully created." }
        format.js { flash[:info]="Customer was successfully created." }
        format.json { render json: @customer, status: :created, location: @customer }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to customers_url, flash[:info]='Customer was successfully updated.' }
        format.js { flash[:info]='Customer was successfully updated.' }
        format.json { head :ok }        
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
 
    @customers = Customer.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
 
    respond_to do |format|
      format.html { redirect_to customers_url, flash[:info]='Customer was successfully deleted.' }
      format.js { flash[:info]='Customer was successfully deleted.' }
      format.json { head :ok }
    end
  end
  
  # sort icin default column
  private  
  def sort_column
    # column varmi diye kontrol ediliyor, yoksa name default   
    Customer.column_names.include?(params[:sort]) ? params[:sort] : "company_name"   
  end  
 
  # sort icin default direction asc
  def sort_direction
    # karakter kontrol yapiliyor security icin  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
  end  

end
