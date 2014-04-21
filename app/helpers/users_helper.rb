module UsersHelper
  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end
end
