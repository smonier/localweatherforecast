function weatherForecast(apiKey, units, language, color) {

	  var location = document.getElementById("location");
	  var apiKey = apiKey; // PLEASE SIGN UP FOR YOUR OWN API KEY
	  var url = 'https://api.forecast.io/forecast/';
      var skycons = new Skycons({"color": color});
      var unit = " °C";
		
  	  if (units == "us") { unit = " °F";}
  
	  navigator.geolocation.getCurrentPosition(success, error);

	  function success(position) {
	    latitude = position.coords.latitude;
	    longitude = position.coords.longitude;

	    console.log('Latitude is ' + latitude + '° <br> Longitude is ' + longitude + '°');

	     $.getJSON(url + apiKey + "/" + latitude + "," + longitude + "?units="+ units +"&lang=" + language + "&callback=?", function(data) {
          $('#temp').html(data.currently.temperature+unit);
		  $('#timezone').html(data.timezone);
  	      skycons.add("icon1",(data.currently.icon).toUpperCase());
  		  skycons.play();
		
		   console.log(data.currently.temperature+unit +" " +data.timezone);
	    });
	  }

	  function error() {
	    console.log("Unable to retrieve your location");
	  }

	  console.log("Locating...");
	}

