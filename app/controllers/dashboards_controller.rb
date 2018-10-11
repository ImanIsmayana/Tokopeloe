class DashboardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # GET /dashboards
  # GET /dashboards.json
  def index
    @products = Product.recent.order("created_at desc").page(params[:page]).per_page(4)

    @dashboards = Dashboard.all
    @stores = Store.all
    @carts = Cart.all
  end

  # GET /dashboards/1
  # GET /dashboards/1.json
  def show
  end

  # GET /dashboards/new
  def new
    @dashboard = current_user.dashboards.build
    @store = current_user.stores.build
  end

  # GET /dashboards/1/edit
  def edit
    @products = Product.scoped
    @stores = Store.scoped
  end

  # POST /dashboards
  # POST /dashboards.json
  def create
    @dashboard = current_user.dashboards.build(dashboard_params)

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard }
      else
        format.html { render :new }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboards/1
  # PATCH/PUT /dashboards/1.json
  def update
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard }
      else
        format.html { render :edit }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.json
  def destroy
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to dashboards_url, notice: 'Dashboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_params
      params.fetch(:dashboard, {})
    end
end
