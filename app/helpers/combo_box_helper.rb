module ComboBoxHelper

  def combo_box_all
    @profiles = Profile.where(enable: true).map{|x| [x.name , x.id]}
  end


  def combo_box_type_identification
    @identification_types = TypeIdentification.all
    @identification_types = @identification_types.map{|x| [x.name , x.id]}
  end

  def combo_box_general_data
    @concepts = Concept.where(enable: true).order("name").map{|concept| [concept.name , concept.id]}
    @themes = Theme.where(enable: true).order("name").map{|theme| [theme.name , theme.id]}
    @types = Type.where(enable:true).order("name").map{|type| [type.name , type.id]}
    @items = Item.where(enable:true).order("name").map{|item| [item.name , item.id]}
    @tracking_types = AdminControl.COMBO_TRACKING_TYPES.map{|type| [type[0], type[1]]}
    @states = AdminControl.COMBO_STATES.map { |state| [state[0], state[1]] }
  end

  def combo_box_company
    @companies = Company.where(enable: true).order("name").map{|company| [company.name, company.id]}
    @cities = City.includes(:state).order(:name).map{|c| [c.name+" - "+c.state.name, c.id]}
  end

  def combo_box_personal
    @responsible_functions = []
    responsible_functions = ResponsibleFunction.where(enable:true).map{|x| [x.name, x.id]}
    responsible_functions.each  do |responsible|
      @responsible_functions << responsible
    end

  end

  def combo_box_responsible
    profiles_responsible = Profile.where('(enable=? AND profile_type=?) OR (enable=? AND profile_type=?)',true,Profile.RESPONSIBLE,true,Profile.WILDCARD).pluck(:id)
    ids_profile = profiles_responsible
    @worker_responsible = Worker.where('(profile_id IN (?)) or (profile_2 IN (?)) or (profile_3 IN (?)) or (profile_4 IN (?))',ids_profile,ids_profile,ids_profile,ids_profile).map{|employee| [employee.full_name,employee.id]}
  end
  def combo_box_support
    profiles_responsible = Profile.where('(enable=? AND profile_type=?) OR (enable=? AND profile_type=?)',true,Profile.SUPPORT,true,Profile.WILDCARD).pluck(:id)
    ids_profile = profiles_responsible
    @worker_support = Worker.where('(profile_id IN (?)) or (profile_2 IN (?)) or (profile_3 IN (?)) or (profile_4 IN (?))',ids_profile,ids_profile,ids_profile,ids_profile).map{|employee| [employee.full_name,employee.id]}
  end
end