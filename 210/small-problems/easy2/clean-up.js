
function cleanUp(string) {
  return string.replace(/[^\w]+/g, ' ');
}

// Test
console.log(cleanUp("---what's my +*& line?") === " what s my line ");
