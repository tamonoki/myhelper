class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :listupdate]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  	
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    
    #@order = Order.new
    #@order.images = params[:images]
    
    #@order= Order.new(params[:order])
    
    logger.debug('**********************')
    logger.debug('1')
    logger.debug(params[:images])
    logger.debug(params[:user_id])
    logger.debug(order_params)
    logger.debug(@order.images[0].url)
    logger.debug(@order.images[0].current_path)
    logger.debug(@order.images[0].identifier)
    logger.debug(@order.user_id)
    logger.debug('end')

    respond_to do |format|
      #c = @order.save
      if @order.save
        logger.debug(@order.id)
        logger.debug('in save end')
        PythonJob.perform_later(@order.id)
        
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /ordedrs/1/list
  def listupdate
  	if @order.update( :selectfiles => params[:selectfiles] )
  		if params[:commit] == "Save"
  			render :text => "ListUpdate id=#{params[:id]} checkedFile num=#{params[:selectfiles].length}
  		  	               o=#{@order.selectfiles.length}, commit=#{params[:commit]}"
  		else
  			redirect_to @order.paypal_url(registration_path(@order))
  		end
  	else
  		render :text => "update miss"
  	end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :images_cache, :images => [])
    end
end
