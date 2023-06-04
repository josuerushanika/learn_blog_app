Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  # get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post
  # get "/blog_posts/:id", to: "blog_posts#show"
  # patch "/blog_posts/:id", to: "blog_posts#update", as: :blog_post
  # delete "/blog_posts/:id", to: "blog_posts#destroy"
  # post "/blog_posts", to: "blog_posts#create", as: :blog_posts
  
   resources :blog_post
   
  # Defines the root path route ("/")
   root "blog_posts#index"
end
