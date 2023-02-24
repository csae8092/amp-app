var hds_start = document.getElementsByClassName("handShift");

window.onload = handShift();

function handShift() {
  [].forEach.call(hds_start, function (opt) {
    var parentP = opt.parentNode;
    var newNode = document.createElement("span");
    newNode.setAttribute("style", opt.getAttribute("style"));
    var sibs = getNextSiblings(opt);
    [].forEach.call(sibs, function (el) {
      newNode.appendChild(el);
    });
    parentP.insertBefore(newNode, opt);
    opt.remove();
  });
}

function getNextSiblings(elem) {
  var sibs = [];
  while ((elem = elem.nextSibling)) {
    sibs.push(elem);
  }
  return sibs;
}
