class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @quiz = question.quiz
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status.to_s.start_with?('2')
  end

  private

  def gist_params
    {
      description: I18n.t('gist.question', quiz_title: @quiz.title),
      files: {
        'text-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
