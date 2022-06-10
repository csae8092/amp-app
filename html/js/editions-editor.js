const options = {
    name: 'Text Annotations',
    variants : [
        {
            opt: 'deleted',
            title: 'Deleted',
            color: 'red',
            htmlClass: 'del',
            cssClass: 'strikethrough',
            hide: true,
            allFeatures: false,
        },
        {
            opt: 'underlined',
            title: 'Underlined',
            color: 'blue',
            htmlClass: 'hi-underline',
            cssClass: ['underline', 'italic'],
            hide: false,
            allFeatures: false,
        },
        {
            opt: 'whitespace',
            title: 'Original white spaces',
            color: 'green',
            htmlClass: 'space',
            cssClass: 'whitespace',
            hide: false,
            allFeatures: false,
        },
        {
            opt: 'unclear',
            title: 'Unclear',
            color: 'grey',
            htmlClass: 'abbr',
            cssClass: 'unclear',
            hide: false,
            allFeatures: false,
        },
        {
            opt: 'text-features',
            title: 'Original text features',
            color: 'grey',
            htmlClass: 'undefined',
            cssClass: 'undefined',
            hide: false,
            allFeatures: true,
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
        const all = variant.allFeatures;
        const variants = options.variants.filter((v) => v.allFeatures === false);
        const noneVariant = options.variants.find((v) => v.allFeatures === true);
        const remove = function (htmlClass, cssClass, color, hide) {
            document.querySelectorAll(`.${htmlClass}`).forEach(function(el) {                
                if (typeof cssClass === "object") {
                    cssClass.forEach((css) => {
                        if (el.classList.contains(css)) {
                            el.classList.remove(css);
                        } else {
                            el.classList.add(css);
                        }
                    });
                } else {
                    el.classList.remove(cssClass);
                }
                el.classList.remove(color);
                el.classList.remove("badge-item");
                if (hide) {
                    el.classList.add("fade");
                }                
            });
        };
        const add = function (htmlClass, cssClass, color, hide) {
            document.querySelectorAll(`.${htmlClass}`).forEach(function(el) {
                if (typeof cssClass === "object") {
                    cssClass.forEach((css) => {
                        if (el.classList.contains(css)) {
                            el.classList.remove(css);
                        } else {
                            el.classList.add(css);
                        }
                    });
                } else {
                    el.classList.add(cssClass);
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
                    const htmlClass = el.htmlClass;
                    const cssClass = el.cssClass;
                    const hide = el.hide;
                    remove(htmlClass, cssClass, color, hide);
                    document.getElementById(`${el.opt}-link`).classList.remove(color);
                    if (document.getElementById(el.opt).checked === true) {
                        document.getElementById(el.opt).checked = false;
                        document.getElementById(el.opt).classList.remove("active");
                    } 
                });                
            } else {
                this.classList.add("active");
                variants.forEach((el) => {                    
                    const color = el.color;
                    const htmlClass = el.htmlClass;
                    const cssClass = el.cssClass;
                    const hide = el.hide;
                    add(htmlClass, cssClass, color, hide);
                    document.getElementById(`${el.opt}-link`).classList.add(color);
                    if (document.getElementById(el.opt).checked === false) {
                        document.getElementById(el.opt).checked = true;       
                        document.getElementById(el.opt).classList.add("active");                 
                    }     
                });                
            }
        } else {
            const opt = variant.opt;
            const color = variant.color;
            const htmlClass = variant.htmlClass;
            const cssClass = variant.cssClass;
            const hide = variant.hide;
            if ( this.classList.contains("active") ) {
                this.classList.remove("active");            
                remove(htmlClass, cssClass, color, hide);
                document.getElementById(`${opt}-link`).classList.remove(color);
                this.classList.remove(color);
            } else {
                this.classList.add("active");
                add(htmlClass, cssClass, color, hide);
                document.getElementById(`${opt}-link`).classList.add(color);
                this.classList.add(color);
            }
            /*
                If all or not all text features are selected the original text features
                link will automatically be switched on or off.
            */
            const variants_checked = document.querySelectorAll("input.single-feature:checked");
            if (variants_checked.length === variants.length) {
                document.getElementById(noneVariant.opt).checked = true;
                document.getElementById(noneVariant.opt).classList.add("active");
            } else {
                document.getElementById(noneVariant.opt).checked = false;
                document.getElementById(noneVariant.opt).classList.remove("active");
            }
        }
    }

    render() {
        const opt = this.getAttribute("opt");
        const variant = options.variants.find((v) => v.opt === opt);
        const title = variant.title;
        const all = variant.allFeatures;
        if (all) {
            this.innerHTML = `
                <label>${title}</label>
                <label class="switch">
                    <input title="${title}"
                        type="checkbox"
                        id="${opt}"
                        class="all-features"/>
                    <span id="${opt}-link" class="i-slider round"></span>                                                                        
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
                    <span id="${opt}-link" class="i-slider round"></span>                                                                        
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