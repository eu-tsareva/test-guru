module ApplicationHelper
  def current_year
    DateTime.current.year
  end

  def github_link(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: 'blank'
  end

  def flash_alert
    return unless flash[:alert]

    content_tag :p, flash[:alert], class: 'flash alert'
  end
end
