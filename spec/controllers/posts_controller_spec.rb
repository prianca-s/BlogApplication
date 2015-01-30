require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!


RSpec.describe PostsController, :type => :controller do

	# def login_user
 #    before(:each) do
 #      @request.env["devise.mapping"] = Devise.mappings[:user]
 #      @user = FactoryGirl.create(:user)
 #      sign_in @user
 #    end
 #    end
		
	# before(:each) do
 #        request.env["HTTP_REFERER"] = '/posts'
 #    	sign_out(:user)
 #  	end

 #  	def login_user
 #    	@user = FactoryGirl.create(:user)  
 #    	sign_in @user
 #  	end

 	login_user
 	it "should have a current_user" do
   		 subject.current_user.should_not be_nil
    end

	it "should have index" do
		#login_user
		get :index
		response.should be_success
	end


	it "should get new" do
      #login_user
      get :new
      response.should be_success
     # expect(assigns(:Post)).to be_a_new(Post)
     # response.to be_a_new(Post)
    end

    it "creates a new Post 'create'" do
       # login_user
       @post = FactoryGirl.create(:post)
      # expect {post :create, {post: @post.attributes}}.to change(Post, :count).by(1)
       expect {
          post :create, {:post => {'title' => 'Mr. xxx', 'content' => 'xxxyyshjdj'}}
       }.to change(Post, :count).by(1)
       #  expect {post :create, FactoryGirl.attributes_for(:post)}.to change(Post, :count).by(1)
    end

     it "assigns a newly created post as @post" do
        #login_user
        @post = FactoryGirl.create(:post)
        post :create, {post: @post.attributes}
        expect(@post).to be_a(Post)
        expect(@post).to be_persisted
    end

   	it "should get show" do
      #login_user
      @post = FactoryGirl.create(:post)
      get :show, {id: @post.id}
      expect(assigns(:post)).to eq(@post)
    end

    it "should get edit" do
      #login_user
        @post = FactoryGirl.create(:post)
        get :edit, {id: @post.id}
        expect(assigns(:post)).to eq(@post)
    end

    # it "redirects to the posts list" do
    #   @post = FactoryGirl.create(:post)
    #   get :edit, {id: @post.id}
    #   expect(response).to redirect_to(posts_url)
    # end
  describe "for update" do
    it "updates the requested blog" do
        @post = FactoryGirl.create(:post)
        put :update, {id: @post.id, post: @post.attributes}
        @post.reload
    end
    
    it "assigns the requested post as @post" do
        @post = FactoryGirl.create(:post)
        put :update, {id: @post.id, post: @post.attributes}
        expect(assigns(:post)).to eq(@post)
    end

    it "redirects to the post after update" do
        @post = FactoryGirl.create(:post)
        put :update, {id: @post.id, post: @post.attributes}
        expect(response).to redirect_to(posts_url)
    end
  end
     # it "should be able to edit only user post" do
     #     @post = FactoryGirl.create(:post)
     #     get :edit, {id: @post.id}
     #     post :create, {post: @post.attributes}
     #     expect(assigns(:post).user).to eq(subject.current_user)
     # end

    it "destroys the requested post" do
      @post = FactoryGirl.create(:post)
      get :show, {id: @post.id}
      if subject.current_user == @post.user
        expect { delete :destroy, {id: @post.id}}.to change(Post, :count).by(-1)
      end
    end

    it "redirects to the posts list" do
      @post = FactoryGirl.create(:post)
      delete :destroy, {id: @post.id}
      expect(response).to redirect_to(posts_url)
    end

   

      #  it "redirects to the created blog" do
      #   #login_user
      #   @post = FactoryGirl.create(:post)
      #   request.env["HTTP_REFERER"] = '/blogs/' + @blog.id.to_s
      #   post :create, {blog: @blog.attributes}
      #   expect(response).to redirect_to(Blog.last)#'/blog/' + @comment.id.to_s)
      # end

    # describe "with invalid params" do
    #   it "assigns a newly created but unsaved blog as @blog" do
    #     login_user
    #     @blog = FactoryGirl.create(:blog)
    #     @blog.post = nil
    #     post :create, {blog: @blog.attributes}
    #     expect(@blog).to be_a(Blog)
    #   end
    # end

  		# it "redirects to blog index page" do
  		# 	login_user
    #   	post :create, blog: FactoryGirl.attributes_for(:blog)
    # 		expect(response.status).to eq(302) #redirect_to blog/:id
    #   end

end
