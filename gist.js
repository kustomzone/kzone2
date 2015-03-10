// Load the Gist after DOM ready
alert( 'hello gist');

$(function() {
	
	// Get the placeholder
	
	var placeholder = $( "#placeholder" );
	
	// alert(content);
	
	// var placeholder = $("#box5");
	
	// $( "#box5" ).css( "border", "3px solid red" );
	
	// var tnode  = document.createElement('p');
	// tnode.setAttribute('color', 'red');
	// var textnode = document.createTextNode('Hello World');
	// tnode.appendChild(textnode);
	// placeholder.appendChild(tnode);
	
	// Get the gist with the given ID. This will come back as both a hash of file names and an ordered array.
	var gistResult = $.getGist( "1600811" );
	
	// When the gist has loaded, append the contents to the rendered DOM
	gistResult.done(
		
		function( gist ) {
			
			// Empty the placeholder
			placeholder.empty();
			
			// Get the ordered files
			var ordered = gist.ordered;
			
			// Add each gist to the content
			for (var i = 0 ; i < ordered.length; i++) {
				
				// Add a title for the gist
				placeholder.append( "<h3>" + ordered[ i ].fileName + "</h3>" );
				
				// Add the gist content
				placeholder.append( ordered[ i ].content );
				
				// var content = placeholder.childNodes[0];
				// var content = ordered[1].content.text;
				// alert(content.text);
				
			}
		}
	);
});


// -----------------------------------------------------------------------------
