const image_url = `${location.protocol}//${location.host}/html/js/json/conf_image_switch.json`;
console.log(image_url);
fetch(image_url)
.then((response) => response.json())
.then((options_image_switch) => {

    class ImageSwitch extends HTMLElement {

        "use strict";

        static get observedAttributes() {
            return ["opt"];
        }

        connectedCallback() {
            this.render();
            this.childNodes[1].addEventListener("click", this.viewerSwitch);
            // console.log(this.childNodes[1]);
        }

        viewerSwitch() {
            const url = new URL(window.location.href);
            const urlParam = new URLSearchParams(url.search);
            const id = this.getAttribute("id");
            const variant = options_image_switch.variants.find((v) => v.opt === id);
            const active = options_image_switch.active_class;
            const hide = variant.hide.class_to_hide;
            const show = variant.hide.class_to_show;
            const parent = variant.hide.class_parent;
            let citation_url = document.getElementById("citation-url");
            let urlparam = variant.urlparam;
            if ( urlParam.get(urlparam) == "on" ) {
                urlParam.set(urlparam, "off");
                document.querySelectorAll(`.${hide}`).forEach((el) => {
                    el.classList.add("fade");
                    el.classList.remove("col-md-6");
                    el.style.maxWidth = "100%";
                    el.classList.remove(active);
                });
                document.querySelectorAll(`.${show}`).forEach((el) => {
                    el.classList.remove("col-md-6");
                    el.classList.add("col-md-12");
                    el.style.maxWidth = "100%";
                    el.classList.remove(active);
                });  
                this.classList.remove(active); 
            } else {                      
                urlParam.set(urlparam, "on");
                document.querySelectorAll(`.${hide}`).forEach((el) => {
                    el.classList.remove("fade");
                    el.classList.add("col-md-6");
                    el.style.maxWidth = "50%";
                    el.classList.add(active);
                });
                document.querySelectorAll(`.${show}`).forEach((el) => {
                    el.classList.add("col-md-6");
                    el.classList.remove("col-md-12");
                    el.style.maxWidth = "50%";
                    el.classList.add(active);
                });
                // works only with one image viewer
                const viewer = document.querySelector(`.${parent}.${active} .${hide}`);
                const facs = viewer.querySelectorAll("*")[1];
                facs.style.width = `${viewer.offsetWidth}px`;
                facs.style.height = `${viewer.offsetHeight}px`;
                this.classList.add(active); 
            }
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`); 
            citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
            citation_url.setAttribute("href", window.location.href);
        }

        render() {
            const opt = this.getAttribute("opt");
            const variant = options_image_switch.variants.find((v) => v.opt === opt);
            const rendered_element = options_image_switch.rendered_element;
            const active = options_image_switch.active_class;
            this.innerHTML = `
                <a title="${variant.title}"
                    class="${rendered_element.a_class} ${active}"
                    id="${variant.opt}">
                    ${rendered_element.svg}
                </a>
            `;
        }

        attributeChangedCallback() {
            this.render();
        }

        disconnectedCallback() {
            this.childNodes[1].removeEventListener("click", this.viewerSwitch);
        }

    }
    window.customElements.define('image-switch', ImageSwitch);
    window.onload = viewerUrlSwitch();

    function viewerUrlSwitch() {
        const url = new URL(window.location.href);
        const urlParam = new URLSearchParams(url.search);
        // const opt = options_image_switch
        const variant = options_image_switch.variants.find((v) => v.opt === "edition-switch");
        const active = options_image_switch.active_class;
        const hide = variant.hide.class_to_hide;
        const show = variant.hide.class_to_show;
        const parent = variant.hide.class_parent;
        let urlparam = variant.urlparam;
        let citation_url = document.getElementById("citation-url");
        if (urlParam.get(urlparam) == null) {
            urlParam.set(urlparam, "on");
        }
        if (urlParam.get(urlparam) == "on") {
            document.querySelectorAll(`.${hide}`).forEach((el) => {
                el.classList.remove("fade");
                el.classList.add("col-md-6");
                el.style.maxWidth = "50%";
                el.classList.add(active);
            });
            document.querySelectorAll(`.${show}`).forEach((el) => {
                el.classList.add("col-md-6");
                el.classList.remove("col-md-12");
                el.style.maxWidth = "50%";
                el.classList.add(active);
            });
        }
        if (urlParam.get(urlparam) == "off") {
            document.querySelectorAll(`.${hide}`).forEach((el) => {
                el.classList.add("fade");
                el.classList.remove("col-md-6");
                el.style.maxWidth = "100%";
                el.classList.remove(active);
            });
            document.querySelectorAll(`.${show}`).forEach((el) => {
                el.classList.remove("col-md-6");
                el.classList.add("col-md-12");
                el.style.maxWidth = "100%";
                el.classList.remove(active);
            });
            // works only with one image viewer
            const viewer = document.querySelector(`.${parent}.${active} .${hide}`);
            const facs = viewer.querySelectorAll("*")[1];
            facs.style.width = `${viewer.offsetWidth}px`;
            facs.style.height = `${viewer.offsetHeight}px`;
        }
        window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
        citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
        citation_url.setAttribute("href", window.location.href);
    }
});