// Retrieve User's location
// Calculate User's distance from University

const universityLocation = {
    latitude: 1.3521,  // decimal degrees
    longitude: 103.8198 // decimal degrees
};

function getLocationSuccess(position) {

    // Calculate User distance from University
    const distance = Math.floor(distanceInKilometers(position.coords, universityLocation))
    const message = "You are " + distance + " km away from the University!";
    document.getElementById("userDistanceText").innerHTML = message;

    // pass on to weather.js
    getWeatherData(position);
};

function getLocationError() {
    document.getElementById("userDistanceText").innerHTML = "Could not detect your current location.";
};

// Retrieve the User location
navigator.geolocation.getCurrentPosition(getLocationSuccess, getLocationError);

// Calculate Distance
function distanceInKilometers(p1, p2) {
    let lat1 = p1.latitude; // inputs are in decimal degrees
    const lon1 = p1.longitude;
    let lat2 = p2.latitude;
    const lon2 = p2.longitude;

    const dLat = (lat2 - lat1) * Math.PI / 180;
    const dLon = (lon2 - lon1) * Math.PI / 180;
    lat1 = (lat1) * Math.PI / 180;
    lat2 = (lat2) * Math.PI / 180;

    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

    const radiusOfEarthInKilometers = 6378.1;
    return radiusOfEarthInKilometers * c;
};