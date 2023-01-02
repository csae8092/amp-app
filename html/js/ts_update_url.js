var tsInput = document.querySelector("input[type='search']");

function updateHeaderUrl() {
  setTimeout(() => {
    var urlToUpdate = document.querySelectorAll(".ais-Hits-item h4 a");
    var tsInputVal = tsInput.value;
    urlToUpdate.forEach((el) => {
      var urlToUpdateHref = el.getAttribute("href");
      if (urlToUpdateHref.includes("&mark")) {
        var newUrl = urlToUpdateHref.replace(
          /&mark=\.+$/,
          `&mark=${tsInputVal}`
        );
        el.setAttribute("href", newUrl);
      } else {
        var newUrl = `${urlToUpdateHref}&mark=${tsInputVal}`;
        el.setAttribute("href", newUrl);
      }
    });
  }, 500);
}

tsInput.addEventListener("input", updateHeaderUrl);
