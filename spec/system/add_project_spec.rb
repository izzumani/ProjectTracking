require 'rails_helper'
RSpec.describe "adding a project", :pending, type: :system do
    it "allows a user to create a project with tasks" do
        visit new_project_path
        fill_in "project_name", with: "Project Runway"
        fill_in "project_tasks", with: "Choose Fabric:3 \nMake it Work:5"
        click_on("Create Project")
        visit projects_path
        expect(page).to have_content("Project Runway")
        expect(page).to have_content("8")
    end
end
