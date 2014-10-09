class BonsaiGalleryController < ApplicationController
  def index
  	@stores = Store.all
  end

  def checkout
  end

  def search
  end
end
