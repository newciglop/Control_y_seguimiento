module ResponsibleFunctionsHelper
  def enable_resources(responsible_function,params)
    @enable = params[:enable]
    @enable ? responsible_function.enable = @enable: responsible_function.enable = false
  end
end
