

const initDynamicHeartButton = () => {
  var heartButtons = document.querySelectorAll(".heart-button");
  

  heartButtons.forEach((heartButton) => {
    heartButton.addEventListener( 'click', (event) => {
      var button = event.currentTarget;
      if (button.classList.contains("far")) {
        button.classList.remove("far");
        button.classList.add("fas");
      } else {
        button.classList.remove("fas");
        button.classList.add("far");
      }
    })
  })
}

export {initDynamicHeartButton};

