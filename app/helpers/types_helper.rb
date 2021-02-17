module TypesHelper

  def enable_resources(type,params)
      @enable = params[:enable]
       @enable ? type.enable = @enable: type.enable = false
  end

end
