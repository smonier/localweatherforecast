function weatherForecast(provider, apiKey, units, language, color) {

	  var location = document.getElementById("location");
	  var apiKey = apiKey; // PLEASE SIGN UP FOR YOUR OWN API KEY
	  var url = 'https://api.forecast.io/forecast/';
      var skycons = new Skycons({"color": color});
      var unit = "<sup>°C</sup>";
	  var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
	  if (units == "us") { unit = "<sup>°F</sup>";}

	  if (provider == "DarkSky") {
		  url = 'https://api.forecast.io/forecast/';


		  navigator.geolocation.getCurrentPosition(success, error);

		  function success(position) {
			  latitude = position.coords.latitude;
			  longitude = position.coords.longitude;

			  console.log('Latitude is ' + latitude + '° <br> Longitude is ' + longitude + '°');

			  $.getJSON(url + apiKey + "/" + latitude + "," + longitude +  "&lang=" + language + "&callback=?", function (data) {
				  var city = (data.timezone).split("/");
				  var d = new Date(data.currently.time * 1000);
				  document.getElementById("cityPic").src = 'https://source.unsplash.com/featured/?' + city[1] + ',' + data.currently.icon;
				  $('#temp').html(Math.round(data.currently.temperature) + unit);
				  $('#timezone').html(city[1]);
				  $('#wCity1').html(city[1]);
				  $('#wDate').html(d.toDateString());
				  $('#wDate1').html(d.toDateString());
				  $('#wTime').html(d.toLocaleTimeString());
				  $('#wTime1').html(d.toLocaleTimeString());
				  skycons.add("icon1", (data.currently.icon).toUpperCase());
				  $('#summary').html(data.daily.summary);
				  for (var i = 0; i < data.daily.data.length; i++) {
					  var dailyTemp = data.daily.data[i];
					  var d1 = new Date(dailyTemp.time * 1000);
					  $('#day' + (i + 1)).html(d1.getDate() + ' ' + months[d1.getMonth()]);
					  skycons.add("dailyIcon" + (i + 1), (dailyTemp.icon).toUpperCase());
					  $('#templow' + (i + 1)).html(Math.round(dailyTemp.temperatureLow) + unit);
					  $('#temphigh' + (i + 1)).html(Math.round(dailyTemp.temperatureHigh) + unit);
				  }

				  skycons.play();
				  console.log(data.currently.temperature + unit + " " + data.timezone);
			  });
		  }

		  function error() {
			  console.log("Unable to retrieve your location");
		  }

		  console.log("Locating..."+provider);
	  }
	if (provider == "openWeatherMap") {
		url = 'https://api.openweathermap.org/data/2.5/onecall';
		navigator.geolocation.getCurrentPosition(success, error);

		function success(position) {
			latitude = position.coords.latitude;
			longitude = position.coords.longitude;
			if (units == "us") { unitCall = "imperial";}
			if (units == "si") { unitCall = "metric";}


			console.log('Latitude is ' + latitude + '° <br> Longitude is ' + longitude + '°');

			$.getJSON(url + "?lat=" + latitude + "&lon=" + longitude + "&units="+ unitCall + "&appid=" + apiKey, function (data) {
				var city = (data.timezone).split("/");
				var d = new Date(data.current.dt * 1000);
				document.getElementById("cityPic").src = 'https://source.unsplash.com/featured/?' + city[1] + ',' + data.current.weather[0].main;
				$('#temp').html(Math.round(data.current.temp) + unit);
				$('#timezone').html(city[1]);
				$('#wCity1').html(city[1]);
				$('#wDate').html(d.toDateString());
				$('#wDate1').html(d.toDateString());
				$('#wTime').html(d.toLocaleTimeString());
				$('#wTime1').html(d.toLocaleTimeString());
				document.getElementById("iconow").src = 'http://openweathermap.org/img/wn/' + data.current.weather[0].icon + '@2x.png';
				$('#dailySummary').html(data.current.weather[0].description);
				$('#summary').html(data.current.weather[0].description);
				for (var i = 0; i < data.daily.length; i++) {
					var dailyTemp = data.daily[i];
					var d1 = new Date(dailyTemp.dt * 1000);
					$('#day' + (i + 1)).html(d1.getDate() + ' ' + months[d1.getMonth()]);
					document.getElementById("iconow"+ (i + 1)).src = 'http://openweathermap.org/img/wn/' + dailyTemp.weather[0].icon + '@2x.png';
					$('#templow' + (i + 1)).html(Math.round(dailyTemp.temp.night) + unit);
					$('#temphigh' + (i + 1)).html(Math.round(dailyTemp.temp.day) + unit);
				}
				console.log(data.currently.temperature + unit + " " + data.timezone);
			});
		}

		function error() {
			console.log("Unable to retrieve your location");
		}

		console.log("Locating..."+provider);
	}
}

