/**
 * Filter for Search.jsp.</br> To work properly, this script needs the
 * jquery.cookie.js file loaded.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version May 2011
 */

$(document).ready(function() {
	var combosearch = {
			additionalFilterTriggers: [$('#quickFind')]
	};
	
	//$('#searchTable').tableFilter();
	$('#searchTable').tableFilter(combosearch);
	
	
	
	
});
