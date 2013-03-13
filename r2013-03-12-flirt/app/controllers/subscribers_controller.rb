class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end
  def create
    binding.pry
    @subscriber = Subscriber.create(params[:subscriber])
  end
end
