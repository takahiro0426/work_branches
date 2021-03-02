class PostCommentsController < ApplicationController

  def show
  end

  def edit
  end

  def create
    comment = PostComment.new(post_comment_params)
    if comment.save
      redirect_to community_path(params[:post_comment][:community_id], post_community_id: comment.community_post_id)
    else
      redirect_to community_path(params[:post_comment][:community_id], post_community_id: comment.community_post_id), danger: "コメントは1〜30文字以内です"
      # 第一引数はcommunityの特定、第二引数は@select_postへ代入、commentしたpost_communityを表示する処理で使います
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :community_post_id, :user_id).merge(user_id: current_user.id)
  end

end