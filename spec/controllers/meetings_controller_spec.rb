require 'rails_helper'

RSpec.describe MeetingsController, type: :controller do
    
    context "without render views" do
        describe "GET index" do
            subject { get :index }
            it "renders the index template" do
                get :index
                expect(subject).to render_template(:index)
            end
            
            it "does not render a different template" do
                expect(subject).to_not render_template("gadgets/show")
            end
        end
        
        describe "GET new" do
            subject  { get :new }
            it "renders the new template" do
                get :new
                expect(subject).to render_template(:new)
            end
        end
    end
            
    context "with render views" do
        describe "GET index" do
            render_views
            it "should have a meetings heading" do
                get :index
                expect(response.body).to match /<h3>Meetings/im
            end
        end
    end
end

