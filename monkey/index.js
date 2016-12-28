(function() {
  const TARGET = 'It was the best of times, it was the blurst of times.';
  const LETTERS = 'abcdefghijklmnopqrstuvwxyz ,. ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
  const LETTER_LENGTH = LETTERS.length;
  const DISPLAY = document.querySelector('.display');
  var input = '';

  function addCharacter() {
    input += LETTERS[~~(Math.random() * LETTER_LENGTH)];
  }

  function render() {
    DISPLAY.innerText = input;
  }

  function checkValidity() {
    return input === TARGET.substr(0, input.length);
  }

  function run() {
    addCharacter();
    render();

    if (!checkValidity()) {
      input = input.substr(0, input.length - 1);
    }

    if (input !== TARGET) {
      setTimeout(run, 0);
    } else {
      input += ' 🙊';
    }
  }

  run();
}());
