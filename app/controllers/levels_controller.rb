class LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  # GET /levels
  # GET /levels.json
  def index
    if current_user.is_admin == true
      @levels = Level.all
    else
      redirect_to '/play/index'
    end
  end

  # GET /levels/1
  # GET /levels/1.json
  def show
    if current_user.is_admin == true

    @l = params[:id]
    else
      redirect_to '/play/index'
    end
  end

  # GET /levels/new
  def new
    if current_user.is_admin == true

    @level = Level.new
    else
      redirect_to '/play/index'
    end
  end

  # GET /levels/1/edit
  def edit
    if current_user.is_admin != true
      redirect_to '/play/index'
    end
  end

  # POST /levels
  # POST /levels.json
  def create
    if current_user.is_admin == true

      @level = Level.new(level_params)

      respond_to do |format|
        if @level.save
          format.html { redirect_to @level, notice: 'Level was successfully created.' }
          format.json { render :show, status: :created, location: @level }
        else
          format.html { render :new }
          format.json { render json: @level.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to '/play/index'
    end
  end

  # PATCH/PUT /levels/1
  # PATCH/PUT /levels/1.json
  def update
    if current_user.is_admin == true

      respond_to do |format|
        if @level.update(level_params)
          format.html { redirect_to @level, notice: 'Level was successfully updated.' }
          format.json { render :show, status: :ok, location: @level }
        else
          format.html { render :edit }
          format.json { render json: @level.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to '/play/index'
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    if current_user.is_admin == true

      @level.destroy
      respond_to do |format|
        format.html { redirect_to levels_url, notice: 'Level was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to '/play/index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      params.require(:level).permit(:question, :answer, :link, :hint)
    end
end
