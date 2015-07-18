// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready page:load', function() {
  var questionModal = $('#addQuestionModal');
  var questionnaireForm = $('#questionnaireForm');
  var questionInput = $('#addQuestionModal #questionInput');

  questionModal.on('show.bs.modal', function(e) {
    questionInput.val('');
  });

  $('#submitQuestion').click(function(e) {
    var title = questionInput.val();

    $.post('/questions/', {title: title})
    .done(function(data) {
      if (data.status === "success") {
        questionModal.modal('hide');

        var item = "<p>" + data.question.title + "</p>";
        var input = "<input type='hidden' name='question_ids[]' value="+ data.question.id + ">";
        questionnaireForm.append(item);
        questionnaireForm.append(input);
      }

    });

  });
  
});
