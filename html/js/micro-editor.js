class FetchOptionData {

    async getData(url) {
        console.log(url);
        return await fetch(url)
        .then(response => response.json())
        .catch(error => console.log(error.message));
    }

}


class AnnotationSlider extends HTMLElement {

    "use strict";

    static get observedAttributes() {
        return ["opt"];
    }

    connectedCallback() {
        this.render();
        setTimeout(() => {
            this.childNodes[3].childNodes[1].addEventListener("click", this.textFeatures);
            // console.log(this.childNodes[3].childNodes[1]);
        }, 500);
    }

    textFeatures() {
        const textFeatures = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_annotation_slider.json`;
        textFeatures.getData(url).then(options => {
            let url = new URL(window.location.href);
            let urlParam = new URLSearchParams(url.search);
            let citation_url = document.getElementById('citation-url');
            let id = this.getAttribute("id");
            let variant = options.variants.find((v) => v.opt === id);
            let all = variant.features.all;
            let variants = options.variants.filter((v) => v.features.all === false);
            let none_variant = options.variants.find((v) => v.features.all === true);
            let style = options.span_element;
            let active = options.active_class;
            let removeMarkup = (html_class, css_class, color, hide) => {
                document.querySelectorAll(`.${html_class}`).forEach((el) => {
                    if (typeof css_class === "object") {
                        css_class.forEach((css) => {
                            if (el.classList.contains(css)) {
                                el.classList.remove(css);
                            } else {
                                el.classList.add(css);
                            }
                        });
                    } else {
                        el.classList.remove(css_class);
                    }
                    el.classList.remove(color);
                    el.classList.add(style.css_class);
                    if (hide) {
                        el.style.display = "none";
                    }
                });
            };
            let addMarkup = (html_class, css_class, color, hide) => {
                document.querySelectorAll(`.${html_class}`).forEach((el) => {
                    if (typeof css_class === "object") {
                        css_class.forEach((css) => {
                            if (el.classList.contains(css)) {
                                el.classList.remove(css);
                            } else {
                                el.classList.add(css);
                            }
                        });
                    } else {
                        el.classList.add(css_class);
                    }
                    el.classList.add(color);
                    el.classList.add(style.css_class);
                    if (hide) {
                        el.style.display = "inline";
                    }
                });
            };

            if (all) {
                if ( this.classList.contains(active) ) {
                    this.classList.remove(active);
                    variants.forEach((el) => {
                        let color = el.color;
                        let html_class = el.html_class;
                        let css_class = el.css_class;
                        let hide = el.hide;
                        removeMarkup(html_class, css_class, color, hide);
                        document.getElementById(el.opt_slider).classList.remove(color);
                        if (document.getElementById(el.opt).checked === true) {
                            document.getElementById(el.opt).checked = false;
                            document.getElementById(el.opt).classList.remove(active);
                        }
                        urlParam.set(el.opt, "off");
                    });
                } else {
                    this.classList.add(active);
                    variants.forEach((el) => {
                        let color = el.color;
                        let html_class = el.html_class;
                        let css_class = el.css_class;
                        let hide = el.hide;
                        addMarkup(html_class, css_class, color, hide);
                        document.getElementById(el.opt_slider).classList.add(color);
                        if (document.getElementById(el.opt).checked === false) {
                            document.getElementById(el.opt).checked = true;
                            document.getElementById(el.opt).classList.add(active);
                        }
                        urlParam.set(el.opt, "on");
                    });
                }
                window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
                citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
                citation_url.setAttribute("href", window.location.href);
            } else {
                // const opt = variant.opt;
                let color = variant.color;
                let html_class = variant.html_class;
                let css_class = variant.css_class;
                let hide = variant.hide;
                if ( this.classList.contains(active) ) {
                    this.classList.remove(active);
                    removeMarkup(html_class, css_class, color, hide);
                    document.getElementById(variant.opt_slider).classList.remove(color);
                    this.classList.remove(color);
                    urlParam.set(variant.opt, "off");
                } else {
                    this.classList.add(active);
                    addMarkup(html_class, css_class, color, hide);
                    document.getElementById(variant.opt_slider).classList.add(color);
                    this.classList.add(color);
                    urlParam.set(variant.opt, "on");
                }
                /*
                    If all or not all text features are selected the original text features
                    link will automatically be switched on or off.
                */
                    let variants_checked = document.querySelectorAll(`input.${variant.features.class}:checked`);
                if (variants_checked.length === variants.length) {
                    document.getElementById(none_variant.opt).checked = true;
                    document.getElementById(none_variant.opt).classList.add(active);
                } else {
                    document.getElementById(none_variant.opt).checked = false;
                    document.getElementById(none_variant.opt).classList.remove(active);
                }
                window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
                citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
                citation_url.setAttribute("href", window.location.href);
            }
        });
    }

    render() {
        const textFeatures = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_annotation_slider.json`;
        textFeatures.getData(url).then(options => {
            const opt = this.getAttribute("opt");
            const variant = options.variants.find((v) => v.opt === opt);
            const title = variant.title;
            const opt_slider = variant.opt_slider;
            const rendered_element = options.rendered_element;
            this.innerHTML = `
                <label>${title}</label>
                <label class="${rendered_element.label_class}">
                    <input title="${title}"
                        type="checkbox"
                        id="${opt}"
                        class="${variant.features.class}"/>
                    <span id="${opt_slider}" class="${rendered_element.slider_class}"></span>
                </label>
            `;
        });
    }

