$(document).ready(function() {
  $('.page-content').on('click', '.js-delete', jsDelete);
});

function jsDelete(e) {
    e.preventDefault();

    if (!confirm('Delete?')) {
        return;
    }

    $.ajax({
        url: $(this).attr('href'),
        type: 'DELETE',
        success: function(result) {
            location.reload();
        }
    });
}
