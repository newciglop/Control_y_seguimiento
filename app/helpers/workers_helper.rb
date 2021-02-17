module WorkersHelper
  def enable_resources(worker,params)
    @enable = params[:enable]
    @enable ? worker.enable = @enable: worker.enable = false
  end

  def find_name_profile(worker)

    ids = Worker.where(id:worker.id).pluck(:profile_2,:profile_3,:profile_4)
    profile_two_id = ids.map{|x| x[Worker.CHARACTERISTIC_TWO]}
    profile_three_id = ids.map{|x| x[Worker.CHARACTERISTIC_THREE]}
    profile_four_id =  ids.map{|x| x[Worker.CHARACTERISTIC_FOUR]}

    @characteristic_two = Profile.where(id:profile_two_id).map{|x| x.name}[Worker.CHARACTERISTIC_TWO]
    @characteristic_three = Profile.where(id:profile_three_id).map{|x| x.name}[Worker.CHARACTERISTIC_TWO]
    @characteristic_four = Profile.where(id:profile_four_id).map{|x| x.name}[Worker.CHARACTERISTIC_TWO]
  end
end
