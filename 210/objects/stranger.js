function greetings(nameParts, profession) {
  console.log('Hello ' + nameParts.join(' ') + '! ' +
    'Nice to have a ' + profession.title + ' ' + profession.occupation + ' around.');
}

// Example

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });
