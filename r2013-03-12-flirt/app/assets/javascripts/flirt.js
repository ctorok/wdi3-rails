$(document).ready(document_ready);

function document_ready()
{
  show_or_hide_login_register_links();
}

function show_or_hide_login_register_links()
{
  $('#form').empty();

  if($('.username').length)
    $('#anonymous').hide();
  else
     $('#anonymous').show();
}

function cancel_subscriber_form()
{
  $('#form').empty();
}

function cancel_login_form()
{
  $('#form').empty();
}
