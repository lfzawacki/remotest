
// really wanted to know how you work :( 
//var $j = jQuery.noConflict();

//$j('div.test').click(function(){
//  $j('li').children('div').slideDown('200')
//  return false;
//});

//$j('div.test').click(function(){
//  $j('li').children('div').slideUp('200')
//  .parent().removeClass('open').addClass('closed');
//  return false;
//});
// 
//$j('li a.expand').click(function(){
//  $j(this).next().slideToggle('slow')
//  .parent().toggleClass('open').toggleClass('closed');
//  return false;
//}); 

function toggleText(id,show,hide)
{
		if (document.getElementById(id).style.display == 'none')
		{
			document.getElementById(id).style.display = 'block';
			fieldHidden(id + '_text', hide);
		}
		else
		{
			document.getElementById(id).style.display = 'none';
			fieldHidden(id + '_text', show);
		}

}

function fieldHidden(id,text)
{
	  document.getElementById(id).innerHTML = text;

}

