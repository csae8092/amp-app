const options_annotation_slider = {
    name: 'Text Annotations',
    variants : [
        {
            opt: 'deleted',
            opt_slider: 'deleted-slider',
            title: 'Deleted',
            color: 'red',
            html_class: 'del',
            css_class: 'strikethrough',
            hide: true,
            features: {
                all: false,
                class: 'single-feature',
            },
        },
        {
            opt: 'underlined',
            opt_slider: 'underlined-slider',
            title: 'Underlined',
            color: 'blue',
            html_class: 'hi-underline',
            css_class: ['underline', 'italic'],
            hide: false,
            features: {
                all: false,
                class: 'single-feature',
            },
        },
        {
            opt: 'whitespace',
            opt_slider: 'whitespace-slider',
            title: 'Original white spaces',
            color: 'green',
            html_class: 'space',
            css_class: 'whitespace',
            hide: false,
            features: {
                all: false,
                class: 'single-feature',
            },
        },
        {
            opt: 'unclear',
            opt_slider: 'unclear-slider',
            title: 'Unclear',
            color: 'grey',
            html_class: 'abbr',
            css_class: 'unclear',
            hide: false,
            features: {
                all: false,
                class: 'single-feature',
            },
        },
        {
            opt: 'text-features',
            opt_slider: 'text-features-slider',
            title: 'Original text features',
            color: 'grey',
            html_class: 'undefined',
            css_class: 'undefined',
            hide: false,
            features: {
                all: true,
                class: 'all-features',
            },
        }
    ],
    span_element: {
        css_class : "badge-item",
    },
    active_class: "active",
    rendered_element: {
        label_class: "switch",
        slider_class: "i-slider round",
    }
}


class AnnotationSlider extends HTMLElement {

    "use strict";
    
    static get observedAttributes() {
        return ["opt"];
    }

    connectedCallback() {
        this.render();
        this.childNodes[3].childNodes[1].addEventListener("click", this.textFeatures);
        // console.log(this.childNodes[3].childNodes[1]);
    }

    textFeatures() {
        const id = this.getAttribute("id");
        const variant = options_annotation_slider.variants.find((v) => v.opt === id);
        const all = variant.features.all;
        const variants = options_annotation_slider.variants.filter((v) => v.features.all === false);
        const none_variant = options_annotation_slider.variants.find((v) => v.features.all === true);
        const style = options_annotation_slider.span_element;
        const active = options_annotation_slider.active_class;
        const remove = (html_class, css_class, color, hide) => {
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
        const add = (html_class, css_class, color, hide) => {
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
                    const color = el.color;
                    const html_class = el.html_class;
                    const css_class = el.css_class;
                    const hide = el.hide;
                    remove(html_class, css_class, color, hide);
                    document.getElementById(el.opt_slider).classList.remove(color);
                    if (document.getElementById(el.opt).checked === true) {
                        document.getElementById(el.opt).checked = false;
                        document.getElementById(el.opt).classList.remove(active);
                    } 
                });                
            } else {
                this.classList.add(active);
                variants.forEach((el) => {                    
                    const color = el.color;
                    const html_class = el.html_class;
                    const css_class = el.css_class;
                    const hide = el.hide;
                    add(html_class, css_class, color, hide);
                    document.getElementById(el.opt_slider).classList.add(color);
                    if (document.getElementById(el.opt).checked === false) {
                        document.getElementById(el.opt).checked = true;       
                        document.getElementById(el.opt).classList.add(active);                 
                    }     
                });                
            }
        } else {
            // const opt = variant.opt;
            const color = variant.color;
            const html_class = variant.html_class;
            const css_class = variant.css_class;
            const hide = variant.hide;
            if ( this.classList.contains(active) ) {
                this.classList.remove(active);            
                remove(html_class, css_class, color, hide);
                document.getElementById(variant.opt_slider).classList.remove(color);
                this.classList.remove(color);
            } else {
                this.classList.add(active);
                add(html_class, css_class, color, hide);
                document.getElementById(variant.opt_slider).classList.add(color);
                this.classList.add(color);
            }
            /*
                If all or not all text features are selected the original text features
                link will automatically be switched on or off.
            */
            const variants_checked = document.querySelectorAll(`input.${variant.features.class}:checked`);
            if (variants_checked.length === variants.length) {
                document.getElementById(none_variant.opt).checked = true;
                document.getElementById(none_variant.opt).classList.add(active);
            } else {
                document.getElementById(none_variant.opt).checked = false;
                document.getElementById(none_variant.opt).classList.remove(active);
            }
        }
    }

    render() {
        const opt = this.getAttribute("opt");
        const variant = options_annotation_slider.variants.find((v) => v.opt === opt);
        const title = variant.title;
        const opt_slider = variant.opt_slider;
        const rendered_element = options_annotation_slider.rendered_element;
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
    }

    attributeChangedCallback(attr, oldValue, newValue) {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[3].childNodes[1].removeEventListener("click", this.textFeatures);
    };

 }
 window.customElements.define('annotation-slider', AnnotationSlider);