module ModalitiesHelper
  def enable_resources(modality,params)
    @enable = params[:enable]
    @enable ? modality.enable = @enable: modality.enable = false
  end
end
