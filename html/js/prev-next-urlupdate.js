var features1 = document.getElementsByClassName("features-1");
var features2 = document.getElementsByClassName("features-2");

[].forEach.call(features1, (opt) => {
  opt.addEventListener("click", nextPrevUrlUpdate);
});

[].forEach.call(features2, (opt) => {
  opt.addEventListener("click", nextPrevUrlUpdate);
});

window.onload = nextPrevUrl();

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
  var prev_href = prev.getAttribute("href");
  var next_href = next.getAttribute("href");
  var new_prev = new URL(`${domain}/${path}/${prev_href}?${urlparam}`);
  var new_next = new URL(`${domain}/${path}/${next_href}?${urlparam}`);
  prev.setAttribute("href", new_prev);
  next.setAttribute("href", new_next);
}

function nextPrevUrlUpdate() {
  var prev = document.getElementById("prev-doc");
  var next = document.getElementById("next-doc");
  var urlparam = new URLSearchParams(document.location.search);
  var prev_href = new URL(prev.getAttribute("href"));
  var next_href = new URL(next.getAttribute("href"));
  var old_prev_search = new URLSearchParams(prev_href.search);
  var old_next_search = new URLSearchParams(next_href.search);
  urlparam.forEach((value, key) => {
    old_prev_search.set(key, value);
    old_next_search.set(key, value);
  });
  prev.setAttribute(
    "href",
    `${prev_href.origin}${prev_href.pathname}?${old_prev_search.toString()}`
  );
  next.setAttribute(
    "href",
    `${next_href.origin}${next_href.pathname}?${old_next_search.toString()}`
  );
}
