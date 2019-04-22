class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @quiz = question.quiz
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "A question about #{@quiz.title} from TestGuru",
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
