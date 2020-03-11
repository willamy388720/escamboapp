class SiteController < ApplicationController
    before_action :authenticate_admin!
    layout "site"

end