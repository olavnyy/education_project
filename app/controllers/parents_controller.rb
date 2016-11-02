class ParentsController < ApplicationController
  def show
    @parent = @current_user.class.parents_list(@current_user).find(params[:id])
    render json: @parent
  end

  def new
    @parent = @current_user.class.parents_list(@current_user)
    render json: @parent
  end

   def index
    @parent = @current_user.class.parents_list(@current_user)
    render json: @parent
  end

  def create
    @parent = @current_user.class.parents_list(@current_user).new(parent_params)
    if @parent.save
      redirect_to @parent
    else
      render json: {
        content: 'invalid create'
      }
    end
  end

  def edit
    @parent= @current_user.class.parents_list(@current_user).find(params[:id])
    render json: @parent
  end

  def destroy
    @current_user.class.parents_list(@current_user).find(params[:id]).destroy
    render json: {
      content: 'deleted'
    }
  end

  def update
    @parent = @current_user.class.parents_list(@current_user).find(params[:id])
    if @parent.update_attributes(parent_params)
     render json: @parent
    # Handle a successful update.
    else
      render json: {
        content: 'invalid update'
      }
    end
  end

  private

  def parent_params
    params.
      require(:parent).
      permit(:first_name, :last_name, :student_id, :email, :contact_phone,
             :password, :password_confirmation, :school_id)
  end
end
