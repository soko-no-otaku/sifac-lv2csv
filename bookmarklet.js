fsxs = document.getElementsByClassName("fsxs");
lvs = [];

us = ['"穂乃果"', '"絵里"', '"ことり"', '"海未"', '"凛"', '"真姫"', '"希"', '"花陽"', '"にこ"'];
lvs.push(us[window.location.href.match(/c=(\d)/)[1] - 1]);

for (i = 0; i < fsxs.length; i++) {
  if ((m = fsxs[i].innerHTML.match(/\d{1,2}/)) != null) {
    lvs.push(m[0]);
  }
}

prompt("", lvs.join(","));
