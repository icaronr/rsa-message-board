class PublicKeysController < ApplicationController
  before_action :set_public_key, only: [:show, :edit, :update, :destroy]

  # GET /public_keys
  # GET /public_keys.json
  def index
    @public_keys = PublicKey.all
  end

  # GET /public_keys/1
  # GET /public_keys/1.json
  def show
  end

  # GET /public_keys/new
  def new
    @public_key = PublicKey.new
  end

  # GET /public_keys/1/edit
  def edit
  end

  # POST /public_keys
  # POST /public_keys.json
  def create
    @public_key = PublicKey.new(public_key_params)

    respond_to do |format|
      if @public_key.save
        format.html { redirect_to @public_key, notice: 'Public key was successfully created.' }
        format.json { render :show, status: :created, location: @public_key }
      else
        format.html { render :new }
        format.json { render json: @public_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /public_keys/1
  # PATCH/PUT /public_keys/1.json
  def update
    respond_to do |format|
      if @public_key.update(public_key_params)
        format.html { redirect_to @public_key, notice: 'Public key was successfully updated.' }
        format.json { render :show, status: :ok, location: @public_key }
      else
        format.html { render :edit }
        format.json { render json: @public_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /public_keys/1
  # DELETE /public_keys/1.json
  def destroy
    @public_key.destroy
    respond_to do |format|
      format.html { redirect_to public_keys_url, notice: 'Public key was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_key
      @public_key = PublicKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def public_key_params
      params.require(:public_key).permit(:key, :user_id)
    end
end
