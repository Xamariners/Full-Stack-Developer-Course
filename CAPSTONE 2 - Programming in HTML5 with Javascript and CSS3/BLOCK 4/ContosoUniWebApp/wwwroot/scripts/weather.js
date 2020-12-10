// Retrieve the Weather data from User's location 

async function getLocationId(position) {
    let response = await fetch(`https://wedra.azurewebsites.net/api/location/search?lattlong=${position.coords.latitude},${position.coords.longitude}`);
    let data = await response.json();
    return data;
}

async function getWeather(locationId) {
    let response = await fetch(`https://wedra.azurewebsites.net/api/location/${locationId}`);
    let data = await response.json();
    return data.consolidated_weather;
}

async function getWeatherData(position) {
    var location = await getLocationId(position);
    var weather = await getWeather(location.woeid);
        
    document.getElementById("userWeatherLocationText").innerHTML = `Weather in ${location.title}...`;
        
    let template = 
    getWeatherElement(weather[0],'Today') +
    getWeatherElement(weather[1],'Tomorrow') +
    getWeatherElement(weather[2], moment(weather[2].applicable_date).format("MMMM Do"));
    document.getElementById("userWeatherText").innerHTML = template;
};

function getWeatherElement(weatherData, dateText) {
    let divContent =
    `<div>
        <h6>${dateText}</h6>
        <img width="32" height="32" src="https://www.metaweather.com/static/img/weather/${weatherData.weather_state_abbr}.svg" />
        <div>
            ${weatherData.weather_state_name}<br />
            Temp: ${Math.floor(weatherData.max_temp)}&deg;C - ${Math.floor(weatherData.min_temp)}&deg;C
            <br />
            Wind: ${Math.ceil(weatherData.wind_speed)} mph
        </div>
    </div>`;

    return divContent;
};