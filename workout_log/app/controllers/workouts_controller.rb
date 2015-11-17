class WorkoutsController < ApplicationController
   before_filter :find_workout, :only => [:show, :edit, :update, :destroy]
   before_filter :workout_params, :only => [:create, :update]

   # GET /workouts
   def index
      @workouts = Workout.all.order("created_at DESC")

      respond_to do |wants|
         wants.html # index.html.erb
      end
   end

   # GET /workouts/1
   def show
      respond_to do |wants|
         wants.html # show.html.erb
      end
   end

   # GET /workouts/new
   def new
      @workout = Workout.new

      respond_to do |wants|
         wants.html # new.html.erb
      end
   end
   
   # GET /workouts/1/edit
   def edit
   end

   # POST /workouts
   def create
      @workout = Workout.new(workout_params)

      respond_to do |wants|
         if @workout.save
            flash[:notice] = 'Workout was successfully created.'
            wants.html { redirect_to(@workout) }
         else
            wants.html { render :action => "new" }
         end
      end
   end

   # PUT /workouts/1
   def update
      respond_to do |wants|
         if @workout.update_attributes(workout_params)
            flash[:notice] = 'Workout was successfully updated.'
            wants.html { redirect_to(@workout) }
         else
            wants.html { render :action => "edit" }
         end
      end
   end

   # DELETE /workouts/1
   def destroy
      @workout.destroy

      respond_to do |wants|
         wants.html { redirect_to(workouts_url) }
      end
   end

   private

   def workout_params
      params.require(:workout).permit(:data, :workout, :mood, :length)
   end

   def find_workout
      @workout = Workout.find(params[:id])
   end

end
