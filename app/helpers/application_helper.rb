module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url
    link_to 'TestGuru', 'https://github.com/DaniyarKulmanov/TestGuru'
  end
end
