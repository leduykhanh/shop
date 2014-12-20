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

        d = {
            "customer-id":1,
            "title":"Comment",
            "content":$('#titancomments_content').val(),
            "id_product":titancomments_id_product_comment_form,
            "criterion":[1,2,3,4,5]
        };
        console.log($.param(d));

        $.ajax({
            url: titancomments_controller_url + url_options + 'action=add_comment&secure_key=' + titancomments_secure_key + '&rand=' + new Date().getTime(),
            data: $.param(d),
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
                    $.fancybox.close();
                    var buttons = {};
                    buttons["OK"] = "titanCommentRefreshPage";
                    fancyChooseBox(titancomments_moderation_active ? titancomments_added_moderation : d.content, d.title, buttons);
                }
                else
                {
                }
            }
        });

        return false;
    });

});

function titanCommentRefreshPage() {
    //window.location.reload();
}