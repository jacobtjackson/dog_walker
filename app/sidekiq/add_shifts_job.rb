class AddShiftsJob
  include Sidekiq::Job

  def perform
    users = User.includes(:shifts).all

    (Date.today + 1.week).all_week.each do |day|
      users.each do |u|
        u.shifts.create(shift_date: day, shift_type: 'am')
        u.shifts.create(shift_date: day, shift_type: 'pm')
      end
    end
  end
end
