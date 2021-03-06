module PostsHelper

  def self.get_good_posts posts, user_id
    good_posts = []

    ##refactor
    posts.each do |post|
      ##if user is not joined with post they have not marked it as read and is therefore a good post
      PostsUsers.where("tweet_id = ? AND user_id = ?", post.id, user_id)  == [] ? good_posts.push(post) : false
    end
    return good_posts
  end
end
