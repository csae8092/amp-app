class FetchOptionData {

    async getDataCookie(url) {
        console.log(url);
        return await fetch(url)
        .then(response => response.json())
        .then(data => {
            let cookie = url.split('/').pop().replace('.json', '');
            localStorage.setItem(cookie, JSON.stringify(data));
        })
        .catch(error => console.log(error.message));
    }

    // async getData(url) {
    //     console.log(url);
    //     return await fetch(url)
    //     .then(response => response.json())
    //     .catch(error => console.log(error.message));
    // }

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
        let data = this.getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        let url = new URL(window.location.href);
        let urlParam = new URLSearchParams(url.search);
        let id = this.getAttribute("id");
        let variant = options.variants.find((v) => v.opt === id); 
        if (variant.chg_citation) {
            var citation_url = document.getElementById(variant.chg_citation);
        }
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

        if (all === true) {
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
        } else if (typeof all !== "boolean") {
            console.log(`Type of variant config. "features.all" must be Boolean (true or false)`);
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
            
        }
        var stateName = variant.opt;
        if (!stateName === "text-features") {
            var stateParam = urlParam.get(variant.opt);
            var state = {};
            state[stateName] = stateParam;
        } else {
            var state = {};
            for (const [ key, value ] of urlParam) {
                state[key] = value;
            } 
        }        
        // window.history.replaceState(state, '', `?${urlParam}`);
        window.history.pushState(state, '', `?${urlParam}`);
        if (citation_url) {
            citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
            citation_url.setAttribute("href", window.location.href);
        }
    }

    render() {
        let data = this.getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
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
                    data-target="${data}"
                    class="${variant.features.class}"/>
                <span id="${opt_slider}" class="${rendered_element.slider_class}"></span>
            </label>
        `;
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
            // console.log(this.childNodes[3]);
            this.childNodes[3].addEventListener("click", this.fullScreen);
        }, 500);
    }

    fullScreen() {
        let data = this.getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        let url = new URL(window.location.href);
        let urlParam = new URLSearchParams(url.search);
        let active = options.active_class;
        let id = this.getAttribute("id");
        let variant = options.variants.find((v) => v.opt === id);
        let hide = variant.hide.class_to_hide;
        let citation_url = document.getElementById(variant.chg_citation);
        let urlparam = variant.urlparam;
        let svg_show = `
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen" viewBox="0 0 16 16">
                <path d="M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z"/>
            </svg>
        `;
        let svg_hide = `
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen-exit" viewBox="0 0 16 16">
                <path d="M5.5 0a.5.5 0 0 1 .5.5v4A1.5 1.5 0 0 1 4.5 6h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5zm5 0a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 10 4.5v-4a.5.5 0 0 1 .5-.5zM0 10.5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 6 11.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zm10 1a1.5 1.5 0 0 1 1.5-1.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4z"/>
            </svg>
        `;
        if ( urlParam.get(urlparam) == "off" ) {
            urlParam.set(urlparam, "on");
            document.querySelectorAll(`.${hide}`).forEach((el) => {
                el.classList.add("fade");
                options.rendered_element.svg = svg_hide;
            });
            this.classList.remove(active);
        } else {                      
            urlParam.set(urlparam, "off");
            document.querySelectorAll(`.${hide}`).forEach((el) => {
                el.classList.remove("fade");
                options.rendered_element.svg = svg_show;
            });
            this.classList.add(active); 
        }
        var stateName = variant.opt;
        var stateParam = urlParam.get(variant.opt);
        var state = {};
        state[stateName] = stateParam;
        window.history.pushState(state, '', `${location.pathname}?${urlParam}`);
        citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
        citation_url.setAttribute("href", window.location.href);
    }

    render() {
        let data = this.getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        let opt = this.getAttribute("opt");
        let variant = options.variants.find((v) => v.opt === opt);
        let rendered_element = options.rendered_element;
        this.innerHTML = `
            <small><label style="padding:.2em;">${variant.title}:</label></small>
            <a title="${variant.title}"
                class="${rendered_element.a_class} active"
                id="${variant.opt}"
                data-target="${data}">
                ${rendered_element.svg}
            </a>
        `;
    }

    attributeChangedCallback() {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[3].removeEventListener("click", this.fullScrean);
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
            // console.log(this.childNodes[3]);
            this.childNodes[3].addEventListener("change", this.fontSize);
        }, 500);
    }

    fontSize() {
        let data = this.getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        let url = new URL(window.location.href);
        let urlParam = new URLSearchParams(url.search);
        let id = this.getAttribute("id");
        let variant = options.variants.find((v) => v.opt === id);
        let p_change = variant.paragraph;
        let p_class = variant.p_class;
        let size = variant.sizes;
        let citation_url = document.getElementById(variant.chg_citation);
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
        var stateName = variant.opt;
        var stateParam = urlParam.get(variant.opt);
        var state = {};
        state[stateName] = stateParam;
        window.history.pushState(state, '', `${location.pathname}?${urlParam}`);
        citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
        citation_url.setAttribute("href", window.location.href);
    }

    render() {
        let data = this.getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        let opt = this.getAttribute("opt");
        let variant = options.variants.find((v) => v.opt === opt);
        let size = variant.sizes;
        let html_class = options.html_class;
        var css_class = variant.css_class;
        let s_html = `
            <small><label style="padding:.2em;">${variant.title}:</label></small>
            <select id="${variant.opt}" data-target="${data}" class="${html_class}">
        `;
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
    }

    attributeChangedCallback() {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[3].removeEventListener("change", this.fontSize);
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
            // console.log(this.childNodes[3]);
            this.childNodes[3].addEventListener("change", this.fontFamily);
        }, 500);
    }

    fontFamily() {
        let data = this.getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        let url = new URL(window.location.href);
        let urlParam = new URLSearchParams(url.search);
        let id = this.getAttribute("id");
        let variant = options.variants.find((v) => v.opt === id);
        let p_change = variant.paragraph;
        let p_class = variant.p_class;
        let family = variant.fonts;
        let citation_url = document.getElementById(variant.chg_citation);
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
        var stateName = variant.opt;
        var stateParam = urlParam.get(variant.opt);
        var state = {};
        state[stateName] = stateParam;
        window.history.pushState(state, '', `${location.pathname}?${urlParam}`);
        citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
        citation_url.setAttribute("href", window.location.href);
    }

    render() {
        let data = this.getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        let opt = this.getAttribute("opt");
        let variant = options.variants.find((v) => v.opt === opt);
        let family = variant.fonts;
        let html_class = options.html_class;
        var css_class = variant.css_class;
        let s_html = `
            <small><label style="padding:.2em;">${variant.title}:</label></small>
            <select id="${variant.opt}" data-target="${data}" class="${html_class}">
        `;
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
    }

    attributeChangedCallback() {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[2].removeEventListener("change", this.fontFamily);
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
            // console.log(this.childNodes[3]);
            this.childNodes[3].addEventListener("click", this.viewerSwitch);
        }, 500);
    }

    viewerSwitch() {
        let data = this.getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        let url = new URL(window.location.href);
        let urlParam = new URLSearchParams(url.search);
        let id = this.getAttribute("id");
        let variant = options.variants.find((v) => v.opt === id);
        let active = options.active_class;
        let hide = variant.hide.class_to_hide;
        let show = variant.hide.class_to_show;
        let parent = variant.hide.class_parent;
        let citation_url = document.getElementById(variant.chg_citation);
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
            let viewer = document.querySelector(`.${parent}.${active} .${hide}`);
            let facs = viewer.querySelectorAll("*")[0];
            // console.log(facs);
            facs.style.width = `${viewer.offsetWidth}px`;
            facs.style.height = `${viewer.offsetHeight}px`;
            this.classList.add(active); 
        }
        var stateName = variant.opt;
        var stateParam = urlParam.get(variant.opt);
        var state = {};
        state[stateName] = stateParam;
        window.history.pushState(state, '', `${location.pathname}?${urlParam}`);
        citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
        citation_url.setAttribute("href", window.location.href);
    }

    render() {
        let data = this.getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        let opt = this.getAttribute("opt");
        let variant = options.variants.find((v) => v.opt === opt);
        let rendered_element = options.rendered_element;
        let active = options.active_class;
        this.innerHTML = `
            <small><label style="padding:.2em;">${variant.title}:</label></small>
            <a title="${variant.title}"
                class="${rendered_element.a_class} ${active}"
                id="${variant.opt}"
                data-target="${data}">
                ${rendered_element.svg}
            </a>
        `;
    }

    attributeChangedCallback() {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[3].removeEventListener("click", this.viewerSwitch);
    }

}


class UrlSearchParamUpdate {

    fullSreen() {
        let el = document.getElementsByTagName('full-size');
        let data = el[0].getAttribute("data-target");
        let opt = el[0].getAttribute("opt");
        let options = JSON.parse(localStorage.getItem(data));
        if (!options) {
            alert("Please turn on cookies to display content!")
        }
        let url = new URL(window.location.href);
        let urlParam = new URLSearchParams(url.search);
        let variant = options.variants.find((v) => v.opt === opt);
        let hide = variant.hide.class_to_hide;
        let urlparam = variant.urlparam;
        let citation_url = document.getElementById(variant.chg_citation);
        let svg_show = `
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen" viewBox="0 0 16 16">
                <path d="M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z"/>
            </svg>
        `;
        let svg_hide = `
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen-exit" viewBox="0 0 16 16">
                <path d="M5.5 0a.5.5 0 0 1 .5.5v4A1.5 1.5 0 0 1 4.5 6h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5zm5 0a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 10 4.5v-4a.5.5 0 0 1 .5-.5zM0 10.5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 6 11.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zm10 1a1.5 1.5 0 0 1 1.5-1.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4z"/>
            </svg>
        `;
        if (urlParam.get(urlparam) == null) {
            urlParam.set(urlparam, "off");
        }
        if (!["on", "off"].includes(urlParam.get(urlparam))) {
            console.log(`fullscreen=${urlParam.get(urlparam)} is not a selectable option.`);
            urlParam.set(urlparam, "off");
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
        window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
        citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
        citation_url.setAttribute("href", window.location.href);
    }

    fontSize() {
        let el = document.getElementsByTagName('font-size');
        let data = el[0].getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        if (!options) {
            alert("Please turn on cookies to display content!")
        }
        let url = new URL(window.location.href);
        let urlParam = new URLSearchParams(url.search);
        let variants = options.variants;
        for (let v in variants) {
            let select = document.getElementById(variants[v].opt);
            let urlparam = variants[v].urlparam;
            var citation_url = document.getElementById(variants[v].chg_citation);
            let p_change = variants[v].paragraph;
            let p_class = variants[v].p_class;
            let size = variants[v].sizes;
            var css_class = variants[v].css_class;
            if (urlParam.get(urlparam) == null) {
                urlParam.set(urlparam, "default");
            }
            if (!Object.values(size).includes(urlParam.get(urlparam))) {
                console.log(`fontsize=${urlParam.get(urlparam)} is not a selectable option.`);
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
    }

    fontFamily() {
        let el = document.getElementsByTagName('font-family');
        let data = el[0].getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        if (!options) {
            alert("Please turn on cookies to display content!")
        }
        let url = new URL(window.location.href);
        let urlParam = new URLSearchParams(url.search);
        let variants = options.variants;
        for (let v in variants) {
            let select = document.getElementById(variants[v].opt);
            var citation_url = document.getElementById(variants[v].chg_citation);
            let urlparam = variants[v].urlparam;
            let p_change = variants[v].paragraph;
            let p_class = variants[v].p_class;
            let family = variants[v].fonts;
            if (urlParam.get(urlparam) == null) {
                urlParam.set(urlparam, "default");
            }
            if (!Object.values(family).includes(urlParam.get(urlparam))) {
                console.log(`font=${urlParam.get(urlparam)} is not a selectable option.`);
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
    }

    viewerSwitch() {
        let el = document.getElementsByTagName('image-switch');
        let data = el[0].getAttribute("data-target");
        let opt = el[0].getAttribute("opt");
        let options = JSON.parse(localStorage.getItem(data));
        if (!options) {
            alert("Please turn on cookies to display content!")
        }
        let url = new URL(window.location.href);
        let urlParam = new URLSearchParams(url.search);
        // let opt = options
        let variant = options.variants.find((v) => v.opt === opt);
        let active = options.active_class;
        let hide = variant.hide.class_to_hide;
        let show = variant.hide.class_to_show;
        let parent = variant.hide.class_parent;
        let urlparam = variant.urlparam;
        let citation_url = document.getElementById(variant.chg_citation);
        if (urlParam.get(urlparam) == null) {
            urlParam.set(urlparam, "on");
        }
        if (!["on", "off"].includes(urlParam.get(urlparam))) {
            console.log(`image=${urlParam.get(urlparam)} is not a selectable option.`);
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
            const facs = viewer.querySelectorAll("*")[0];
            facs.style.width = `${viewer.offsetWidth}px`;
            facs.style.height = `${viewer.offsetHeight}px`;
        }
        window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
        citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
        citation_url.setAttribute("href", window.location.href);
    }

    textFeatures() {
        let el = document.getElementsByTagName('annotation-slider');
        let data = el[0].getAttribute("data-target");
        let options = JSON.parse(localStorage.getItem(data));
        if (!options) {
            alert(`Please turn on cookies to display content.\n
                Or check if configuration files path match data-target and data-path property.`)
        }
        let url = new URL(window.location.href);
        let urlParam = new URLSearchParams(url.search);
        let variants = options.variants.filter((v) => v.features.all === false);
        let wrg_ft = options.variants.filter((v) => typeof v.features.all !== "boolean");
        if (wrg_ft) {
            for (let w of wrg_ft) {
                console.log(`Type of variant ${w.opt} config. "features.all" must be boolean (true or false)`);
            }
        }
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
                if (typeof hide !== "boolean") {
                    console.log(`Type of variant config. "hide" must be boolean (true or false).`);
                }
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
                if (typeof hide !== "boolean") {
                    console.log(`Type of config. "variant.hide" must be boolean (true or false).`);
                }
                if (hide) {
                    el.style.display = "inline";
                }
            });
        };
        for (let v in variants) {
            if (urlParam.get(variants[v].opt) == null) {
                urlParam.set(variants[v].opt, "off");
            }
            else if (!["on", "off"].includes(urlParam.get(variants[v].opt))) {
                console.log(`${variants[v].opt}=${urlParam.get(variants[v].opt)} is not a selectable option.`);
                urlParam.set(variants[v].opt, "off");
            }
            else if (urlParam.get(variants[v].opt) == "off") {
                const color = variants[v].color;
                const html_class = variants[v].html_class;
                const css_class = variants[v].css_class;
                const hide = variants[v].hide;
                removeMarkup2(html_class, css_class, color, hide);
                const slider = document.getElementById(variants[v].opt_slider);
                slider.classList.remove(color);
                if (document.getElementById(variants[v].opt).checked === true) {
                    document.getElementById(variants[v].opt).checked = false;
                    document.getElementById(variants[v].opt).classList.remove(active);
                }
            }
            else if (urlParam.get(variants[v].opt) == "on") {
                let color = variants[v].color;
                let html_class = variants[v].html_class;
                let css_class = variants[v].css_class;
                let hide = variants[v].hide;
                addMarkup2(html_class, css_class, color, hide);
                let slider = document.getElementById(variants[v].opt_slider);
                slider.classList.add(color);
                if (document.getElementById(variants[v].opt).checked === false) {
                    document.getElementById(variants[v].opt).checked = true;
                    document.getElementById(variants[v].opt).classList.add(active);
                }
            }
            if (variants[v].chg_citation) {
                var citation_url = document.getElementById(variants[v].chg_citation);
            }
        }
        window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
        if (citation_url) {
            citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
            citation_url.setAttribute("href", window.location.href);
        }
    }

}

const fetch_options = new FetchOptionData();
let file = document.getElementsByTagName("full-size")[0].getAttribute("data-target");
let path = document.getElementsByTagName("full-size")[0].getAttribute("data-path");
if (!localStorage.getItem(file)) {
    window.onload = fetch_options.getDataCookie(`${location.protocol}//${location.host}/${path}/${file}.json`);
}
let file2 = document.getElementsByTagName("font-size")[0].getAttribute("data-target");
let path2 = document.getElementsByTagName("font-size")[0].getAttribute("data-path");
if (!localStorage.getItem(file2)) {
    window.onload = fetch_options.getDataCookie(`${location.protocol}//${location.host}/${path2}/${file2}.json`);
}
let file3 = document.getElementsByTagName("font-family")[0].getAttribute("data-target");
let path3 = document.getElementsByTagName("font-family")[0].getAttribute("data-path");
if (!localStorage.getItem(file3)) {
    window.onload = fetch_options.getDataCookie(`${location.protocol}//${location.host}/${path3}/${file3}.json`);
}
let file4 = document.getElementsByTagName("image-switch")[0].getAttribute("data-target");
let path4 = document.getElementsByTagName("image-switch")[0].getAttribute("data-path");
if (!localStorage.getItem(file4)) {
    window.onload = fetch_options.getDataCookie(`${location.protocol}//${location.host}/${path4}/${file4}.json`);
}
let file5 = document.getElementsByTagName("annotation-slider")[0].getAttribute("data-target");
let path5 = document.getElementsByTagName("annotation-slider")[0].getAttribute("data-path");
if (!localStorage.getItem(file5)) {
    window.onload = fetch_options.getDataCookie(`${location.protocol}//${location.host}/${path5}/${file5}.json`);
}

const update = new UrlSearchParamUpdate();
setTimeout(() => {
    window.customElements.define('full-size', FullSize);
    window.onload = update.fullSreen();
    window.customElements.define('image-switch', ImageSwitch);
    window.onload = update.viewerSwitch();
    window.customElements.define('font-size', FontSize);
    window.onload = update.fontSize();
    window.customElements.define('font-family', FontFamily);
    window.onload = update.fontFamily();
    window.customElements.define('annotation-slider', AnnotationSlider);
    window.onload = update.textFeatures();
}, 500);

window.onpopstate = () => {
    update.textFeatures();
    update.fontFamily();
    update.fontSize();
    update.viewerSwitch();
    update.fullSreen();
    pageUrl();
    // console.log(`location: ${document.location}, state: ${JSON.stringify(event.state)}`);
}
