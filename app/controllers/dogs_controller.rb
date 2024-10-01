class DogsController < ApplicationController
  before_action :authenticate_user!
  def update
    dog = Dog.find params[:id]

    if dog.update status: params[:status]
      flash[:success] = 'Status updated successfully!'
    else
      flash[:error] = 'There was a problem. Please try again.'
    end
  end

  def bulk_update
    dogs = Dog.where(id: JSON.parse(params[:ids]))

    if dogs.update_all status: params[:status]
      flash[:success] = 'Statuses updated successfully!'
    else
      flash[:error] = 'There was a problem. Please try again.'
    end
  end
end
