function reload(){
	window.location.reload();
}
function help(url){
	to(url);
}

//ת��ҳ��
function to(url){
	window.location.href=url;
}
//����
function back(){
	history.go(-1);
}
function del(msg,url){
	alert(msg);
    var flag=window.confirm(msg);
	if (flag){
		to(url);
	}
}

function setCurTime(oid){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth()+1;
	var day=now.getDate();
	var timeString = year+"-"+month+"-"+day;
	var oCtl = document.getElementById(oid);
	oCtl.value = timeString;
}
