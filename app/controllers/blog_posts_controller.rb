class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
   

    def index
        @blog_posts = BlogPost.published
    end

    def show
    end    

    def new 
        if user_signed_in?
         @blog_post = BlogPost.new
        else
           redirect_to root_path
        end     
    end

    def create 
        @blog_post =BlogPost.new(blog_post_params)
         if @blog_post.save
            redirect_to @blog_post
         else    
            render :new, status: :unprocessable_entity
         end   
    end
    
    def edit
         @blog_post = BlogPost.find(params[:id])
    end
      
    def update
        @blog_post = BlogPost.find(params[:id])
        if @blog_post.update(blog_post_params)
            redirect_to @blog_post
        else
            render :edit, status: :unprocessable_entity
        end    
    end

    def destroy
        @blog_post = BlogPost.find(params[:id])
        @blog_post.destroy
        redirect_to root_path
    end

    private

    def blog_post_params
        params.require(:blog_post).permit(:title, :body, :published_at)
    end

    def set_blog_post
        @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.where("published_at <= ?", Time.now).find(params[:id])


        @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.where("published_at <= ?", Time.now).find(params[:id])

        rescue ActiveRecord::RecordNotFound
            redirect_to root_path
    end

  
end