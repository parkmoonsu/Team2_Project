
jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
    $.backstretch("https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRNvekx_Vqvwj44QYkCMbRufTpWKg5YtXx8FQv2PWrBH9-0m8me");
    
    /*
        Form validation
    */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    $('.login-form').on('submit', function(e) {
    	
    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
    		if( $(this).val() == "" ) {
    			e.preventDefault();
    			$(this).addClass('input-error');
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });
    
    
});
