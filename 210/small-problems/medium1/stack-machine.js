
function execute(program) {
  var stack = [];
  var register = 0;

  var checkStackIsNotEmpty = function () {
    if (stack.length === 0) {
      throw new Error('Stack is empty!');
    }
  }

  program.split(' ').forEach(function (instruction) {
    if (!!Number(instruction)) {
      register = Number(instruction);
      return;
    }

    switch (instruction) {
      case 'PRINT': {
        console.log(register);
        break;
      }
      case 'PUSH': {
        stack.push(register);
        break;
      }
      case 'POP': {
        checkStackIsNotEmpty();
        register = stack.pop();
        break;
      }
      case 'ADD': {
        checkStackIsNotEmpty();
        register += stack.pop();
        break;
      }
      case 'SUB': {
        checkStackIsNotEmpty();
        register -= stack.pop();
        break;
      }
      case 'MULT': {
        checkStackIsNotEmpty();
        register *= stack.pop();
        break;
      }
      case 'DIV': {
        checkStackIsNotEmpty();
        register = Math.floor(register / stack.pop());
        break;
      }
      case 'MOD': {
        checkStackIsNotEmpty();
        register = Math.floor(register % stack.pop());
        break;
      }
      default: throw new SyntaxError('Invalid instruction: "' + instruction + '"');
    }
  });
}

// Examples

(execute('PRINT'));
// 0

(execute('5 PUSH 3 MULT PRINT'));
// 15

(execute('5 PRINT PUSH 3 PRINT ADD PRINT'));
// 5
// 3
// 8

(execute('5 PUSH POP PRINT'));
// 5

(execute('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT'));
// 5
// 10
// 4
// 7

(execute('3 PUSH PUSH 7 DIV MULT PRINT'));
// 6

(execute('4 PUSH PUSH 7 MOD MULT PRINT'));
// 12

(execute('-3 PUSH 5 SUB PRINT'));
// 8

(execute('6 PUSH'));
//
// (nothing is printed because the `program` argument has no `PRINT` commands)
