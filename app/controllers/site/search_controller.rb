class Site::SearchController < SiteController
    def ads
        # cookies[:search_term] = params[:q]

        @ads = Ad.search(params[:q], fields: [:title], page: params[:page], per_page: Ad::QTT_PER_PAGE)
        @categories = Category.all

        # cookies[:categories] = @categories.to_json
    end
end
