module Deleteable
  extend ActiveSupport::Concern
  private

  def delete_with_references(obj, path)
    begin
      res = obj.destroy
      redirect_to path, :flash => { :success => t('action.destroy_success') }
    rescue
      redirect_to path, :flash => { :error => t('action.destroy_error') }
    end
  end

  end