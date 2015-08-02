require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe UsersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: "Test User",
      email: "test@example.org",
      address: "123 Main Street",
      address2: "Apt 101",
      city: "Denver",
      state: "CO",
      zip_code: "99999",
      emergency_contact_name: "Test Contact",
      emergency_contact_phone: "555-867-5309",
      waiver_signature: "Test User/s/",
      photo_release: "Test User/s/",
      volunteer_signature: "Test User/s/",
      role_id: 1
    }
  }

  let(:invalid_attributes) {
    { name: "Test User", emergency_contact_number: "Test Contact", role_id: 1 }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before do
    load "#{Rails.root}/db/seeds.rb"
  end

  describe "GET #index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #admin_index" do
    it "assigns all users as @users" do
      user = create :user
      get :admin_index, {}, valid_session
      expect(assigns(:users)).to eq ([user])
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :show, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :edit, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
        expect(User.count).to eq 1
        expect(User.first.role_id).to eq 1
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(response).to redirect_to(user_activity_sessions_path User.first, notice: 'User was successfully created.')
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end

    context "without user" do
      let(:attributes) {
        {
          name: "",
          email: "test@example.org",
          role_id: Role.find_by(name: "Visitor").id,
          waiver_signature: "Test User/s/"
        }
      }

      it "doesn't modify the database" do
        expect { post :create, { user: attributes }, valid_session }
          .to change(User, :count).by(0)
      end
    end

    context "without email domain" do
      let(:attributes) {
        {
          name: "Test User",
          email: "test@example",
          role_id: Role.find_by(name: "Visitor").id,
          waiver_signature: "Test User/s/"
        }
      }

      it "doesn't modify the database" do
        expect { post :create, { user: attributes }, valid_session }
          .to change(User, :count).by(0)
      end
    end

    context "intern without emergency contact name" do
      let(:attributes) {
        {
          name: "Test User",
          email: "test@example.org",
          role_id: Role.find_by(name: "Intern").id,
          waiver_signature: "Test User/s/",
          emergency_contact_phone: "555-867-5309"
        }
      }

      it "doesn't modify the database" do
        expect { post :create, { user: attributes }, valid_session }
          .to change(User, :count).by(0)
      end
    end

    context "intern without emergency contact number" do
      let(:attributes) {
        {
          name: "Test User",
          email: "test@example.org",
          role_id: Role.find_by(name: "Intern").id,
          waiver_signature: "Test User/s/",
          emergency_contact_name: "Test Contact"
        }
      }

      it "doesn't modify the database" do
        expect { post :create, { user: attributes }, valid_session }
          .to change(User, :count).by(0)
      end
    end

    context "volunteer without agreement signature" do
      let(:attributes) {
        {
          name: "Test User",
          email: "test@example.org",
          role_id: Role.find_by(name: "Intern").id,
          waiver_signature: "Test User/s/"
        }
      }

      it "doesn't modify the database" do
        expect { post :create, { user: attributes }, valid_session }
          .to change(User, :count).by(0)
      end
    end

    context "without liability waiver signature" do
      let(:attributes) {
        {
          name: "Test User",
          email: "test@example.org",
          role_id: Role.find_by(name: "Visitor").id
        }
      }

      it "doesn't modify the database" do
        expect { post :create, { user: attributes }, valid_session }
          .to change(User, :count).by(0)
      end
    end

    context "invalid liability waiver signature" do
      let(:attributes) {
        {
          name: "Test User",
          email: "test@example.org",
          role_id: Role.find_by(name: "Visitor").id,
          waiver_signature: "Test User/s"
        }
      }

      it "doesn't modify the database" do
        expect { post :create, { user: attributes }, valid_session }
          .to change(User, :count).by(0)
      end
    end

    context "invalid photography release signature" do
      let(:attributes) {
        {
          name: "Test User",
          email: "test@example.org",
          role_id: Role.find_by(name: "Visitor").id,
          waiver_signature: "Test User/s/",
          photo_release: "Test User/s"
        }
      }

      it "doesn't modify the database" do
        expect { post :create, { user: attributes }, valid_session }
          .to change(User, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "Other Name" }
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => new_attributes}, valid_session
        user.reload
        expect(user.name).to eq "Other Name"
      end

      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      render_views

      it "assigns the user as @user" do
        user = User.create! valid_attributes
        put :edit, {:id => user.to_param, :user => invalid_attributes}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        put :edit, {:id => user.to_param, :user => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, {:id => user.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, {:id => user.to_param}, valid_session
      expect(response).to redirect_to(users_url)
    end
  end

end
