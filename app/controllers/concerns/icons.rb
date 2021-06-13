module Icons
  extend ActiveSupport::Concern

  def show_icons
    @show_eye = "<span class='btn btn-sm btn-outline-success'> <i class='far fa-eye'></i> </span>".html_safe
    @show_edit = "<span class='btn btn-sm btn-outline-primary'> <i class='far fa-edit'></i> </span>".html_safe
    @show_trash = "<span class='btn btn-sm btn-outline-danger'>  <i class='fas fa-trash-alt'></i> </span>".html_safe
  end



end