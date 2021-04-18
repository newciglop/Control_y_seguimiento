module Resources
  extend ActiveSupport::Concern
  private

  def enable_resources(obj,params)
    @enable = params[:enable]
    @enable ? obj.enable = @enable: obj.enable = false
  end


  end