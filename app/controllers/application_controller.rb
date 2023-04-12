class ApplicationController < ActionController::Base
  def homepage
    render ({ :template => "/homepage.html.erb"})
  end
end
