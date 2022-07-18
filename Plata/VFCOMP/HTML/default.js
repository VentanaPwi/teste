<script type="text/javascript">

	function findPos(obj) {
			var curtop = 0;
			if (obj.offsetParent) {
				   do {
						   curtop += obj.offsetTop;
				   } while (obj = obj.offsetParent);
			return [curtop];
			}
	}

	function ScrollToMatch(){
		var MatchDiv = document.getElementById('matchline');
		if(MatchDiv == null)
			return;
		var matchPosition = findPos(MatchDiv);
		var bodyHeight = document.body.offsetHeight;
		var scrollTo = parseInt(matchPosition) - (parseInt(bodyHeight) / 3);
		window.scroll(0, scrollTo);
	}

	function ValorScroll(){ 		
		oFormObject = document.forms['myform'];
		oFormObject.elements["txtScrollValue"].value = document.body.scrollHeight;
	}  	


	window.onload=ScrollToMatch;
</script>