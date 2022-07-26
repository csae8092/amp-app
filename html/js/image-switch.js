const options_image_switch = {
    name: 'enable/disable image viewer',
    variants:  [
        {
            opt: 'edition-switch',
            title: 'facsimile on/off',
            hide: {
                hidden: true,
                class_to_hide: 'osd-viewer',
                class_to_show: 'text-re',
                class_parent: 'pagination-tab',
            },
        }
    ],
    active_class: 'active',
    rendered_element: {
        a_class: 'nav-link btn btn-round',
        svg: `
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
                <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
            </svg>
        `,
    }
}


class ImageSwitch extends HTMLElement {

    "use strict";

    static get observedAttributes() {
        return ["opt"];
    }

    connectedCallback() {
        this.render();
        this.childNodes[1].addEventListener("click", this.viewerSwitch);
        // console.log(this.childNodes[1]);
        window.onload = this.viewerUrlSwitch();
    }

    viewerUrlSwitch() {
        const url = new URL(window.location.href);
        const urlParam = new URLSearchParams(url.search);
        // const opt = options_image_switch
        const variant = options_image_switch.variants.find((v) => v.opt === "edition-switch");
        const active = options_image_switch.active_class;
        const hide = variant.hide.class_to_hide;
        const show = variant.hide.class_to_show;
        const parent = variant.hide.class_parent;
        if (urlParam.get("image") == null) {
            urlParam.set("image", "on");
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
        }
        if (urlParam.get("image") == "on") {
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
        if (urlParam.get("image") == "off") {
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
        if ( urlParam.get("image") == "on" ) {
            urlParam.set("image", "off");
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
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`); 
            // window.location.search = urlParam;
            this.classList.remove(active); 
        } else {                      
            urlParam.set("image", "on");
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
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`); 
            // window.location.search = urlParam;
            this.classList.add(active); 
        }
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