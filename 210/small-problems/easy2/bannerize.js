function logInBox(text, width) {
  var textWidth = width - 4 || text.length

  var border = '+' + '-'.repeat(textWidth + 2) + '+';
  var empty  = '|' + ' '.repeat(textWidth + 2) + '|';

  console.log(border);
  console.log(empty);
  logBlock(text, textWidth);
  console.log(empty);
  console.log(border);
}

function logBlock(text, textWidth) {
  var words = text.split(' ');
  var currentLine = '';

  for (word of words) {
    if (currentLine.length + 1 + word.length <= textWidth) {
      currentLine += word + ' ';
    } else {
      console.log('| ' + currentLine + ' '.repeat(textWidth - currentLine.length) + ' |');
      currentLine = word + ' ';
    }
  }

  if (currentLine.trim() !== '') {
    console.log('| ' + currentLine + ' '.repeat(textWidth - currentLine.length) + ' |');
  }
}

// Examples

logInBox('To boldly go where no one has gone before.');
logInBox('');
logInBox('To boldly go where no one has gone before.', 20);
