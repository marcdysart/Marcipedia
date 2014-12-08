require 'rails_helper'

describe Wiki do
  describe "the wiki" do

    before do
      @user1 = User.new(name: "George", email: "hello@bloc.com", password:"PASSWORD")
      @user1.skip_confirmation!
      @user1.save!
      @user2 = User.new(name: "Mary", email: "goodbye@bloc.com", password:"PASSWORD")
      @user2.skip_confirmation!
      @user2.save!
      @wiki = Wiki.new
      @wiki = @user1.wikis.create(title: "my list", private: "true", body: "Test of Wiki",  user_ids: [@user1.id,@user2.id] )
    end


    it "can have many collaborators" do
      expect( @wiki.users.count).to eq(2)
    end

    it "can have collaborators removed" do
      @wiki.users.first.delete
      expect( @wiki.users.count).to eq(1)
    end


  end
end
