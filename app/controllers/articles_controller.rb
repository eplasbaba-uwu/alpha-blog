class ArticlesController < ApplicationController
    before_action :get_id, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end
    
    def create
        @article = Article.new(whitelisting)
        if @article.save
            flash[:notice] = "Article was created and saved!!"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def update
        if @article.update(whitelisting)
            flash[:notice] = "Article updated without any issues!!"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private
    def get_id
        @article = Article.find(params[:id])
    end

    def whitelisting
        params.require(:article).permit(:title, :description)
    end
end