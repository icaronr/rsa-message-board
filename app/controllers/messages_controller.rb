class MessagesController < ApplicationController
  require 'openssl'
  include CryptoAlgorithm
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    text = @message.ciphertext.to_i.to_bn
    puts text
    sender = @message.sender_name
    sender =  User.find_by(username: sender)
    sender_pub = PublicKey.find_by(user_id: sender.id).key
    sender_pub = fix_key(sender_pub) 
    
    text = decrypt(current_user.my_key(current_user.pvt_key), text)
    text = decrypt(sender_pub, OpenSSL::BN.new(text, 2))
    @message.ciphertext = text
  end

  # GET /messages/new
  def new
    @message = Message.new
    @users = User.all
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new#(message_params)
    
    
    receiver =  User.find_by(username: params["message"]["receiver_name"])
    receiver_pub = PublicKey.find_by(user_id: receiver.id).key
    receiver_pub = fix_key(receiver_pub) 

    @message.sender_name = params["message"]["sender_name"]
    @message.receiver_name = params["message"]["receiver_name"]
    assinado = encrypt(current_user.my_key(current_user.pvt_key), params["message"]["plaintext"])
    escondido = encrypt(receiver_pub, assinado.to_s(2))
    @message.ciphertext = escondido

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    def fix_key(key)
      k_arr = key.split(':')
      k = []
      k << eval(k_arr[0]).to_bn
      k << eval(k_arr[1]).to_bn
      return k
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:plaintext, :ciphertext, :sender_name, :receiver_name)
    end
end
