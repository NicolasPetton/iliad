ILApplication subclass: HTML5ApplicationExample [
    
    <category: 'Iliad-More-HTML5Elements'>
    <comment: nil>

    HTML5ApplicationExample class >> path [
	<category: 'accessing'>
	^'examples/html5'
    ]

    index [
	<category: 'controllers'>
	^self examples
    ]

    examples [
	<category: 'controllers'>
	^[:e |
	    e 
		h3: 'Canvas example'.
	    e build: self canvas.
	    e 
		h3: 'Geolocation example'.
	    e build: self geolocation.
	    e
		h3: 'Audio example'.
	    e build: self audio.
	    e
		h3: 'Video example'.
	    e build: self video]
    ]

    canvas [
	<category: 'building'>
	^[:e |
	    e canvas
		id: 'tutoriel';
		width: '700';
		height: '350';
		text: '&lt;canvas&gt; non support&eacute; !'.
	    e script
		type: 'text/javascript';
		contents:  'var context = document.getElementById("tutoriel").getContext("2d");
			var lastX = context.canvas.width * Math.random();
			var lastY = context.canvas.height * Math.random();
			var hue = 0;
			function line() {
			context.save();
			context.translate(context.canvas.width/2, context.canvas.height/2);
			context.scale(0.9, 0.9);
			context.translate(-context.canvas.width/2, -context.canvas.height/2);
			context.beginPath();
			context.lineWidth = 5 + Math.random() * 10;
			context.moveTo(lastX, lastY);
			lastX = context.canvas.width * Math.random();
			lastY = context.canvas.height * Math.random();
			context.bezierCurveTo(context.canvas.width * Math.random(),
				context.canvas.height * Math.random(),
				context.canvas.width * Math.random(),
				context.canvas.height * Math.random(),
				lastX, lastY);
			hue = hue + 10 * Math.random();
			context.strokeStyle = "hsl(" + hue + ", 50%, 50%)";
			context.shadowColor = "white";
			context.shadowBlur = 10;
			context.stroke();
			context.restore();
				}
			setInterval(line, 50);
			function blank() {
			context.fillStyle = "rgba(0,0,0,0.1)";
			context.fillRect(0, 0, context.canvas.width, context.canvas.height);
				}
			setInterval(blank, 40);']
    ]

    geolocation [
	<category: 'building'>
	^[:e |
	    e div id: 'myPosition'.
	    e script 
		type: 'text/javascript';
		contents: 'function getPosition(position) {
		coords  = "Latitude : "+position.coords.latitude+"<br/>";
		coords += "Longitude: "+position.coords.longitude+"<br/>";
		coords += "Altitude : "+position.coords.altitude+"<br/>";
		document.getElementById("myPosition").innerHTML = coords;
			}
		if(navigator.geolocation)
			navigator.geolocation.getCurrentPosition(getPosition);
		else
			document.getElementById("myPosition").innerHTML =
			"geolocation non support&eacute; !";']
    ]

    audio [
	<category: 'building'>
	^[:e |
	    e audio src: 'http://w3c.html5.free.fr/news/media/cod4_victoire_usa.ogg';
		autoplay: true;
		loop: true;
		controls: true;
		text: '&lt; audio&gt; non support&eacute; !'.
	    e br.
	    e audio src:  'http://w3c.html5.free.fr/news/media/interessant.wav';
		controls: true.]
    ]

    video [
	<category: 'building'>
	^[:e |
	    e video src: 'http://www.w3schools.com/html5/movie.ogg';
		poster: 'http://www.w3schools.com/img/5.gif';
		autoplay: true;
		loop: true;
		controls: true.
	    e br]
    ]
]
