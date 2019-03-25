module ApplicationHelper
  def current_year
    DateTime.current.year
  end

  def github_link(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: 'blank'
  end
end
