# Dynamically generate a gallery from a gist.

# (work in progress)

# api spec: https://developer.github.com/v3/

# For a given gist, e.g. https://gist.github.com/anonymous/5446951, you can access a JSON object containing
# the HTML markup and CSS URI for the Gist at https://gist.github.com/anonymous/5446989.json 


require 'open-uri'
require 'json'
require 'uri'
require 'net/http'
require 'net/https'


# For the vector class
# (note: install gmath3D gem if not already installed)

require 'gmath3D'

SITE = "http://localhost:9000/".downcase
FOLDER = "img/palette/"
FILE = "bars".downcase
DOWNLOAD = false

puts "Fetching json..."

json  = JSON.parse(open("http://www.colourlovers.com/api/palettes/top?format=json").readlines.join)

# json = JSON.parse(open("https://gist.github.com/anonymous/5446989.json").readlines.join)

xml = "<scene>\n"
xml += <<-EOF

  <spawn position="0 0 24" />

EOF

i = 0

json.each do |palette|

  title = palette["title"].slice(0,70)
  
  if title.length == 70
    title = title.sub(/\.+$/, '') + "..."
  end
  
  uri = URI.parse(URI.encode(palette["imageUrl"]))
  extension = File.extname(uri.path).downcase
  
  # jpg, jpeg, png...
  
  next unless extension == ".jpg" || extension == ".jpeg" || extension == ".png"
  
  puts " * #{uri.to_s}"
  
  if DOWNLOAD
    `curl #{uri.to_s} -s -o #{FOLDER}#{FILE}-#{i}#{extension}` || next
    `mogrify -resize 450x450 #{FOLDER}#{FILE}-#{i}#{extension}` || next
  end
  
  x = i % 5
  z = (i / 5).floor
  y = 1
  
  v  = GMath3D::Vector3.new(x-3, 0.03, -z+3) * 7
  v += GMath3D::Vector3.new(10, y, -10)
  
  height  = `identify #{FOLDER}#{FILE}-#{i}#{extension}`.match(/x(\d+)/)[1].to_i + 650
  height2 = height + 440

  xml += <<-EOF
    <billboard position="#{v.x} #{v.y} #{v.z}" rotation="0 0 0" scale="2 2 0.07">
      <![CDATA[
        <center style='margin-top: 8px; font-size: 5em;'>
			<div style='color: #000000; background: url(#{SITE}#{FOLDER}#{FILE}-#{i}#{extension}); background-size: 1365px; background-repeat: no-repeat; align: center; opacity: 0.4; display: block; margin-left: auto; margin-right: auto;'>
				#{title}
			</div>
			<table style='background-color: #101010; font-size: 0.5em; width: 100%;'>
			 <tr>
			  <td style='vertical-align: top;' height= '#{height2}'>
			    <div id='box#{i}' height='100%'>
				  <p style='color: #00FF33'></p>
				</div>
			</td></tr></table>
		  
		  <script>
		  
		  
		   // dynamically load a Gist without an iframe:
		   
		   // loadGist(element, 5446951);
		   
		   
		    if (#{i}== 0) { 
				
				var parent = document.getElementById('box0');
				var child  = parent.childNodes[1];
				var tnode  = document.createElement('p');
				tnode.setAttribute('color', 'red');
				var textnode = document.createTextNode(' <div id="notMe"><p>id="notMe"</p></div><div id="myDiv">id="myDiv"</div> ');
				tnode.appendChild(textnode);
				child.appendChild(tnode);
				// alert(child.innerHTML);
				
			}
		   
			if (#{i}== 1) { 
				
				// var parent1 = document.getElementById('box1');
				// var script1  = document.createElement('script');
				// script1.setAttribute('src', 'http://kustomzone.github.io/kzone/js/app.js');
				// parent1.appendChild(script1);
				// alert(parent1.innerHTML);
				
			}
			
			if (#{i}== 2) { 
				
				var parent2 = document.getElementById('box2');
				var image = document.createElement('img');
				image.setAttribute('src', './img/Future-Space-Missions.png');
				image.setAttribute('height', '1024');
				image.setAttribute('width' , '1366');
				parent2.appendChild(image);
				// alert(parent2.innerHTML);
				
			}
			
			if (#{i}== 3) { 
				
				// var parent3 = document.getElementById('box3');
				// var iframe = document.createElement('iframe');
				// iframe.setAttribute('src', 'http://kustomzone.github.io/kzone/index2.htm');
				// parent3.appendChild(iframe);
				// alert(parent3.innerHTML);
				
			}
			
			if (#{i}== 4) { 
				
				// var parent4 = document.getElementById('box4');
				// var child4 = parent4.childNodes[1];
				// var gistId = 5446951;
				// var script4 = document.createElement('script');
				// script4.setAttribute('src', 'https://gist.github.com/' + gistId + '.json');
				// child4.appendChild(script4);
				// alert(child4.innerHTML);
				
			}
			
			if (#{i}== 5) { 
			
			// ======================================================
			
			// <div id="notMe"><p>id="notMe"</p></div>
			// <div id="myDiv">id="myDiv"</div>
			
			// jQuery: $('h1').css('color','red');
				
			// JavaScript: document.getElementById("hello").style.color = "#000267";
			
			// DataURIs..
			
			// function addStyle(css){
			//	var datuURIs = document.createElement("link");
			//	document.head = document.head || document.getElementsByTagName('head'[0]);
			//	datuURIs.href = "data:text/css,"+css;
			//	datuURIs.rel = "stylesheet";
			//	document.head.appendChild(datuURIs);
			// }
			
			// addStyle('h1{color:red;}');
			
			// addStyle('h2{width:200px;}body{background:yellow}');
			
			// =====================================================
			
				var parent5 = document.getElementById('box5');
				
				// var child5 = parent5.childNodes[1];
				
				var script5a = document.createElement('div');
				script5a.setAttribute("id", "placeholder");
				// script5a.setAttribute('height', '1200');
				// script5a.setAttribute('width' , '1366');
				// script5a.setAttribute('margin-left', 'auto');
				// script5a.setAttribute('margin-right', 'auto');
				// script5a.setAttribute('margin-top', 'auto');
				// script5a.setAttribute('margin-bottom', 'auto');
				// parent5.appendChild(script5a);
				
				// child5 = document.getElementById('placeholder');
				// var image = document.createElement('img');
				// image.setAttribute('src', './img/portal.png');
				// image.setAttribute('height', '820');
				// image.setAttribute('width' , '820');
				// child5.appendChild(image);
				// alert(child5.innerHTML);
				
				// var datuURIs = document.createElement('link');
				// document.head = document.head || document.getElementsByTagName('head'[0]);
				// datuURIs.href = 'data:text/css,'+css;
				// datuURIs.rel = 'stylesheet';
				// document.head.appendChild(datuURIs);
				
				// document.head = document.head || document.getElementsByTagName('head'[0]);
				// var gist = document.createElement('script');
				// gist.setAttribute('src', 'gist.js');
				// gist.setAttribute('type', 'text/javascript');
				// document.head.appendChild(gist);
			
				// var script5b = document.createElement('script');
				// script5b.setAttribute('src', 'gist.js');
				// parent5.appendChild(script5b);
				
			}
			
			if (#{i}== 6) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			
			if (#{i}== 7) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			
			if (#{i}== 8) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			
			if (#{i}== 9) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			
			if (#{i}== 10) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			
			if (#{i}== 11) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			
			if (#{i}== 12) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			
			if (#{i}== 13) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			
			if (#{i}== 14) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			if (#{i}== 15) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			if (#{i}== 16) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			if (#{i}== 17) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			if (#{i}== 18) { 
				
				// alert('hello world =' + #{i}); 
				
			}
           if (#{i}== 19) { 
				
				// alert('hello world =' + #{i}); 
				
			}
			
		   </script>
		
        </center>
      ]]>
    </billboard>
	
EOF

  v.y = 0.2
  
  v  += GMath3D::Vector3.new(1.2, 0, 0)

  palette["colors"].each do |color|
    xml += "<box style='color:##{color};' scale='0.4 0.4 0.4' position='#{v.x} #{v.y.round(2)} #{v.z}' />"
    v += GMath3D::Vector3.new(0, 0.4, 0)
  end

  i += 1
end

xml += "</scene>"

File.open("./scene/test.xml", "w") { |f| f.write xml }

puts "Visit /test.xml to see the gallery."
