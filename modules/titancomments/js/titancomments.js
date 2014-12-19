$(document).ready(function() {
    $('.titancomments_submit_comment').hide();
    $('#titancomments_form').hide();

    $('.titancomments_add_comment').click(function(e){
        $('.titancomments_add_comment').hide();
        $('.titancomments_submit_comment').show();
        $('#titancomments_form').show();
    });

    $('.titancomments_submit_comment').click(function(e){
        e.preventDefault();

        url_options = '?';
        if (!productcomments_url_rewrite)
            url_options = '&';

        $.ajax({
            url: titancomments_controller_url + url_options + 'action=add_comment&secure_key=' + titancomments_secure_key + '&rand=' + new Date().getTime(),
            data: $('#id_titancomments_form').serialize(),
            type: 'POST',
            headers: { "cache-control": "no-cache" },
            dataType: "json",
            success: function(data){
                if (data.result)
                {
                    $('.titancomments_submit_comment').hide();
                    $('#titancomments_form').hide({duration:400});
                    $('#id_titancomments_form')[0].reset();
                    $('.titancomments_add_comment').show();
                }
                else
                {
                }
            }
        });

        return false;
    });

});