module BlogsHelper
  def choose_index_or_edit
    if action_name == 'index' || action_name == 'create' || action_name == 'confirm'
      confirm_blogs_path
    elsif action_name == 'edit'
      blog_path
    end
  end
end
