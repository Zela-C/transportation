/**
 * 
 */
var id = 3;
function add_stop() {
	var element = document.getElementById("stations");

	var div4 = document.createElement("div");
	div4.className += "input-field col s12 m12 l12";
	var input4 = document.createElement("input");
	input4.id = "routine_add_station_cost" + (id - 1);
	input4.type = "text";
	var label4 = document.createElement("label");
	label4.id = input4.id + "_label";
	var label4_text = document.createTextNode("Cost");
	label4.appendChild(label4_text);

	div4.appendChild(input4);
	div4.appendChild(label4);
	element.appendChild(div4);

	var div1 = document.createElement("div");
	div1.className += "input-field col s12 m4 l4";
	var input1 = document.createElement("input");
	input1.id = "routine_add_station_name" + id;
	input1.type = "text";
	var label1 = document.createElement("label");
	label1.id = input1.id + "_label";
	var label_text1 = document.createTextNode("Station Name");
	label1.appendChild(label_text1);
	div1.appendChild(input1);
	div1.appendChild(label1);
	element.appendChild(div1);

	var div2 = document.createElement("div");
	div2.className += "input-field col s12 m4 l4";
	var input2 = document.createElement("input");
	input2.id = "routine_add_station_start" + id;
	input2.type = "text";
	var label2 = document.createElement("label");
	label2.id = input2.id + "_label";
	var label_text2 = document.createTextNode("Start Time");
	label2.appendChild(label_text2);
	div2.appendChild(input2);
	div2.appendChild(label2);
	element.appendChild(div2);

	var div3 = document.createElement("div");
	div3.className += "input-field col s12 m4 l4";
	var input3 = document.createElement("input");
	input3.id = "routine_add_station_end" + id;
	input3.type = "text";
	var label3 = document.createElement("label");
	label3.id = input3.id + "_label";
	var label_text3 = document.createTextNode("End Time");
	label3.appendChild(label_text3);
	div3.appendChild(input3);
	div3.appendChild(label3);
	element.appendChild(div3);

	++id;
}

//删除Station页面中的站点的对话框
var pos = -1;
function deleteStation(tpos) {
	pos = tpos;
	$("#delete_dialog").openModal();
}
function toServlet() {
	var url = "deletestation?pos=" + pos;
	$.ajax({
				cache : false,
				type : "POST",
				url : url,
				async : false,
				error : function(xmlHttpRequest, msg, exception) {
					Materialize.toast('Request failed:' + msg, 4000,
							'toast_wrong')
				},
				success : function(msg) {
					if ('suc' == msg) {
						Materialize.toast('Delete successfully!', 4000,
								'toast_right');
						window.location.reload(true);
					} else if ("err" == msg) {
						Materialize
								.toast(
										'You can not delete this station before remving it form corresponding routines!',
										4000, 'toast_wrong');
					}
				}
			});
}

var routinePos = -1;
function deleteRoutine(tpos) {
	routinePos = tpos;
	var routineId="#routine_pos"+tpos;
	$('#delete_routine_dialog').openModal();
}
function toDelteteRoutineServlet() {
	var url = "deleteroutine?pos=" + routinePos;
	$.ajax({
		cache : false,
		type : "POST",
		url : url,
		async : false,
		error : function(xmlHttpRequest, msg, exception) {
			Materialize.toast('Request failed:' + msg, 4000, 'toast_wrong')
		},
		success : function(msg) {
			Materialize.toast('Delete successfully!', 4000, 'toast_right');
			window.location.reload(true);
		}
	});
}