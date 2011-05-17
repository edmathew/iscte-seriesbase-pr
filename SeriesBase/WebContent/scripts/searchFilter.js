/**
 * Filter for Search.jsp.</br> To work properly, this script needs the
 * jquery.cookie file loaded.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version May 2011
 */

$(document).ready(function() {
	var combosearch = {
			additionalFilterTriggers: [$('#quickFind'), $('#hiddenYearField')]	
	};

	$('#searchTable').tableFilter(combosearch);	
});

function refreshFilter() {
	var comboboxString = document.selectForm.selectYear.value;
	var length = comboboxString.length;
	var comma = comboboxString.lastIndexOf(',');
	var sufNumChars = comma + 1;
	
	document.selectForm.hiddenYearField.value=('');
	for(i=0; i < comma; i++)
		document.selectForm.hiddenYearField.value += comboboxString.charAt(i);
	
	document.selectForm.hiddenYearField.value += (' ');
	
	for(i = sufNumChars; i < length; i++)
		document.selectForm.hiddenYearField.value += comboboxString.charAt(i);
	
	$('#hiddenYearField').trigger('focus');
	$('#hiddenYearField').trigger('keydown');
	$('#hiddenYearField').trigger();
}

function PrintValues(){

	  var myString = document.mainform.file.value
	  var myStringLength = myString.length
	  var Comma = myString.lastIndexOf(',')
	  var SufNumChars = Comma + 1

	  document.mainform.result.value=('');

	  for(i=0; i<Comma; i++) 
	  document.mainform.result.value+=(myString.charAt(i));

	  document.mainform.result.value+=(' ');

	  for(i=SufNumChars; i<myStringLength; i++) 
	  document.mainform.result.value+=(myString.charAt(i));

	}
