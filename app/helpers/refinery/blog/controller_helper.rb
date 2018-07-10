module Refinery
  module Blog
    module ControllerHelper
    
      protected
    
        def find_blog_post
          unless (@post = Refinery::Blog::Post.find(params[:id])).try(:live?)
            if refinery_user? and current_refinery_user.authorized_plugins.include?("refinerycms_blog")
              @post = Refinery::Blog::Post.find(params[:id])
            else
              error_404
            end
          end
        end

        # def find_all_blog_posts
        #   if params[:vlog]
        #     @posts = Refinery::Blog::Post.where("video_url != ?", "").live.includes(:comments, :categories).page(params[:page])
        #   else
        #     @posts = Refinery::Blog::Post.where("video_url = ?", "").live.includes(:comments, :categories).page(params[:page])
        #   end
        # end

        def find_tags
          @tags = Refinery::Blog::Post.tag_counts_on(:tags)
        end
        def find_all_blog_categories
          @categories = Refinery::Blog::Category.all
        end
    end
  end
end
