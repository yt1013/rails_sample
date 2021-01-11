class CommentsController < ApplicationController
    http_basic_authenticate_with name: 'dhh', password: 'secret', 
        only: [:destroy]

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        # バリデーションを考慮するならば、↓の方が良いか？
        # @comment = @article.comments.build(comment_params)
        # @comment.save
        
        # render 'articles/show'で返すとURIが変わらないためエラーを返せない...
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])

        @comment = @article.comments.find(params[:id])
        @comment.destroy

        redirect_to article_path(@article)
    end

    private def comment_params
        params.required(:comment).permit(:commenter, :body)
    end
end
