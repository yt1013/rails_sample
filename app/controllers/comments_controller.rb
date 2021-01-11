class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
            
        if @comment
            redirect_to article_path(@article)
        else
            render 'show'
        end
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
