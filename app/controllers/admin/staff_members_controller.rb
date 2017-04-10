class Admin::StaffMembersController < Admin::BaseController
  before_action :set_staff_member, only: [:show, :edit, :update, :destroy]

  def index
    @staff_members = StaffMember.all
  end

  def show; end

  def new
    @staff_member = StaffMember.new(user: User.new)
  end

  def edit; end

  def create
    @staff_member = StaffMember.new({ user: User.new }.merge(staff_member_params))

    if @staff_member.save
      redirect_to admin_staff_members_path, notice: "Staff Member was successfully created."
    else
      render :new
    end
  end

  def update
    if @staff_member.update(staff_member_params)
      redirect_to admin_staff_members_path, notice: "Staff Member was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @staff_member.destroy
    redirect_to admin_staff_members_path, notice: "Staff Member was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_member
      @staff_member = StaffMember.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def staff_member_params
      params.require(:staff_member).permit(:name, :email, :password, :password_confirmation)
    end
end
