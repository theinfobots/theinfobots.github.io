 function copyCMD() {
  /* Get the text field */
  var copyText = document.getElementById("cmd");
  /* Select the text field */
  copyText.select();
  copyText.setSelectionRange(0, 99999); /* For mobile devices */
  document.execCommand("copy");
  /* Alert the copied text */
  alert("Commands copied!");
} 