    attributeChangedCallback() {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[3].childNodes[1].removeEventListener("click", this.textFeatures);
    }
}


class FullSize extends HTMLElement {

    "use strict";

    static get observedAttributes() {
        return ["opt"];
    }

    connectedCallback() {
        this.render();
        setTimeout(() => {
            // console.log(this.childNodes[1]);
            this.childNodes[1].addEventListener("click", this.fullScreen);
        }, 500);
    }

    fullScreen() {
        var font = new FetchOptionData();
        var url = `${location.protocol}//${location.host}/js/json/conf_fullsize.json`;
        font.getData(url).then(options => {
            const url = new URL(window.location.href);
            const urlParam = new URLSearchParams(url.search);
            const active = options.active_class;
            const id = this.getAttribute("id");
            const variant = options.variants.find((v) => v.opt === id);
            const hide = variant.hide.class_to_hide;
            let urlparam = variant.urlparam;
            let citation_url = document.getElementById('citation-url');
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
            if ( urlParam.get(urlparam) == "off" ) {
                urlParam.set(urlparam, "on");
                window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
                document.querySelectorAll(`.${hide}`).forEach((el) => {
                    el.classList.add("fade");
                    options.rendered_element.svg = svg_hide;
                });
                this.classList.remove(active);
            } else {                      
                urlParam.set(urlparam, "off");
                window.history.replaceState({}, '', `${location.pathname}?${urlParam}`); 
                document.querySelectorAll(`.${hide}`).forEach((el) => {
                    el.classList.remove("fade");
                    options.rendered_element.svg = svg_show;
                });
                this.classList.add(active); 
            }
            citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
            citation_url.setAttribute("href", window.location.href);
        });
    }

    render() {
        var font = new FetchOptionData();
        var url = `${location.protocol}//${location.host}/js/json/conf_fullsize.json`;
        font.getData(url).then(options => {
            const opt = this.getAttribute("opt");
            const variant = options.variants.find((v) => v.opt === opt);
            const rendered_element = options.rendered_element;
            this.innerHTML = `
                <a title="${variant.title}"
                    class="${rendered_element.a_class} active"
                    id="${variant.opt}">
                    ${rendered_element.svg}
                </a>
            `;
        });
    }

    attributeChangedCallback() {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[1].removeEventListener("click", this.fullScrean);
    }

}


class FontSize extends HTMLElement {

    "use strict";

    static get observedAttributes() {
        return ["opt"];
    }

    connectedCallback() {
        this.render();
        setTimeout(() => {
            // console.log(this.childNodes[0]);
            this.childNodes[0].addEventListener("change", this.fontSize);
        }, 500);
    }

