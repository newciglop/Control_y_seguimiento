module AdminControlsHelper

  def show_tracking_type(admin_control)
    if admin_control.tracking_type == AdminControl.TYPE_IPM
      @show_tracking_type = "IPM -Inmediato  Prioritario Mesa Tecnica"
    elsif admin_control.tracking_type == AdminControl.TYPE_PT
      @show_tracking_type = "PT - Progresivo Tranversal"
    elsif admin_control.tracking_type == "" || @admin_control.tracking_type == nil
      @show_tracking_type = "No tipo de seguimiento registrado"
    end
  end

  def show_responsible_and_support(admin_control)
    responsible = Worker.where(id: admin_control.responsible).map{ |w| [w.first_name,w.last_name]}
    @show_responsible = "#{responsible[0][0]} #{responsible[0][1]}"

    if admin_control.support != nil && admin_control.support != ""
    support = Worker.where(id: admin_control.support).map{ |w| [w.first_name,w.last_name]}
    @show_support = "#{support[0][0]} #{support[0][1]}"
    end
  end



  def show_state_admin_control(admin_control)
    case admin_control.state
    when AdminControl.STATE_STOPPED
      return @show_state = "Detenido"
    when AdminControl.STATE_FINISH
      return @show_state = "Finalizado"
    when AdminControl.IN_PROCESS
      return @show_state = "En proceso"
    when nil
    return @show_state = "No tiene un estado asginado"
    when ""
      return @show_state = "No tiene un estado asginado"
    end
  end

  def enable_resources(admin_control,params)
    @enable = params[:enable]
    @enable ? admin_control.enable = @enable: admin_control.enable = false
  end


end
