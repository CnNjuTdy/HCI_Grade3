(function(){
	$.fn.smint = function( options ) {
		$(this).addClass('smint')
		var settings = $.extend({'scrollSpeed '  : 500}, options);
		return $('.smint a').each( function() {
			if ( settings.scrollSpeed ) {
				var scrollSpeed = settings.scrollSpeed
			}
			var stickyTop = $('.smint').offset().top;
			var stickyMenu = function(){
				var scrollTop = $(window).scrollTop();
				if (scrollTop > stickyTop) { 
					$('.smint').css({ 'position': 'fixed', 'top':0 }).addClass('fxd');
					} else {
						$('.smint').css({ 'position': 'absolute', 'top':stickyTop }).removeClass('fxd'); 
					}   
			};	
			stickyMenu();
			$(window).scroll(function() {
				 stickyMenu();
			});
        	$(this).on('click', function(e){
				var selectorHeight = $('.smint').height();
				e.preventDefault();
		 		var id = $(this).attr('id');
				var goTo =  $('div.'+ id).offset().top -selectorHeight;
				$("html, body").animate({ scrollTop: goTo }, scrollSpeed);
			});	
		});
	}
})();