    fontSize() {
        var getSize = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_fontsize.json`;
        getSize.getData(url).then(options => {
            const url = new URL(window.location.href);
            const urlParam = new URLSearchParams(url.search);
            const id = this.getAttribute("id");
            const variant = options.variants.find((v) => v.opt === id);
            const p_change = variant.paragraph;
            const p_class = variant.p_class;
            const size = variant.sizes;
            let citation_url = document.getElementById("citation-url");
            let urlparam = variant.urlparam;
            var value = this.value;
            var css_class = variant.css_class;
            if ( urlParam.get(urlparam) !== value.replace(css_class, '') ) {
                urlParam.set(urlparam, value.replace(css_class, ''));
                let paragraph = document.querySelectorAll(`${p_change}.${p_class}`);
                paragraph.forEach((el) => {
                    for (let s in size) {
                        if (size[s] !== "default") {
                            el.classList.remove(css_class + size[s]);   
                        }           
                    }
                    if(value !== "default") {
                        el.classList.add(value);
                    }
                });
            }
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`); 
            citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
            citation_url.setAttribute("href", window.location.href);
        });
        
    }

    render() {
        var getSize = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_fontsize.json`;
        getSize.getData(url).then(options => {
            const opt = this.getAttribute("opt");
            const variant = options.variants.find((v) => v.opt === opt);
            const size = variant.sizes;
            const html_class = options.html_class;
            var css_class = variant.css_class;
            let s_html = `<select id="${variant.opt}" class="${html_class}">`;
            for (let s in size) {
                if (size[s] == "default") {
                    var option = `<option value="default" selected='selected'>${size[s].split('-').slice(-1)} px`;
                } else {
                    var option = `<option value='${css_class}${size[s]}'>${size[s].split('-').slice(-1)} px`;
                }
                s_html += option;
                s_html += "</option>";
            }
            s_html += "</select>";
            this.innerHTML = s_html;
        });
    }

    attributeChangedCallback() {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[0].removeEventListener("change", this.fontSize);
    }

}


class FontFamily extends HTMLElement {

    "use strict";

    static get observedAttributes() {
        return ["opt"];
    }

    connectedCallback() {
        this.render();
        setTimeout(() => {
            // console.log(this.childNodes[0]);
            this.childNodes[0].addEventListener("change", this.fontFamily);
        }, 500);
    }

    fontFamily() {
        var getFamily = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_font_family.json`;
        getFamily.getData(url).then(options => {
            const url = new URL(window.location.href);
            const urlParam = new URLSearchParams(url.search);
            const id = this.getAttribute("id");
            const variant = options.variants.find((v) => v.opt === id);
            const p_change = variant.paragraph;
            const p_class = variant.p_class;
            const family = variant.fonts;
            let citation_url = document.getElementById("citation-url");
            let urlparam = variant.urlparam;
            var value = this.value;
            if ( urlParam.get(urlparam) !== value ) {
                urlParam.set(urlparam, value);
                let paragraph = document.querySelectorAll(`${p_change}.${p_class}`);
                paragraph.forEach((el) => {
                    for (let s in family) {
                        if (family[s] !== "default") {
                            el.classList.remove(family[s].toLowerCase());   
                        }           
                    }
                    if(value !== "default") {
                        el.classList.add(value.toLowerCase());
                    }
                });
            }
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`); 
            citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
            citation_url.setAttribute("href", window.location.href);
        });
        
    }

    render() {
        var getFamily = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_font_family.json`;
        getFamily.getData(url).then(options => {
            const opt = this.getAttribute("opt");
            const variant = options.variants.find((v) => v.opt === opt);
            const family = variant.fonts;
            const html_class = options.html_class;
            var css_class = variant.css_class;
            let s_html = `<select id="${variant.opt}" class="${html_class}">`;
            for (let s in family) {
                if (family[s] == "default") {
                    var option = `<option value="default" selected='selected'>${family[s].replace('-', ' ')}`;
                } else {
                    var option = `<option value='${css_class}${family[s]}'>${family[s].replace('-', ' ')}`;
                }
                s_html += option;
                s_html += "</option>";
            }
            s_html += "</select>";
            this.innerHTML = s_html;
        });
    }

    attributeChangedCallback() {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[0].removeEventListener("change", this.fontFamily);
    }

}


class ImageSwitch extends HTMLElement {

    "use strict";

    static get observedAttributes() {
        return ["opt"];
    }

    connectedCallback() {
        this.render();
        setTimeout(() => {
            // console.log(this.childNodes[1]);
            this.childNodes[1].addEventListener("click", this.viewerSwitch);
        }, 500);
    }

    viewerSwitch() {
        const viewer = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_image_switch.json`;
        viewer.getData(url).then(options => {
            const url = new URL(window.location.href);
            const urlParam = new URLSearchParams(url.search);
            const id = this.getAttribute("id");
            const variant = options.variants.find((v) => v.opt === id);
            const active = options.active_class;
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
        });
    }

    render() {
        const viewer = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_image_switch.json`;
        viewer.getData(url).then(options => {
            const opt = this.getAttribute("opt");
            const variant = options.variants.find((v) => v.opt === opt);
            const rendered_element = options.rendered_element;
            const active = options.active_class;
            this.innerHTML = `
                <a title="${variant.title}"
                    class="${rendered_element.a_class} ${active}"
                    id="${variant.opt}">
                    ${rendered_element.svg}
                </a>
            `;
        });
    }

    attributeChangedCallback() {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[1].removeEventListener("click", this.viewerSwitch);
    }

}


class UrlSearchParamUpdate {

    fullSreen() {
        const font = new FetchOptionData();
        var url = `${location.protocol}//${location.host}/js/json/conf_fullsize.json`;
        font.getData(url).then(options => {
            const url = new URL(window.location.href);
            const urlParam = new URLSearchParams(url.search);
            const variant = options.variants.find((v) => v.opt === "edition-fullsize");
            const hide = variant.hide.class_to_hide;
            let urlparam = variant.urlparam;
            let citation_url = document.getElementById('citation-url');
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
            if (urlParam.get(urlparam) == null) {
                urlParam.set(urlparam, "off");
                window.history.replaceState({}, '', `${location.pathname}?${urlParam}`); 
            }
            if (urlParam.get(urlparam) == "off") {
                document.querySelectorAll(`.${hide}`).forEach((el) => {
                    el.classList.remove("fade");
                    options.rendered_element.svg = svg_show;
                });
            }
            if (urlParam.get(urlparam) == "on") {
                document.querySelectorAll(`.${hide}`).forEach((el) => {
                    el.classList.add("fade");
                    options.rendered_element.svg = svg_hide;
                });
            }
            citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
            citation_url.setAttribute("href", window.location.href);
        });
    }

    fontSize() {
        const font = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_fontsize.json`;
        font.getData(url).then(options => {
            const url = new URL(window.location.href);
            const urlParam = new URLSearchParams(url.search);
            const variants = options.variants;
            let citation_url = document.getElementById("citation-url");
            for (let v in variants) {
                let select = document.getElementById(variants[v].opt);
                let urlparam = variants[v].urlparam;
                let p_change = variants[v].paragraph;
                let p_class = variants[v].p_class;
                let size = variants[v].sizes;
                var css_class = variants[v].css_class;
                if (urlParam.get(urlparam) == null) {
                    urlParam.set(urlparam, "default");
                }
                if (!Object.values(size).includes(urlParam.get(urlparam))) {
                    console.log(`${urlParam.get(urlparam)} is not a selectable option.`);
                    urlParam.set(urlparam, "default");
                } else {
                    let paragraph = document.querySelectorAll(`${p_change}.${p_class}`);
                    if (urlParam.get(urlparam) !== "default") {
                        var new_value = css_class + urlParam.get(urlparam);
                    } else {
                        var new_value = urlParam.get(urlparam);
                    }
                    select.value = new_value;
                    paragraph.forEach((el) => {
                        for (let s in size) {
                            if (size[s] !== "default") {
                                el.classList.remove(css_class + size[s]);   
                            } 
                        }
                        if(new_value !== "default") {
                            el.classList.add(new_value);
                        }
                    });
                    
                } 
            }
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
            citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
            citation_url.setAttribute("href", window.location.href);
        });
    }

    fontFamily() {
        const font = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_font_family.json`;
        font.getData(url).then(options => {
            const url = new URL(window.location.href);
            const urlParam = new URLSearchParams(url.search);
            const variants = options.variants;
            let citation_url = document.getElementById("citation-url");
            for (let v in variants) {
                let select = document.getElementById(variants[v].opt);
                let urlparam = variants[v].urlparam;
                let p_change = variants[v].paragraph;
                let p_class = variants[v].p_class;
                let family = variants[v].fonts;
                if (urlParam.get(urlparam) == null) {
                    urlParam.set(urlparam, "default");
                }
                if (!Object.values(family).includes(urlParam.get(urlparam))) {
                    console.log(`${urlParam.get(urlparam)} is not a selectable option.`);
                    urlParam.set(urlparam, "default");
                } else {
                    let paragraph = document.querySelectorAll(`${p_change}.${p_class}`);
                    if (urlParam.get(urlparam) !== "default") {
                        var new_value = urlParam.get(urlparam);
                    } else {
                        var new_value = urlParam.get(urlparam);
                    }
                    select.value = new_value;
                    paragraph.forEach((el) => {
                        for (let f in family) {
                            if (family[f] !== "default") {
                                el.classList.remove(family[f].toLowerCase());   
                            } 
                        }
                        if(new_value !== "default") {
                            el.classList.add(new_value.toLowerCase());
                        }
                    });
                    
                } 
            }
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
            citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
            citation_url.setAttribute("href", window.location.href);
        });
    }

    viewerSwitch() {
        const viewer = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_image_switch.json`;
        viewer.getData(url).then(options => {
            const url = new URL(window.location.href);
            const urlParam = new URLSearchParams(url.search);
            // const opt = options
            const variant = options.variants.find((v) => v.opt === "edition-switch");
            const active = options.active_class;
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
        });
    }

    textFeatures() {
        const textFeatures = new FetchOptionData();
        let url = `${location.protocol}//${location.host}/js/json/conf_annotation_slider.json`;
        textFeatures.getData(url).then(options => {
            let url = new URL(window.location.href);
            let urlParam = new URLSearchParams(url.search);
            let citation_url = document.getElementById('citation-url');
            let variants = options.variants.filter((v) => v.features.all === false);
            let style = options.span_element;
            let active = options.active_class;
            let removeMarkup2 = (html_class, css_class, color, hide) => {
                document.querySelectorAll(`.${html_class}`).forEach((el) => {
                    if (typeof css_class === "object") {
                        css_class.forEach((css) => {
                            if (el.classList.contains(css)) {
                                el.classList.remove(css);
                            } else {
                                el.classList.add(css);
                            }
                        });
                    } else {
                        el.classList.remove(css_class);
                    }
                    el.classList.remove(color);
                    el.classList.add(style.css_class);
                    if (hide) {
                        el.style.display = "none";
                    }
                });
            };
            let addMarkup2 = (html_class, css_class, color, hide) => {
                document.querySelectorAll(`.${html_class}`).forEach((el) => {
                    if (typeof css_class === "object") {
                        css_class.forEach((css) => {
                            if (el.classList.contains(css)) {
                                el.classList.remove(css);
                            } else {
                                el.classList.add(css);
                            }
                        });
                    } else {
                        el.classList.add(css_class);
                    }
                    el.classList.add(color);
                    el.classList.add(style.css_class);
                    if (hide) {
                        el.style.display = "inline";
                    }
                });
            };
            variants.forEach((el) => {
                if (urlParam.get(el.opt) == null) {
                    urlParam.set(el.opt, "off");
                }
                else if (urlParam.get(el.opt) == "off") {
                    const color = el.color;
                    const html_class = el.html_class;
                    const css_class = el.css_class;
                    const hide = el.hide;
                    removeMarkup2(html_class, css_class, color, hide);
                    const slider = document.getElementById(el.opt_slider);
                    slider.classList.remove(color);
                    if (document.getElementById(el.opt).checked === true) {
                        document.getElementById(el.opt).checked = false;
                        document.getElementById(el.opt).classList.remove(active);
                    }
                }
                else if (urlParam.get(el.opt) == "on") {
                    let color = el.color;
                    let html_class = el.html_class;
                    let css_class = el.css_class;
                    let hide = el.hide;
                    addMarkup2(html_class, css_class, color, hide);
                    let slider = document.getElementById(el.opt_slider);
                    slider.classList.add(color);
                    if (document.getElementById(el.opt).checked === false) {
                        document.getElementById(el.opt).checked = true;
                        document.getElementById(el.opt).classList.add(active);
                    }
                }
            });
            window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
            citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
            citation_url.setAttribute("href", window.location.href);
        });
    }

}

window.customElements.define('full-size', FullSize);
window.onload = new UrlSearchParamUpdate().fullSreen();
window.customElements.define('image-switch', ImageSwitch);
window.onload = new UrlSearchParamUpdate().viewerSwitch();
window.customElements.define('font-size', FontSize);
window.onload = new UrlSearchParamUpdate().fontSize();
window.customElements.define('font-family', FontFamily);
window.onload = new UrlSearchParamUpdate().fontFamily();
window.customElements.define('annotation-slider', AnnotationSlider);
window.onload = new UrlSearchParamUpdate().textFeatures();
