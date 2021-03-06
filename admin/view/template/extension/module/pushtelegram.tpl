{{header}}
{{column_left}}

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-helloworld" data-toggle="tooltip" title="{{button_save}}" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="{{ cancel }}" data-toggle="tooltip" title="{{ button_cancel}}" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1>{{ heading_title }}></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="{{ breadcrumb['href'] }}">{{ breadcrumb.text}}></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">


        {% if error_warning %}


        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> {{ error_warning }}>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>

        {% endif %}

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> {{ text_edit }}</h3>
            </div>
            <div class="panel-body">




                <div id="status"></div>

                <form action="{{ action }}" method="post" enctype="multipart/form-data" id="form-helloworld" class="form-horizontal">
                    <div class="form-group">


                        <div class="form-group col-lg-8 ">
                            <button type="button" form="form-helloworld" onclick="appText(this);" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add Chat IDs"><i class="fa fa-plus"></i></button>
                            <button type="button" id="test"  data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Test Push Notification"><i class="fa fa-comments-o "></i></button>
                        </div>
                        <br/>


                        <div class="input-group col-lg-5">
                            <span class="input-group-addon" id="basic-addon1">BOT_TOKEN</span>
                            <input type="text" name="pushtelegram_boot_token" id="pushtelegram_boot_token"  value="{% if settings.pushtelegram_boot_token %}{{settings.pushtelegram_boot_token}}{% endif %}" placeholder="BOT_TOKEN" class="form-control" />
                            <span class="input-group-btn"><button  class="btn btn-info " type="button"><i class="fa fa-bookmark"></i></button> </span>


                        </div>
                        <br>



                        {% for key,val in settings.pushtelegram_chat_ids %}

                            <div class="input-group col-lg-5">
                                <span class="input-group-addon" id="basic-addon1">ChatID</span>
                                <input type="text" name="pushtelegram_chat_ids[]" class="form-control"  value="{{ val }}"/>
                                <span class="input-group-btn"><button  class="btn btn-danger removed" type="button"><i class="fa fa-trash-o"></i></button></span>
                            </div>
                            <br>

                        {% endfor %}

                        <div class="col-sm-10">
                              {% if error_code %}
                            <div class="text-danger">{{ error_code }}</div>
                            {% endif %}
                        </div>



                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"></label>
                        <div class="col-sm-10">


                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="order_alert">
                                    {{ entry_send_order_alert }}
                                </label>
                                <div class="col-sm-9">



                                    <input type="checkbox" name="pushtelegram_order_alert" id="order_alert" {% if settings['pushtelegram_order_alert'] %} checked {% endif %} class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="add_total">
                                    {{ entry_add_amount_total}}
                                </label>
                                <div class="col-sm-9">
                                    <input type="checkbox" name="pushtelegram_add_total" id="add_total" {% if settings['pushtelegram_add_total'] %} checked {% endif %}  class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="add_products">
                                    {{ entry_add_products }}
                                </label>
                                <div class="col-sm-9">
                                    <input type="checkbox" name="pushtelegram_add_products" id="add_products" {% if settings['pushtelegram_add_products'] %} checked {% endif %}  class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-12">{{ header_customer_message }}</div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="customer_alert">
                                    {{  entry_send_new_customer_alert }}
                                </label>
                                <div class="col-sm-9">
                                    <input type="checkbox" name="pushtelegram_customer_alert" id="customer_alert" {% if settings['pushtelegram_customer_alert'] %} checked {% endif %}  class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="add_customer_name">
                                    {{  entry_add_customer_name }}
                                </label>
                                <div class="col-sm-9">
                                    <input type="checkbox" name="pushtelegram_add_customer_name" id="add_customer_name"  {% if settings['pushtelegram_add_customer_name'] %} checked {% endif %}  class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
            </div>






        </div>
    </div>
    </form>
</div>
</div>
</div>
</div>


<script type="text/javascript">

    function appText(obj){



        var html ='<div class="input-group col-lg-5">  <span class="input-group-addon" id="basic-addon1">ChatID</span> <input type="text" name="pushtelegram_chat_ids[]" class="form-control"  value=""/> <span class="input-group-btn"><button  class="btn btn-danger removed" type="button"><i class="fa fa-trash-o"></i></button></span></div><br>';

        $(html).appendTo('.form-group:first');

    }

    $('.removed').on('click',function () {


        $(this).parent().prevAll('input').remove();
        $(this).parent().prevAll('span').remove();
        $(this).remove()
//    console.log($(this).parent().prev('input').remove());

    });


    $(document).ready(function(){

        $('#test').click(function(e){


            $('input[name^="pushtelegram_chat_ids"]').each(function() {

                var obj = $(this);
                var val = obj.val();


                var testurl = '{{testUrl}}&pushtelegram_boot_token=' + $('#pushtelegram_boot_token').val() + '&pushtelegram_chat_ids='+ val;

                $.get(testurl, function(e){
                    if(e.ok == 1)
                    {
                        obj.attr('style', "border-radius: 5px; border:#8fbb6c 1px solid;");

                        $("#status").append('<div class="alert alert-success">Message sent succesfully</div>');
                    }else{
                        obj.attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
                        obj.append('<div class="alert alert-danger">Message couldnt be sent, please check your details ---'+ val +'</div>');
                    }
                },"json");
            });




        });
    });


</script>

{{footer}}
