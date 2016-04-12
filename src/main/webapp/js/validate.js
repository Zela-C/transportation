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
			if ($(field).attr("id") != "password"
					&& $(field).attr("id") != "password_in"
					&& $.trim(value) == "") {
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

function validate_login(thisform) {
	with (thisform) {
		var ret = validate_required_form(username_in);
		ret = validate_required_form(password_in) && ret;
		if (ret == true) {
			return true
		} else
			return false
	}
}

function lose_label(field) {
	$(field).removeClass();
}

function login_check(thisForm) {
	if (validate_login(thisForm) == false)
		return false;
	var flag = true;
	$.ajax({
		cache : false,
		type : "POST",
		url : "login",
		data : $(thisForm).serialize(),
		async : false,
		error : function(xmlHttpRequest, msg, exception) {
			Materialize.toast('Request failed:' + msg, 4000, 'toast_wrong')
		},
		success : function(msg) {
			if ('suc' == msg) {
				Materialize.toast('Login successfully!', 4000,'toast_right');
				window.location.href = "path.jsp"
				flag = true;
			} else if ("no_usr" == msg) {
				Materialize.toast('User not exist!', 4000,'toast_wrong');
				$(thisForm.username_in).addClass();
				if ($(thisForm.username_in).hasClass("valid") == true) {
					$(thisForm.username_in).removeClass("valid");
				}
				$(thisForm.username_in).addClass("invalid");
				$(thisForm.username_in_label).addClass("active");
				$(thisForm.password_in).removeClass();
				flag = false;
			} else if ('err_pwd' == msg) {
				Materialize.toast('Wrong password!', 4000,'toast_wrong');
				$(thisForm.password_in).addClass();
				if ($(thisForm.password_in).hasClass("valid") == true) {
					$(thisForm.password_in).removeClass("valid");
				}
				$(thisForm.password_in).addClass("invalid");
				$(thisForm.password_in_label).addClass("active");
				$(thisForm.username_in).removeClass();
				flag = false;
			}
		}
	});
	return flag;
}