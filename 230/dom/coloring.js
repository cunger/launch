function colorGeneration(generation, node = document.body) {
  if (generation === 0) {
    color(node);
  } else {
    children(node).forEach(function (child) {
      colorGeneration(generation - 1, child);
    });
  }
}

function children(node) {
  return Array.prototype.slice.call(node.children);
}

function color(node) {
  node.classList.add('generation-color');
}

// Example 
colorGeneration(3);
