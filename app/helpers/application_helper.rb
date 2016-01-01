module ApplicationHelper

  def app_scope
    @scope = request.fullpath.to_s.split("/")
    if @scope[1] == "owner"
      "/owner"
    else
      ""
    end
  end
end
