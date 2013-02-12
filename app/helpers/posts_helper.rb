module PostsHelper

  def display_post_name(post)
    "#{post.titel} updated #{distance_of_time_in_words_to_now(post.updated_at)} ago"

  end

end
