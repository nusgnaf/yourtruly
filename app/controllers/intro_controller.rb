class IntroController < ApplicationController
  @@idx = Student.all.map {|one| one.stuid }
  # before_action :check_valid
  # skip_before_action :check_valid
  def index
    session[:valid?] ||= false
    session[:submitted?] ||= false
    unless session[:valid?]
      flash[:error] = "Please input your student ID"
    end

  end

  def check
    stuid = params[:stuid].to_i
    if @@idx.include?(stuid)
      @student = Student.find_by(stuid: stuid)
      session[:valid?] = true
      session[:stuid] = stuid
    end
    # redirect_back(fallback_location: '/intro/index')
    redirect_to '/intro/index', notice: "请在1月20日之前上传作业！"
  end

  def upload
    @student = Student.find_by(stuid: session[:stuid])
    if @student.update(params.permit(:homework))
      session[:submitted?] = true
      redirect_to '/intro/index'
    end
  end

  def backdoor
    reset_session
    redirect_to '/intro/index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :stuid, :submitted?, :homework)
    end

    def check_valid

    end
end
