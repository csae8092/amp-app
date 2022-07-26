const options_fullsize = {
    name: 'Create full size mode',
    variants:  [
        {
            opt: 'edition-fullsize',
            title: 'full screen on/off',
            hide: {
                hidden: true,
                class_to_hide: 'hide-reading',

            }
        }
    ],
    active_class: 'active',
    rendered_element: {
        a_class: 'nav-link btn btn-round',
        svg: `
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen" viewBox="0 0 16 16">
                <path d="M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z"/>
            </svg>
        `,
    }
}


class FullSize extends HTMLElement {

    "use strict";

    static get observedAttributes() {
        return ["opt"];
    }

    connectedCallback() {
        this.render();
        this.childNodes[1].addEventListener("click", this.fullScreen);
        // console.log(this.childNodes[1]);
        window.onload = this.fullSreenUrl();
    }

    fullSreenUrl() {
        const url = new URL(window.location.href);
        const urlParam = new URLSearchParams(url.search);
        const variant = options_fullsize.variants.find((v) => v.opt === "edition-fullsize");
        const hide = variant.hide.class_to_hide;
        const svg_show = `
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen" viewBox="0 0 16 16">
                <path d="M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z"/>
            </svg>
        `;
        const svg_hide = `
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen-exit" viewBox="0 0 16 16">
                <path d="M5.5 0a.5.5 0 0 1 .5.5v4A1.5 1.5 0 0 1 4.5 6h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5zm5 0a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 10 4.5v-4a.5.5 0 0 1 .5-.5zM0 10.5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 6 11.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zm10 1a1.5 1.5 0 0 1 1.5-1.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4z"/>
            </svg>
        `;
        if (urlParam.get("fullscreen") == null) {
            urlParam.set("fullscreen", "off");
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`); 
        }
        if (urlParam.get("fullscreen") == "off") {
            document.querySelectorAll(`.${hide}`).forEach((el) => {
                el.classList.remove("fade");
                options_fullsize.rendered_element.svg = svg_show;
            });
        }
        if (urlParam.get("fullscreen") == "on") {
            document.querySelectorAll(`.${hide}`).forEach((el) => {
                el.classList.add("fade");
                options_fullsize.rendered_element.svg = svg_hide;
            });
        }
    }

    fullScreen() {
        const url = new URL(window.location.href);
        const urlParam = new URLSearchParams(url.search);
        const active = options_fullsize.active_class;
        const id = this.getAttribute("id");
        const variant = options_fullsize.variants.find((v) => v.opt === id);
        const hide = variant.hide.class_to_hide;
        const svg_show = `
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen" viewBox="0 0 16 16">
                <path d="M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z"/>
            </svg>
        `;
        const svg_hide = `
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen-exit" viewBox="0 0 16 16">
                <path d="M5.5 0a.5.5 0 0 1 .5.5v4A1.5 1.5 0 0 1 4.5 6h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5zm5 0a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 10 4.5v-4a.5.5 0 0 1 .5-.5zM0 10.5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 6 11.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zm10 1a1.5 1.5 0 0 1 1.5-1.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4z"/>
            </svg>
        `;
        if ( urlParam.get("fullscreen") == "off" ) {
            urlParam.set("fullscreen", "on");
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`); 
            document.querySelectorAll(`.${hide}`).forEach((el) => {
                el.classList.add("fade");
                options_fullsize.rendered_element.svg = svg_hide;
            });
            this.classList.remove(active);
        } else {                      
            urlParam.set("fullscreen", "off");
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`); 
            document.querySelectorAll(`.${hide}`).forEach((el) => {
                el.classList.remove("fade");
                options_fullsize.rendered_element.svg = svg_show;
            });
            this.classList.add(active); 
        }
    }

    render() {
        const opt = this.getAttribute("opt");
        const variant = options_fullsize.variants.find((v) => v.opt === opt);
        const rendered_element = options_fullsize.rendered_element;
        this.innerHTML = `
            <a title="${variant.title}"
                class="${rendered_element.a_class} active"
                id="${variant.opt}">
                ${rendered_element.svg}
            </a>
        `;
    }

    attributeChangedCallback() {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[1].removeEventListener("click", this.fullScrean);
    }

 }
 window.customElements.define('full-size', FullSize);