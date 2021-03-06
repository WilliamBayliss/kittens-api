class KittensController < ApplicationController
   def index
    @kittens = Kitten.all

    respond_to do |format|
      format.json { render :json => @kittens }
    end
   end
   
   def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.json { render :json => @kitten }
    end
   end

   def new
    @kitten = Kitten.new
   end

   def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to kitten_path(@kitten), notice: "Kitten saved!"
    else
      flash.now[:alert] = "You fucked it up!"
      render 'new'
    end
   end

   def edit
    @kitten = Kitten.find(params[:id])
   end

   def update
    @kitten = Kitten.find(params[:id])
    
    if @kitten.update(kitten_params)
      redirect_to kitten_path(@kitten), notice: "Kitten updated!"
    else
      render 'edit'
      flash.now[:alert] = "You fucked it up"
    end
   end

   def destroy
   end

   private
    def kitten_params
      params.require(:kitten).permit(:name, :age, :softness, :cuteness)
    end
end