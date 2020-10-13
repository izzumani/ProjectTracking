require 'active_support/all'
class Task < ApplicationRecord
    belongs_to :project
    # attr_accessor :size, :completed_at
    #:completed
    # def initialize(options = {})
    #     # @completed = options[:completed]
    #     mark_completed(options[:completed_at]) if options[:completed_at]
    #     @size = options[:size]
    # end

    def mark_completed(date = Time.current)
        # @completed = true
        # print "Current Date: #{date}";puts"\n"
        self.completed_at = date


    end

    def complete?
        # @completed   
        # return false if completed_at.nil?
        completed_at.present?
    end

    def part_of_velocity?
        return false unless complete?
        #  print "completed_at #{completed_at} > #{21.days.ago}".inspect;puts"\n"
        completed_at > Project.velocity_length_in_days.days.ago
    end

    def points_toward_velocity
        part_of_velocity? ? size : 0
    end
end