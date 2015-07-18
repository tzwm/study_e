$(document).on('ready page:load', function() {
  var questionModal = $('#addQuestionModal');
  var questionInput = $('#addQuestionModal #questionInput');
  var questionsList = $('#questionsList');
  var questionnaireId = $('p.title').data('id');

  questionModal.on('show.bs.modal', function(e) {
    questionInput.val('');
  });

  $('#submitQuestion').click(function(e) {
    var title = questionInput.val();

    $.post('/questions/create_and_relate', {title: title, questionnaire_id: questionnaireId})
    .done(function(data) {
      if (data.status === "success") {
        questionModal.modal('hide');

        var item = "<li>" + data.question.title + "</li>";
        var del = "<a rel='nofollow' data-method='delete' href='/questions/" + data.question.id +  "'>删除</a>";
        questionsList.append(item);
        questionsList.append(del);
      }

    });

  });
  
});
