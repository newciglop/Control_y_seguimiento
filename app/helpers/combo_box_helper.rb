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
    @tracking_types = AdminControl.COMBO_TRACKING_TYPES.map{|type| [type.name , type.id]}
    @states = AdminControl.COMBO_STATES.map { |state| [state.name , state.id] }
  end

  def combo_box_company
    @companies = Company.where(enable: true).order("name").map{|company| [company.name, company.id]}
    @cities = City.includes(:state).order(:name).map{|c| [c.name+" - "+c.state.name, c.id]}
  end

  def combo_box_personal
    profiles = Profile.where('(enable=? AND profile_type=?) OR (enable=? AND profile_type=?)',true,Profile.RESPONSIBLE_ROL,true,Profile.WILDCARD).map{|x| [x.name,x.id]}
    responsible_functions = ResponsibleFunction.where(enable:true).map{|x| [x.name, x.id]}
    @responsible_functions = []
    profiles.each do |profile|
      @responsible_functions << profile
    end
    responsible_functions.each  do |responsible|
      @responsible_functions << responsible
    end



  end

end