const options = {
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
            all_features: false,
        },
        {
            opt: 'underlined',
            opt_slider: 'underlined-slider',
            title: 'Underlined',
            color: 'blue',
            html_class: 'hi-underline',
            css_class: ['underline', 'italic'],
            hide: false,
            all_features: false,
        },
        {
            opt: 'whitespace',
            opt_slider: 'whitespace-slider',
            title: 'Original white spaces',
            color: 'green',
            html_class: 'space',
            css_class: 'whitespace',
            hide: false,
            all_features: false,
        },
        {
            opt: 'unclear',
            opt_slider: 'unclear-slider',
            title: 'Unclear',
            color: 'grey',
            html_class: 'abbr',
            css_class: 'unclear',
            hide: false,
            all_features: false,
        },
        {
            opt: 'text-features',
            opt_slider: 'text-features-slider',
            title: 'Original text features',
            color: 'grey',
            html_class: 'undefined',
            css_class: 'undefined',
            hide: false,
            all_features: true,
        }
    ]
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
        const variant = options.variants.find((v) => v.opt === id);
        const all = variant.all_features;
        const variants = options.variants.filter((v) => v.all_features === false);
        const none_variant = options.variants.find((v) => v.all_features === true);
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
                el.classList.remove("badge-item");
                if (hide) {
                    el.classList.add("fade");
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
                el.classList.add("badge-item");
                if (hide) {
                    el.classList.remove("fade");
                }   
            });
        };

        if (all) {
            if ( this.classList.contains("active") ) {
                this.classList.remove("active");    
                variants.forEach((el) => {
                    const color = el.color;
                    const html_class = el.html_class;
                    const css_class = el.css_class;
                    const hide = el.hide;
                    remove(html_class, css_class, color, hide);
                    document.getElementById(el.opt_slider).classList.remove(color);
                    if (document.getElementById(el.opt).checked === true) {
                        document.getElementById(el.opt).checked = false;
                        document.getElementById(el.opt).classList.remove("active");
                    } 
                });                
            } else {
                this.classList.add("active");
                variants.forEach((el) => {                    
                    const color = el.color;
                    const html_class = el.html_class;
                    const css_class = el.css_class;
                    const hide = el.hide;
                    add(html_class, css_class, color, hide);
                    document.getElementById(el.opt_slider).classList.add(color);
                    if (document.getElementById(el.opt).checked === false) {
                        document.getElementById(el.opt).checked = true;       
                        document.getElementById(el.opt).classList.add("active");                 
                    }     
                });                
            }
        } else {
            const opt = variant.opt;
            const color = variant.color;
            const html_class = variant.html_class;
            const css_class = variant.css_class;
            const hide = variant.hide;
            if ( this.classList.contains("active") ) {
                this.classList.remove("active");            
                remove(html_class, css_class, color, hide);
                document.getElementById(variant.opt_slider).classList.remove(color);
                this.classList.remove(color);
            } else {
                this.classList.add("active");
                add(html_class, css_class, color, hide);
                document.getElementById(variant.opt_slider).classList.add(color);
                this.classList.add(color);
            }
            /*
                If all or not all text features are selected the original text features
                link will automatically be switched on or off.
            */
            const variants_checked = document.querySelectorAll("input.single-feature:checked");
            if (variants_checked.length === variants.length) {
                document.getElementById(none_variant.opt).checked = true;
                document.getElementById(none_variant.opt).classList.add("active");
            } else {
                document.getElementById(none_variant.opt).checked = false;
                document.getElementById(none_variant.opt).classList.remove("active");
            }
        }
    }

    render() {
        const opt = this.getAttribute("opt");
        const variant = options.variants.find((v) => v.opt === opt);
        const title = variant.title;
        const all = variant.all_features;
        const opt_slider = variant.opt_slider;
        if (all) {
            this.innerHTML = `
                <label>${title}</label>
                <label class="switch">
                    <input title="${title}"
                        type="checkbox"
                        id="${opt}"
                        class="all-features"/>
                    <span id="${opt_slider}r" class="i-slider round"></span>                                                                        
                </label> 
            `;
        } else {
            this.innerHTML = `
                <label>${title}</label>
                <label class="switch">
                    <input title="${title}"
                        type="checkbox"
                        id="${opt}"
                        class="single-feature"/>
                    <span id="${opt_slider}" class="i-slider round"></span>                                                                        
                </label> 
            `;
        }
    }

    attributeChangedCallback(attr, oldValue, newValue) {
        this.render();
    }

    disconnectedCallback() {
        this.childNodes[3].childNodes[1].removeEventListener("click", this.textFeatures);
    };

 }
 window.customElements.define('annotation-slider', AnnotationSlider);