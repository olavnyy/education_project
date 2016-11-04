class JournalsController < ApplicationController

  def index
    @journals =  @current_user.class.journal_list(@current_user)
    render json: @journals
  end

  def show
    @journal =  @current_user.class.journal_list(@current_user).find(params[:id])
    if @journal.nil?
      render json: {
          content: 'invalid show'
      }
    else
      render json: @journal
    end
  end

  def create
    @journal =  @current_user.class.journal_list(@current_user).new(journal_params)
    if @journal.save
      render json: @journal
    else
      render json: {
          content: 'invalid create'
      }
    end
  end

  def update
    @journal =  @current_user.class.journal_list(@current_user).find(params[:id])
    if @journal.update_attributes(journal_params)
      render json: @journal
    else
      render json: {
          content: 'invalid update'
      }
    end
  end

  def destroy
    @current_user.class.journal_list(@current_user).find(params[:id]).destroy
    render json: {
        content: 'deleted'
    }
  end

  def new
    @journal =  @current_user.class.journal_list(@current_user).new
    render json: @journal
  end

  def edit
    @journal =  @current_user.class.journal_list(@current_user).find(params[:id])
    render json: @journal
  end

  private

  def journal_params
    params.require(:journal).permit(:title)
  end
end
