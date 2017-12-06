// JavaScript Document

$(function(){
	
	var a="#51ae26";
	var b="#ababab";
	var w="90%";
	var h="18px";
	var div = $(".divbar");
	var barb=function(){
		div.each(function(){
		    var width = $(this).attr('data-w');
		    var barbox = '<div class="barbox"><div class="barline"><div w="' + width + '" class="charts" style="width:0px"><d></d></div></div></div>';
			$(this).append(barbox);
		})
	}
	
	var amimeat=function(){
		$(".charts").each(function(i,item){
			var wi=parseInt($(this).attr("w"));
			$(item).animate({width: wi+"%"},1000,function(){
				$(this).children('d').html(wi+"%");
			});
		});
	}
	var barbCss=function(a,b){
		$(".barbox").css({
			"height":20,
			"line-height":h,
			"text-align":"center",
			"color":"#fff",
		})
		$(".barbox>dd").css({
			"float":"left"
		})	
		$(".barline").css({
			"width":w,
			"background":b,
			"height":h,
			"overflow":"hidden",
			"display": "inline-block",
			"position":"relative",
			"border-radius":"4px",
		})
		$(".barline>d").css({
			"position":"absolute",
			"top":"0px",
		})
		$(".charts").css({
			"background":a,
			"height":h,
			"width":"0px",
			"overflow":"hidden",
			"border-radius":"4px"
		})
	}
	barb();
	amimeat();
	barbCss(a,b);
})
