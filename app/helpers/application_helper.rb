module ApplicationHelper
  def current_year
    DateTime.current.year
  end

  def github_link(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: 'blank'
  end

  def flash_message
    flashes = []
    flash.each do |key, message|
      flashes.push content_tag :p, message, class: "flash #{key}"
    end
    flashes.join.html_safe
  end
end
