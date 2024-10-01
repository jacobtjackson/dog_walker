class ShiftsController < ApplicationController
  before_action :authenticate_user!
  def show
    @date = params[:date]&.to_date || Date.today
    @shift_type = params[:time_of_day] || 'am'

    @shift = current_user.shifts.find_or_create_by(shift_date: @date, shift_type: @shift_type)
  end

  def edit
    @date = params[:date]&.to_date || Date.today
    @shift_type = params[:time_of_day] || 'am'

    @shifts = Shift.includes(:dogs, :user).where(shift_date: @date, shift_type: @shift_type)
    allocated_dogs = @shifts.extract_associated(:dogs).flatten.uniq
    @unallocated_dogs = Dog.where.not(id: allocated_dogs.pluck(:id)).where('? = ANY (dogs.days_of_week)', @date.strftime('%A')).where('? = ANY(dogs.time_period)', @shift_type.to_s)
  end

  def update
    @shift = Shift.find params[:date]
    dog = Dog.find params[:shift][:dogs]

    if @shift.dogs |= [dog]
      flash[:success] = 'Dog was added successfully!'
    else
      flash[:error] = 'Something went wrong. Please try again'
    end

    redirect_back fallback_location: edit_shift_url(@shift.shift_date, shift_type: @shift.shift_type)
  end

  def delete_dog
    @shift = Shift.find params[:id]
    dog = Dog.find params[:dog_id]

    @shift.dogs.delete(dog)
    if @shift.dogs |= [dog]
      flash[:success] = 'Dog was removed successfully!'
    else
      flash[:error] = 'Something went wrong. Please try again'
    end

    redirect_back fallback_location: edit_shift_url(@shift.shift_date, shift_type: @shift.shift_type)
  end
end
