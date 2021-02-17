module ConceptsHelper
  def enable_resources(concept,params)
    @enable = params[:enable]
    @enable ? concept.enable = @enable : concept.enable = false
  end
end
