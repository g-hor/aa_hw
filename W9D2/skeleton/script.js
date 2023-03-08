document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!

  const submit = document.getElementsByClassName('favorite-submit')[0];
  
  submit.addEventListener('click', event => {
    event.preventDefault();
    const input = document.getElementsByClassName('favorite-input')[0];
    const submission = input.value;
    input.value = '';
    
    if (submission.length) {
      const ul = document.getElementById('sf-places');
      const li = document.createElement('li');
      li.textContent = submission;
      ul.appendChild(li);
    }
  })



  // adding new photos

  // --- your code here!

  const toggleButton = document.getElementsByClassName('photo-show-button')[0];

  toggleButton.addEventListener('click', event => {
    event.preventDefault();
    const photoForm = document.getElementsByClassName('photo-form-container')[0];
    photoForm.classList.toggle('hidden');
  })

  const photoButton = document.getElementsByClassName('photo-url-submit')[0];

  photoButton.addEventListener('click', event => {
    event.preventDefault();
    const input = document.getElementsByClassName('photo-url-input')[0];
    const url = input.value;
    input.value = '';

    const ul = document.getElementsByClassName('dog-photos')[0];
    const li = document.createElement('li');
    const img = document.createElement('img');
    img.src = url;
    // img.setAttribute("src", url)
    li.appendChild(img);
    ul.appendChild(li);
  })

});
