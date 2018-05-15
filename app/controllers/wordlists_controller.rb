class WordlistsController < ApplicationController

  def index
  	@list_learn = wordlist_learn.page(params[:page] || 1).per 6
  end
end
