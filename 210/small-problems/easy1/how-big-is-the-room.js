
function howBigIsTheRoom() {
  // Prompt the unit (meter or feet)
  var inputUnit = prompt('Which unit do you want to use (meters or feet):');
  var unit;
  if (['meters', 'meter', 'm'].includes(inputUnit)) {
    unit = 'meters';
  } else if (['feet', 'foot', 'ft', 'f'].includes(inputUnit)) {
    unit = 'feet';
  } else {
    console.log('Invalid unit.');
    return;
  }

  // Prompt the dimensions of the room
  var inputLength = prompt('Enter the length of the room in ' + unit + ':');
  var inputWidth = prompt('Enter the width of the room in ' + unit + ':');

  var lengthInMeters;
  var lengthInFeet;
  var widthInMeters;
  var widthInFeet;
  
  switch (unit) {
    case 'meters': {
      lengthInMeters = Number(inputLength) || 0;
      lengthInFeet = lengthInMeters * 3.28084;
      widthInMeters = Number(inputWidth) || 0;
      widthInFeet = widthInMeters * 3.28084;
      break;
    }
    case 'feet': {
      lengthInFeet = Number(inputLength) || 0;
      lengthInMeters = lengthInFeet / 3.28084;
      widthInFeet = Number(inputWidth) || 0;
      widthInMeters = widthInFeet / 3.28084;
      break;
    }
  }

  // Calculate and log the area
  var areaInSqMeters = lengthInMeters * widthInMeters;
  var areaInSqFeet = lengthInFeet * widthInFeet;

  switch (unit) {
    case 'meters': {
      console.log('The area of the room is '
        + areaInSqMeters.toFixed(2) + ' square meters ('
        + areaInSqFeet.toFixed(2) + ' square feet).');
      break;
    }
    case 'feet': {
      console.log('The area of the room is '
        + areaInSqFeet.toFixed(2) + ' square feet ('
        + areaInSqMeters.toFixed(2) + ' square meters).');
      break;
    }
  }
}

howBigIsTheRoom();
