class WordlistsController < ApplicationController

	 protect_from_forgery except: :showNew
	 protect_from_forgery except: :showLearn

  def index
  
  end

  def showNew
  		@q = new_word.ransack(params[:q])
  		@list_new = @q.result.page(params[:page] || 1).per 6
  		respond_to do |format|
    		format.html {render layout: true}
  		end
  end

  def showLearn
  		@q = wordlist_learn.ransack(params[:q])
  		@list_word_learn = @q.result.page(params[:page] || 1).per 6
  		respond_to do |format|
    		format.html {render layout: true}
  		end
  end
end
