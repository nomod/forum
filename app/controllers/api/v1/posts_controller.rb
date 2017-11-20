module Api
  module V1

    class PostsController < ActionController::API

      def index

        marks_posts =
            Mark.group(:post_id).
            average('value').
            sort_by{ |id, value| value}.
            reverse!.
            first(20).
            map{|p| p[0] }

        popular_posts = Post.where(id: marks_posts)

        mass = []
        popular_posts.each_with_index do |post, index|
          mass[index] = {header: post.header, content: post.content}
        end

        render json: mass, status: 200

      end

      def create

       if params[:add_mark]

        post = Post.find_by(id: params[:post_id])
        user = User.find_by(login: params[:login])

        user_post = Mark.find_by(post_id: post.id, login: user.id)

        if user_post
          render json: {message: 'Вы уже поставили оценку данному посту'}, status: 500
        else

          new_mark = Mark.new(mark_params)

          if new_mark.save
            medium_mark = Mark.where(post_id: params[:post_id]).average(:value)
            render json: {medium_mark: medium_mark}, status: 200
          end

        end

       else

         new_post = Post.new(post_params)

         if new_post.save

           login = User.find_by(login: params[:login])

           if login

           else
             user = User.new(user_params)
             user.save
           end

           render json: {new_post: new_post}, status: 200
         else
           render json: {new_post: new_post}, status: 422
         end

        end

      end

      private

      def post_params
        params.permit(:header, :content, :login, :user_ip)
      end

      def user_params
        params.permit(:login)
      end

      def mark_params
        params.permit(:value, :post_id, :login)
      end

    end
  end
end


