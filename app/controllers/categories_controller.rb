class CategoriesController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  
  # GET /categories
  # GET /categories.json
  def index
    @ajax_search = params[:ajax_search] == "true" ? true : false
    
    puts "sort_direction = " + sort_direction
        
    @categories = Category.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.js   # index.js.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.js   # new.js.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])
 
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, flash[:info]="Category was successfully created." }
        format.js { flash[:info]="Category was successfully created." }
        format.json { render json: @category, status: :created, location: @category }
      end
    end    
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to categories_url, flash[:info]='Category was successfully updated.' }
        format.js { flash[:info]='Category was successfully updated.' }
        format.json { head :ok }        
      else
        format.html { render action: "edit" }
        format.js { flash[:error] = @comment.errors.full_messages }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    puts "DESTROY - DESTROY"
    @category = Category.find(params[:id])
    @category.destroy
    
    @categories = Category.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html { redirect_to categories_url, flash[:info]='Category was successfully deleted.'}
      format.js { flash[:info]='Category was successfully deleted.' }
      format.json { head :ok }
    end
  end
  
  # sort icin default column
  private  
  def sort_column
   # column varmi diye kontrol ediliyor, yoksa name default   
   Category.column_names.include?(params[:sort]) ? params[:sort] : "name"   
  end  
 
  # sort icin default direction asc
  def sort_direction
    # karakter kontrol yapiliyor security icin  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
  end   
  
end
