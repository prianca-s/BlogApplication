class CommentsController < ApplicationController
  def index
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you get all the comments of this post
    @comments = post.comments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /posts/:post_id/comments/:id
  # GET /comments/:id.xml
  def show
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = post.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /posts/:post_id/comments/new
  # GET /posts/:post_id/comments/new.xml
  def new
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you build a new one
    @comment = post.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /posts/:post_id/comments/:id/edit
  def edit
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = post.comments.find(params[:id])
  end

  # POST /posts/:post_id/comments
  # POST /posts/:post_id/comments.xml

  def create
    @post = Post.find(params[:post_id])
  # @comment = Comment.new(post: @post, text: params[:comment][:text])
    @comment = @post.comments.create(allowed_params)
    @comment.user = current_user
    @comment.save
  #  if @comment.save
      redirect_to post_comments_path
    # respond_to do |format|
    #   if @comment.save
    #     #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
    #     format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully created.') }
    #     #the key :location is associated to an array in order to build the correct route to the nested resource comment
    #     format.xml  { render :xml => @comment, :status => :created, :location => [@comment.post, @comment] }
    #   else
    #     format.html { render :action => "new" }
    #     format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  # PUT /posts/:post_id/comments/:id
  # PUT /posts/:post_id/comments/:id.xml
  def update
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = post.comments.find(params[:id])
    if @comment.user == current_user
      if @comment.update_attributes(allowed_params)
        flash[:success] = "Updated comment"
        redirect_to post_comments_path
      else
        render 'edit'
      end
    else
        redirect_to post_comments_path
        flash[:notice] = "You can't to this"
    end
    
    # respond_to do |format|
    #   if @comment.update_attributes(allowed_params)
    #     #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
    #     format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully updated.') }
    #     format.xml  { head :ok }
    #   else
    #     format.html { render :action => "edit" }
    #     format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /posts/:post_id/comments/1
  # DELETE /posts/:post_id/comments/1.xml
  def destroy
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = post.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to post_comments_path
    else 
      # @comment.destroy
      redirect_to posts_path
      flash[:danger] = "You can't destroy others post"
    end
    # respond_to do |format|
    #   #1st argument reference the path /posts/:post_id/comments/
    #   format.html { redirect_to(post_comments_url) }
    #   format.xml  { head :ok }
    # end
  end

  private
    def allowed_params
      params.require(:comment).permit(:text)
    end


  # before_filter :authenticate_user!, except: [:show, :index]
  
  # def show
  #   @comment = Comment.find(params[:id])  
  # end

  # def create
  # 	@post = Post.find(params[:post_id])
  # #	@comment = Comment.new(post: @post, text: params[:comment][:text])
  #   @comment = @post.comments.create(allowed_params)
  # 	# if @comment.save
  # 		redirect_to @post
  # 	# else
  # 	# 	flash[:errors]<<"Not created"
  # 	# end
  # end


  # def edit
  #     @post = Post.find(params[:post_id])
  #     @comment = Comment.find(params[:id])
  #     #redirect_to posts_path unless @post.user == current_user
  # end

  # def update
  #       @post = Post.find(params[:post_id])
  #       @comment = Comment.find(params[:id])
  #       if @post.user == current_user
  #           if @comment.update_attributes(allowed_params)
  #               flash[:success] = "Updated comment"
  #               redirect_to @comment.post
  #           else
  #               render 'edit'
  #           end
  #       else
  #           redirect_to @comment.post
  #           flash[:notice] = "You can't to this"
  #       end
  # end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy

  #   redirect_to @comment.post
  # end

  # private
  #   def allowed_params
  #     params.require(:comment).permit(:text)
  #   end





end
