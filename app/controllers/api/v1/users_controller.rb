module Api
  module V1

    class UsersController < ActionController::API

      def index

        ips = Post.select('COUNT(user_ip) as total, user_ip').
            group(:user_ip).
            having('COUNT(user_ip) > 1').
            map{|p| p.user_ip }

        posts = Post.where(user_ip: ips)

        mass = {}
        posts.each do |post|
          if !mass.has_key?(post.user_ip)
            mass[post.user_ip] = [post.login]
          else
            mass[post.user_ip].push(post.login)
          end
        end

        render json: mass, status: 200

      end
    end
  end
end