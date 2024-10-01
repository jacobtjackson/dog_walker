# README

This project was a fun challenge. I struggled with the hotwire stuff a bit and wasn't 100% sure I chose the best way of setting up the relationships between user/shifts/dogs, but my implementation works and should be pretty durable/scalable.

# Setup

1. Run `bundle install` from the project directory on your local machine.
2. Run `rails db:create`, then `rails db:migrate`.
3. Run `rails tailwindcss:watch`
4. run `rails s` to start the server.
5. Sign up for a new account. Once you have successfully signed up, run `rails c` and lookup your account by running `u = User.find_by_email '<your-email>`
6. Run `u.update is_manager: true` from the console.
7. Start setting up schedules!
