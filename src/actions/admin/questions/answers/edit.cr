class Admin::Questions::Answers::Edit < BrowserAction
  get "/admin/questions/:question_id/answers/:answer_id/edit" do
    answer = AnswerQuery.new.preload_question.find(answer_id)
    html EditPage,
      operation: SaveAnswer.new(answer),
      answer: answer,
      question_id: question_id
  end
end