class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @quiz = question.quiz
    @client = client || Octokit::Client.new(access_token: '4c3a23a637b7c09db8d613e7bc36ff4c72346c41')
  end

  def call
    @client.create_gist(gist_params)
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
