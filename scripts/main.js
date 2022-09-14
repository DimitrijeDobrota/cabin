// This code is only used to remember theme selection
const themeSwitch = document.querySelector('.theme_switch');
themeSwitch.checked = localStorage.getItem('switchedTheme') === 'true';

themeSwitch.addEventListener('change', function (e) {
  if(e.currentTarget.checked === true) {
    // Add item to localstorage
    localStorage.setItem('switchedTheme', 'true');
  } else {
    // Remove item if theme is switched back to normal
    localStorage.removeItem('switchedTheme');
  }
});

document.querySelectorAll(".back").forEach((element, key) => {
  element.addEventListener('click', function(event){
      history.go(-1);
  })
})
