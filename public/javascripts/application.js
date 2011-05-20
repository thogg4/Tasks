$(document).ready(function(){
	
	
	
	
	$(".delete").click(function(){
		$.post(this.href, {_method:'delete'}, null, "script");
		var pelement = $(this).parent();
		var element = $(pelement).parent();
		$(element).remove();
		return false
	});		
	
	$("#task_name").focus();
	
	$(window).load(function(){
		setTimeout(function(){ $("#flash_notice").fadeOut("slow");}, 2000);
	});
	
	
//for new site box TODO: change this!! this code sucks
	$("#new_site_opened").hide();
	$("#new_site_box").hide();
	$("#new_site_opened").css("cursor", "pointer");
	$("#new_site_closed").css("cursor", "pointer");
	$("#new_site_closed").click(function(){
		$("#new_site_box").load("/sites/new", function(){$("#new_site_box").show();});
		$(this).hide();
		$("#new_site_opened").show();
	});
	
	$("#new_site_opened").click(function(){
		$("#new_site_box").hide();
		$("#new_site_box").empty();
		$(this).hide();
		$("#new_site_closed").show();
	});
	
	
	//right click stuff
	var site_name = $("#get_site_name_from_site").attr("site");
	$(window).contextMenu('context-menu-1', {
        'Home': {
            click: function(element) { window.location = "/" },
            klass: "context_menu_item"
        },
        'New Task': {
            click: function(element){ openNewTask() },
            klass: "context_menu_item_new_task",
        }
    });


	function openNewTask() {
		var site = $("#get_site_name_from_site").attr("site");
		$("#new_task_form").load("/sites/"+site+"/tasks/new");
		$("#new_task_form").animate({
	    	width: 'toggle',
	  	});
		
	};
	
	
	$("#new_task").jaxy();	
	
	
	$(".task_check_box").live('click', function (){  
		var site_name = $(this).attr("name");
		var task_id = $(this).attr("id");
	  $.post("/sites/"+site_name+"/tasks/"+task_id+"/task_change", $(this).serialize(), null, "script");
	  return false;  
	});
	
	
	
	
	$(".controls").hide();//get and hide all controls
	$(".task").hover(function(){
		var tname = $(this).attr("name");
		$("#controls_"+tname).fadeIn();//fade in controls with the id of controls_[task id]
	}, function(){
		var tname = $(this).attr("name");
		$("#controls_"+tname).fadeOut();//fade out controls with the id of controls_[task id]
	});
	
	
	$(".edit_task_box").hide();
	$(".edit_task_button").toggle(function(){
		var tid = $(this).attr("id");
		var sname = $(this).attr("site");
		$("#edit_task_box_"+tid).load("/sites/"+sname+"/tasks/"+tid+"/edit", function(){$("#edit_task_box_"+tid).fadeIn();});
		return false;
	}, function(){
		var tid = $(this).attr("id");
		var sname = $(this).attr("site");
		$("#edit_task_box_"+tid).fadeOut();
		$("#edit_task_box_"+tid).empty();
	});
	
	
	$(".view_task_box").click(function(){
		$(this).fadeOut().empty();
	});

	$(".view_task_box").hide();
	$(".view_task_button").toggle(function(){
		var tid = $(this).attr("id");
		var sname = $(this).attr("site");
		$("#view_task_box_"+tid).load("/sites/"+sname+"/tasks/"+tid, function(){$("#view_task_box_"+tid).fadeIn();});
		return false;
	}, function(){
		var tid = $(this).attr("id");
		var sname = $(this).attr("site");
		$("#view_task_box_"+tid).fadeOut();
		$("#view_task_box_"+tid).empty();
	});    

	
	
	
	

	
	

});
