class Site::HomeController < SiteController
  
  def index
    session[:name] = "Will"

    @categories = Category.order_by_description
    @ads = Ad.descending_order(params[:page])
    @carousel = Ad.random(3)
  end
end
