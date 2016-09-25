require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "name" do
    let(:rating) { 5.0 }

    it "should not be nil" do
      expect {
        Movie.create!(:rating => rating)
      }.to raise_error
    end

    it "should not be blank" do
      expect {
        Movie.create!(:name => '', :rating => rating)
      }.to raise_error
    end
  end

  describe "ratings" do
    let(:movie_name) { 'It\'s a Wonderful Life' }
    let(:rating) { 5.0 }

    it "can be a valid decimal" do
      expect {
        Movie.create!(:name => movie_name, :rating => rating)
      }.not_to raise_error
    end

    it "should not be greater than 10" do
      expect {
        Movie.create!(:name => movie_name, :rating => 10.1)
      }.to raise_error
    end

    it "should not be less than 0" do
      expect {
        Movie.create!(:name => movie_name, :rating => -0.1)
      }.to raise_error
    end
  end
end
