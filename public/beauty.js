
var $j = jQuery.noConflict();

$j('div.test').click(function(){
  $j('li').children('div').slideDown('200')
  return false;
});

$j('div.test').click(function(){
  $j('li').children('div').slideUp('200')
  .parent().removeClass('open').addClass('closed');
  return false;
});
 
$j('li a.expand').click(function(){
  $j(this).next().slideToggle('slow')
  .parent().toggleClass('open').toggleClass('closed');
  return false;
}); 

