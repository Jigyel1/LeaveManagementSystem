describe User do

    before(:each) { @user = User.new(email: 'test@example.com') }
  
    subject { @user }
    it { should respond_to(:email) }
  
    it "#email returns a string" do
      expect(@user.email).to match 'test@example.com'
    end
  
  end