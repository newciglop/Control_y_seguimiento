module StudentsHelper

  def show_leader
  @f_leader = Worker.where(id: @student.leader_first).first
  @f_name = @f_leader.first_name + " " + @f_leader.last_name
  @f_leader2 = Worker.where(id: @student.leader_second).first
  @f_name2 = @f_leader2.first_name + " " + @f_leader2.last_name
  end
=begin
  @agreement  = University.where(id: @student.university_id).first.agreement
  if @agreement.to_i == 1
    @n_agreement = "Si"
  elsif @agreement.to_i == 2
    @n_agreement = "No"
  else
    @n_agreement = "En proceso"
  end
=end
end
