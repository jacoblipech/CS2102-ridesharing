function check(event) {
	// Get Values
	var email = document.getElementById('email').value;
	var password = document.getElementById('password').value;
	var name = document.getElementById('name').value;

	// Simple Check
	if(email.length == 0) {
		alert("Invalid email");
		event.preventDefault();
		event.stopPropagation();
		return false;
	}
	if(password.length < 8) {
		alert("Invalid password, minimum 8 characters");
		event.preventDefault();
		event.stopPropagation();
		return false;
	}
	if(name.length == 0) {
		alert("Please key in your name");
		event.preventDefault();
		event.stopPropagation();
		return false;
	}
}
