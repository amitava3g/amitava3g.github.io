function loadPagesData() {
	$(".group1").colorbox({rel:'group1'});
}

function loadPageSpecificDataContact() {
	loadPageSpecificData();
	contactMe();
}

function loadPageSpecificData(){
	loadSpecificImage();
	var node = document.createElement("DIV");  
	node.id = 'audioPlayer';
	node.alt = "Mute/Unmute Audio";
	document.getElementById("controls").appendChild(node);
	document.getElementById('audioPlayer').innerHTML = '<a id="audioControl" href="javascript:playPauseAudio()"><img src="img/unmute.jpg" alt="Pause Music" title="Pause Music"/></a><audio id="audioFile" alt="Mute/Unmute Audio" title="Mute/Unmute Audio" src="theme/Jason_Shaw_-_RUNNING_WATERS.mp3" autoplay loop></audio>';
	checkAudioStatus();
}

var global = 0;
function checkAudioStatus() {
	var audioCookieVal = getCookie('audio');
	if (audioCookieVal == '1') {
		global = 0;
 	} else {
 		global = 1;
	}
	playPauseAudio();
}

function playPauseAudio(){
	global = global + 1;
	if (global % 2 == 1) {
		document.getElementById('audioFile').pause();
		document.getElementById('audioControl').innerHTML = '<img src="img/mute.jpg" alt="Play Music" title="Play Music"/>';
		document.cookie = "audio=1;expired=;path=/";
	} else {
		document.getElementById('audioFile').play();
		document.getElementById('audioControl').innerHTML = '<img src="img/unmute.jpg" alt="Pause Music" title="Pause Music"/>';
		document.cookie = "audio=0;expired=;path=/";
	}
}

function menuLink() {
	if (document.getElementById('menuData').style.display == 'none') {
		$('#menuData').show(300);
		document.getElementById('menuImg').src = "img/button-tray-up.png";
	} else {
		$('#menuData').hide(300);
		document.getElementById('menuImg').src = "img/button-tray-down.png";
	}
}

function contactMe() {
	document.getElementById('contactFormIframe').src = "contact-form.html";
	document.getElementById('contactForm').style.display = 'block';
}

function contactMeClose() {
	document.getElementById('contactForm').style.display = 'none';
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}

function loadSpecificImage() {
	try {
		var urlParam = getUrlParameter("url");
		if (!(urlParam == "" || urlParam == "undefined" || urlParam == undefined)) {
			for (var i = 0; i< $('.centerContentArea div a').length; i++) {
				if(($('.centerContentArea div a')[i].href).indexOf(urlParam) != -1) {
					$('.centerContentArea div a')[i].click();
				}
			}
		}
	} catch (e) {}
}

function getUrlParameter(sParam){
	var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
        	return sParameterName[1].replace(/%2F/g, "/");
        }
    }
}        