(function() {
  const TARGET = 'It\xa0was\xa0the\xa0best\xa0of\xa0times,\xa0it\xa0was\xa0the\xa0blurst\xa0of\xa0times.';
  const LETTERS = 'abcdefghijklmnopqrstuvwxyz\xa0,.ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
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
      render();
    }
  }

  run();
}());
