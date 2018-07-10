require 'spec_helper'

module Refinery
  module SafariTypes
    describe SafariType do
      describe "validations" do
        subject do
          FactoryGirl.create(:safari_type,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end
