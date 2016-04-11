/**
 * 
 */
function validate_email(field) {
	with (field) {
		var tmp = value.indexOf(" ");
		if (tmp != -1)
			return false;
		apos = value.indexOf("@")
		dotpos = value.lastIndexOf(".")
		if (apos < 1 || dotpos - apos < 2) {
			return false
		} else {
			return true
		}
	}
}
function validate_required(field) {
	var label = "#" + $(field).attr("id") + "_label";
	with (field) {
		if ($(field).attr("id") == "password") {
			validate_confirm(document.getElementById("confirm"));
		}
		if (value == null || value == "") {
			$(field).removeClass();
			$(label).removeClass();
			if ($(field).attr("id") == "email") {
				$(field).addClass("validate");
			}
			return false;
		} else {
			if ($(field).attr("id") != "password" && $(field).attr("id") != "password_in" && $.trim(value) == "") {
				if ($(field).hasClass("valid") == true) {
					$(field).removeClass("valid")
				}
				$(field).addClass("invalid");
				$(label).addClass("active");
				return false;
			} else if ($(field).attr("id") != "email") {
				if ($(field).hasClass("invalid") == true) {
					$(field).removeClass("invalid")
				}
				$(field).addClass("valid");
				$(label).addClass("active");
				return true;
			} else if ($(field).attr("id") == "email") {
				var ret = validate_email(field);
				if (ret == false) {
					if ($(field).hasClass("valid") == true) {
						$(field).removeClass("valid")
					}
					$(field).addClass("invalid");
					$(label).addClass("active");
				} else if (ret == true) {
					if ($(field).hasClass("invalid") == true) {
						$(field).removeClass("invalid")
					}
					$(field).addClass("valid");
					$(label).addClass("active");
					return ret;
				}
			}
		}
	}
}

function validate_confirm(field) {
	var label = "#" + $(field).attr("id") + "_label";
	with (field) {
		if (value == null || value == "") {
			$(field).removeClass();
			$(label).removeClass();
			return false;
		} else {
			if (value != $("#password").val()) {
				if ($(field).hasClass("valid") == true) {
					$(field).removeClass("valid")
				}
				$(field).addClass("invalid");
				$(label).addClass("active");
				return false;
			} else {
				if ($(field).hasClass("invalid") == true) {
					$(field).removeClass("invalid")
				}
				$(field).addClass("valid");
				$(label).addClass("active");
				return true;
			}
		}
	}
}

function validate_required_form(field) {
	var label = "#" + $(field).attr("id") + "_label";
	with (field) {
		if (value == null || $.trim(value) == "") {
			if ($(field).hasClass("valid") == true) {
				$(field).removeClass("valid")
			}
			$(field).addClass("invalid");
			$(label).addClass("active");
			return false
		} else {
			return true;
		}
	}
}

function validate_form(thisform) {
	with (thisform) {
		var ret = validate_required_form(username);
		ret = validate_required_form(email) && ret;
		ret = validate_required_form(password) && ret;
		ret = validate_confirm(confirm) && ret;
		ret = validate_required_form(confirm) && ret;
		ret = $("#email").hasClass("valid") && ret;
		if (ret == true) {
			return true
		} else
			return false
	}
}

function validate_login(thisform){
	with (thisform) {
		var ret = validate_required_form(username_in);
		ret = validate_required_form(password_in) && ret;
		if (ret == true) {
			return true
		} else
			return false
	}
}

function lose_label(field){
	$(field).removeClass();
}