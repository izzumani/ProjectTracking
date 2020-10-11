# RSPEC Configuration
    rails_helper file, uncomment the following line:
    Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }
    This causes RSpec to autoload any file in spec/support, which lets you keep the
    RSpec setup clean at a slight setup cost.
  # RSpec Strategy of Testing
   *Given: You're starting with empty data, so no setup
   *When: Filling out a form with project data and submitting
   *Then: Verifying that the new project shows up on your list of projects with the entered tasks attached