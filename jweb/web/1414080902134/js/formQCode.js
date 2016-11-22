/**
 * 
 */

function formQCode() {
	var qc = "werWERTYU4tVugh6yopQ5CvbnmqBiasdfPANM1z9OSDFG237IZXjklHxc8JKL";
	var date = new Date();
	var code = [];
	code.push(qc[date.getYear() - 116]);
	code.push(qc[date.getMonth()]);
	code.push(qc[date.getDate()]);
	code.push(qc[date.getHours()]);
	code.push(qc[date.getMinutes()]);
	code.push(qc[date.getSeconds()]);
	return code.join('');
}

