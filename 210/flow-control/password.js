var password = 'Fnord'

function passwordDialog() {
  var input;
  for (var i = 0; i <= 2; i++) {
    input = prompt('Please enter your password:');
    if (input === password) {
      console.log('You have successfully logged in.');
      return;
    }
  }
  console.log('You have been denied access.');
}

passwordDialog();
