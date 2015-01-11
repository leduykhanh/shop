<script type="text/javascript">
    var titancomments_controller_url = '{$titancomments_controller_url}';
    var titancomments_secure_key = '{$secure_key}';
    var titancomments_id_product_comment_form = '{$titancomments_id_product_comment_form}';
    var titancomments_moderation_active = {$titancomments_moderation_active};
    var titancomments_added_moderation = '{l s='Your comment has been submitted and will be available once approved by a moderator.' mod='productcomments' js=1}';
</script>

<div class="row control-row" >
    <div class="col-sm-3 titancomments_add_comment" id="titancomments_add_comment">
        Add a Comment</div>
    <div class="col-sm-3 titancomments_submit_comment" id="titancomments_submit_comment">
        <a > Submit </a></div>
    <div class="col-sm-3 titancomments_rules_of_forum" id="titancomments_rules_of_forum"><a href="index.php?controller=leehowitworks" class="iframe"> Rules of Forum  <span class="balance-icon"></span></a> </div>

    
</div>
<div id="titancomments_form">
{if $is_logged}
    <form id="id_titancomments_form" action="#">
        <div class="comment_author col-sm-2">
            <div class="comment_author_infos">
                <strong itemprop="author">{$titancomments_customer_name}</strong>
            </div>
        </div>
        <div class="comment_details col-sm-10">
            <textarea id="titancomments_content" name="content"></textarea>
        </div>
    </form>
{else}
	<span> Please log in to add your comment
{/if}
</div>
<br/>
<script type='text/javascript'>
    $(document).ready(function(){
        $("#titancomments_rules_of_forum a").click(function(ev){
            ev.preventDefault();
        });
        $("#titancomments_rules_of_forum a").fancybox({
               'Width'    :       960 ,
               'Height'   :       640,
               'hideOnContentClick': false, 
               'type':'iframe'
          }); 
    });
</script>
