require 'active_support/all'
class Project < ApplicationRecord
    has_many :tasks, dependent: :destroy
    # attr_accessor :tasks, :due_date
    # def initialize
    #     @tasks = []
    # end
    def self.velocity_length_in_days
        21
    end
    def incomplete_tasks
        tasks.reject(&:complete?)
    end

    def done?
        # tasks.empty?
        # tasks.all?(&:complete?)
        incomplete_tasks.empty?
    end

    def total_size
        tasks.sum(&:size)
    end

    def remaining_size
        incomplete_tasks.sum(&:size)
    end

    def completed_velocity
        tasks.sum(&:points_toward_velocity)
    end

    def current_rate
        completed_velocity * 1.0/Project.velocity_length_in_days
    end

    def projected_days_remaining
        remaining_size / current_rate
    end

    def on_schedule?
        #  (Time.zone.today + projected_days_remaining) <=due_date
        return false if projected_days_remaining.nan?
        # print "(Date.today (#{Date.today}) + projected_days_remaining (#{projected_days_remaining}) = (#{Date.today + projected_days_remaining})) <=due_date (#{due_date})";puts"\n"
         (Time.zone.today + projected_days_remaining) <=due_date
    end
        
    
end