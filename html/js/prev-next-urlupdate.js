window.onload = nextPrevUrl();

var features1 = document.getElementsByClassName("features-1");
var features2 = document.getElementsByClassName("features-2");

[].forEach.call(features1, (opt) => {
  opt.addEventListener("click", nextPrevUrlUpdate);
});

[].forEach.call(features2, (opt) => {
  opt.addEventListener("click", nextPrevUrlUpdate);
});

function nextPrevUrl() {
  var prev = document.getElementById("prev-doc");
  var next = document.getElementById("next-doc");
  var urlparam = new URLSearchParams(document.location.search);
  var domain = document.location.origin;
  var path = document.location.pathname;
  var path = path.split("/");
  if (path.length > 2) {
    path = path[1];
  } else {
    path = "";
  }
  if (prev) {
    var prev_href = prev.getAttribute("href");
    var new_prev = new URL(`${domain}/${path}/${prev_href}?${urlparam}`);
    prev.setAttribute("href", new_prev);
  }
  if (next) {
    var next_href = next.getAttribute("href");
    var new_next = new URL(`${domain}/${path}/${next_href}?${urlparam}`);
    next.setAttribute("href", new_next);
  }
}

function nextPrevUrlUpdate() {
  var prev = document.getElementById("prev-doc");
  var next = document.getElementById("next-doc");
  var urlparam = new URLSearchParams(document.location.search);
  if (prev) {
    var prev_href = new URL(prev.getAttribute("href"));
    var old_prev_search = new URLSearchParams(prev_href.search);
    urlparam.forEach((value, key) => {
      old_prev_search.set(key, value);
    });
    prev.setAttribute(
      "href",
      `${prev_href.origin}${prev_href.pathname}?${old_prev_search.toString()}`
    );
  }
  if (next) {
    var next_href = new URL(next.getAttribute("href"));
    var old_next_search = new URLSearchParams(next_href.search);
    urlparam.forEach((value, key) => {
      old_next_search.set(key, value);
    });
    next.setAttribute(
      "href",
      `${next_href.origin}${next_href.pathname}?${old_next_search.toString()}`
    );
  }
}
