class HomeController < ApplicationController
    def index
        str =  "**********************************************\n"
        str += "**********************************************\n"
        str += "***              RS BASE API               ***\n"
        str += "**********************************************\n"
        str += "**********************************************"
        render plain: str
    end
end
