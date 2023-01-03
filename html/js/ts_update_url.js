var tsInput = document.querySelector("input[type='search']");
tsInput.addEventListener("input", updateHeaderUrl);

// setTimeout(() => {
//   var tsRefInput = document.querySelectorAll(".ais-RefinementList-checkbox");
//   console.log(typeof tsRefInput);
//   tsRefInput.forEach((el) => {
//     console.log(el);
//     console.log(typeof el);
//     el.addEventListener("input", updateHeaderUrl);
//   });
// }, 50);

function updateHeaderUrl() {
  setTimeout(() => {
    // var tsRefinements = document.querySelectorAll(
    //   ".ais-CurrentRefinements-categoryLabel"
    // );

    // if (tsRefinements) {
    //   refinements = "";
    //   tsRefinements.forEach((el) => {
    //     console.log(el.innerHTML);
    //     refinements += `+${el.innerHTML}`;
    //   });
    // }

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
