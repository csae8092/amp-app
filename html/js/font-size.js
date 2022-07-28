const font_url = `${location.protocol}//${location.host}/js/json/conf_fontsize.json`;
console.log(font_url);
fetch(font_url)
.then((response) => response.json())
.then((options_fontsize) => {

    class FontSize extends HTMLElement {

        "use strict";

        static get observedAttributes() {
            return ["opt"];
        }

        connectedCallback() {
            this.render();
            this.childNodes[0].addEventListener("change", this.fontSize);
        }

        fontSize() {
            const url = new URL(window.location.href);
            const urlParam = new URLSearchParams(url.search);
            const id = this.getAttribute("id");
            const variant = options_fontsize.variants.find((v) => v.opt === id);
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
        }

        render() {
            const opt = this.getAttribute("opt");
            const variant = options_fontsize.variants.find((v) => v.opt === opt);
            const size = variant.sizes;
            const html_class = options_fontsize.html_class;
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
        }

        attributeChangedCallback() {
            this.render();
        }

        disconnectedCallback() {
            this.childNodes[0].removeEventListener("change", this.fontSize);
        }

    }
    window.customElements.define('font-size', FontSize);
    window.onload = fontsizeUrl();

    function fontsizeUrl() {
        const url = new URL(window.location.href);
        const urlParam = new URLSearchParams(url.search);
        const variants = options_fontsize.variants;
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
});