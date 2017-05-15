# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "SafariTypes" do
    describe "Admin" do
      describe "safari_types" do
        login_refinery_user

        describe "safari_types list" do
          before(:each) do
            FactoryGirl.create(:safari_type, :name => "UniqueTitleOne")
            FactoryGirl.create(:safari_type, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.safari_types_admin_safari_types_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.safari_types_admin_safari_types_path

            click_link "Add New Safari Type"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::SafariTypes::SafariType.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::SafariTypes::SafariType.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:safari_type, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.safari_types_admin_safari_types_path

              click_link "Add New Safari Type"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::SafariTypes::SafariType.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:safari_type, :name => "A name") }

          it "should succeed" do
            visit refinery.safari_types_admin_safari_types_path

            within ".actions" do
              click_link "Edit this safari type"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:safari_type, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.safari_types_admin_safari_types_path

            click_link "Remove this safari type forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::SafariTypes::SafariType.count.should == 0
          end
        end

      end
    end
  end
end
