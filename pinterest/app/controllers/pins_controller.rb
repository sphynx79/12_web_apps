class PinsController < ApplicationController
   before_action :find_pin, only: [:show, :edit, :update, :destroy, :downvote, :upvote ]
   before_action :authenticate_user!, except: [:index, :show, :downvote, :upvote ]

   def index
      @pin = Pin.all

   end

   def show

   end

   def new
      @pin = current_user.pins.build

   end

   def create
      @pin = current_user.pins.build(pin_params)

      if @pin.save
         redirect_to @pin, notice: "Successfully created new Pin" 
      else
         render 'new'
      end

   end

   def edit
   
   end

   def update
      if @pin.update(pin_params)
         redirect_to @pin, notice: 'pin was Successfully update!'
      else
         render 'edit'
      end
   end

   def destroy
      @pin.destroy
      redirect_to root_path
   end

   def upvote
       if user_signed_in? 
         @pin.upvote_by current_user
         respond_to do |format|
            format.html {redirect_to :back }
            format.js {render :layout => false}  
         end
      else
         session[:user_return_to] = root_path
         render js: %(window.location.href='#{new_user_session_path }') and return
      end
   end

   def downvote
       if user_signed_in? 
         @pin.downvote_from current_user
         respond_to do |format|
            format.html {redirect_to :back }
            format.js {render :layout => false}  
         end
      else
         session[:user_return_to] = root_path
         render js: %(window.location.href='#{new_user_session_path }') and return
      end
   end

   private

   def pin_params
      params.require(:pin).permit(:title, :description, :image)
   end

   def find_pin
      @pin = Pin.find(params[:id])
   end


end


