module ThemesHelper
  def enable_resources(theme,params)
    @enable = params[:enable]
    @enable ? theme.enable = @enable : theme.enable = false
  end
end
