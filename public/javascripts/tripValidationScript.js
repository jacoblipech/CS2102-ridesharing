function check(event) {
    // Get Values
    var origin = document.getElementById('origin').value;
    var destination = document.getElementById('destination').value;

    // Simple Check
    if(origin.length != 6) {
        alert("Invalid Postal Code");
        event.preventDefault();
        event.stopPropagation();
        return false;
    }
    if(destination.length != 6) {
        alert("Invalid Postal Code");
        event.preventDefault();
        event.stopPropagation();
        return false;
    }
}

