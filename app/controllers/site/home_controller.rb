class Site::HomeController < SiteController
  
  def index
    # cookies[:user_name] = "david"

    HardWorker.perform_async("Willamy")
    @categories = Category.order_by_description
    @ads = Ad.descending_order(params[:page])
    @carousel = Ad.random(3)
  end
end
