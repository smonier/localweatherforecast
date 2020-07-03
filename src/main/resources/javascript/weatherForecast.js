function weatherForecast(apiKey, units, language, color) {

	  var location = document.getElementById("location");
	  var apiKey = apiKey; // PLEASE SIGN UP FOR YOUR OWN API KEY
	  var url = 'https://api.forecast.io/forecast/';
      var skycons = new Skycons({"color": color});
      var unit = " °C";
	  var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];

	if (units == "us") { unit = " °F";}
  
	  navigator.geolocation.getCurrentPosition(success, error);

	  function success(position) {
	    latitude = position.coords.latitude;
	    longitude = position.coords.longitude;

	    console.log('Latitude is ' + latitude + '° <br> Longitude is ' + longitude + '°');

	     $.getJSON(url + apiKey + "/" + latitude + "," + longitude + "?units="+ units +"&lang=" + language + "&callback=?", function(data) {
           var city = (data.timezone).split("/");
           var d = new Date(data.currently.time * 1000);
           document.getElementById("cityPic").src = 'https://source.unsplash.com/featured/?' + city[1] + ',' +data.currently.icon;
			  $('#temp').html(data.currently.temperature+unit);
			  $('#timezone').html(city[1]);
			  $('#wCity1').html(city[1]);
			  $('#wDate').html(d.toDateString());
			  $('#wDate1').html(d.toDateString());
			  $('#wTime').html(d.toLocaleTimeString());
			  $('#wTime1').html(d.toLocaleTimeString());
			  skycons.add("icon1",(data.currently.icon).toUpperCase());
			  $('#summary').html(data.daily.summary);
			  for (var i = 0; i < data.daily.data.length; i++) {
				 var dailyTemp = data.daily.data[i];
				 var d1 = new Date(dailyTemp.time * 1000);
				 $('#day'+(i+1)).html(d1.getDate() +' '+ months[d1.getMonth()]);
				 skycons.add("dailyIcon"+(i+1),(dailyTemp.icon).toUpperCase());
				  $('#templow'+(i+1)).html(Math.round(dailyTemp.temperatureLow));
				  $('#temphigh'+(i+1)).html(Math.round(dailyTemp.temperatureHigh));
			  }

			 skycons.play();
		   console.log(data.currently.temperature+unit +" " +data.timezone);
	    });
	  }

	  function error() {
	    console.log("Unable to retrieve your location");
	  }

	  console.log("Locating...");
	}

