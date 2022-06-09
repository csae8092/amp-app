const titles = {
    "deleted": "Deleted",
    "underlined": "Underlined",
    "whitespace": "Original white spaces",
    "unclear": "Unclear",
    "text-features": "Original text features"
}

const colors = {
    "deleted": "red",
    "underlined": "blue",
    "whitespace": "green",
    "unclear": "grey"
}

const htmlClasses = {
    "deleted": "del",
    "underlined": "hi-underline",
    "whitespace": "space",
    "unclear": "abbr"
}

const cssClasses = {
    "deleted": "strikethrough",
    "underlined": ["underline", "italic"],
    "whitespace": "whitespace",
    "unclear": "unclear"
}

const hidden = {
    "deleted": true,
    "underlined": false,
    "whitespace": false,
    "unclear": false
}

const allFeatures = {
    "deleted": false,
    "underlined": false,
    "whitespace": false,
    "unclear": false,
    "text-features": true,
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

    /*
        Single text features depending on opt attribute = id.
    */
    textFeatures() {
        const id = this.getAttribute("id");
        const all = allFeatures[id];
        const objKeys = Object.keys(htmlClasses);
        if (all) {
            if ( this.classList.contains("active") ) {
                this.classList.remove("active");    
                objKeys.forEach((el) => {
                    const color = colors[el];
                    const htmlClass = htmlClasses[el];
                    const cssClass = cssClasses[el];
                    const hide = hidden[el];
                    document.querySelectorAll(`.${htmlClass}`).forEach(function(el) {                
                        if (typeof cssClass === "object") {
                            el.classList.remove(cssClass[0]);
                            el.classList.add(cssClass[1]);
                        } else {
                            el.classList.remove(cssClass);
                        }
                        el.classList.remove(color);
                        el.classList.remove("badge-item");
                        if (hide) {
                            el.classList.add("fade");
                        }                
                    });
                    document.getElementById(`${el}-link`).classList.remove(color);            
                });
                for (let i = 0; i < objKeys.length; i++) {
                    if (document.getElementById(objKeys[i]).checked === true) {
                        document.getElementById(objKeys[i]).checked = false;
                    }
                    if (document.getElementById(objKeys[i]).checked === true) {
                        document.getElementById(objKeys[i]).checked = false;
                    }
                    if (document.getElementById(objKeys[i]).checked === true) {
                        document.getElementById(objKeys[i]).checked = false;
                    }
                    if (document.getElementById(objKeys[i]).checked === true) {
                        document.getElementById(objKeys[i]).checked = false;
                    }
                }                
            } else {
                this.classList.add("active");
                objKeys.forEach((el) => {
                    const color = colors[el];
                    const htmlClass = htmlClasses[el];
                    const cssClass = cssClasses[el];
                    const hide = hidden[el];
                    document.querySelectorAll(`.${htmlClass}`).forEach(function(el) {
                        if (typeof cssClass === "object") {
                            el.classList.add(cssClass[0]);
                            el.classList.remove(cssClass[1]);
                        } else {
                            el.classList.remove(cssClass);
                        }                 
                        el.classList.add(color);
                        el.classList.add("badge-item");
                        if (hide) {
                            el.classList.remove("fade");
                        }   
                    });
                    document.getElementById(`${el}-link`).classList.add(color);        
                });
                for (let i = 0; i < objKeys.length; i++) {
                    if (document.getElementById(objKeys[i]).checked === false) {
                        document.getElementById(objKeys[i]).checked = true;
                    }
                    if (document.getElementById(objKeys[i]).checked === false) {
                        document.getElementById(objKeys[i]).checked = true;
                    }
                    if (document.getElementById(objKeys[i]).checked === false) {
                        document.getElementById(objKeys[i]).checked = true;
                    }
                    if (document.getElementById(objKeys[i]).checked === false) {
                        document.getElementById(objKeys[i]).checked = true;
                    }
                }  
            }
        } else {
            const color = colors[id];
            const htmlClass = htmlClasses[id];
            const cssClass = cssClasses[id];
            const hide = hidden[id];
            if ( this.classList.contains("active") ) {
                this.classList.remove("active");            
                document.querySelectorAll(`.${htmlClass}`).forEach(function(el) {                
                    if (typeof cssClass === "object") {
                        el.classList.remove(cssClass[0]);
                        el.classList.add(cssClass[1]);
                    } else {
                        el.classList.remove(cssClass);
                    }
                    el.classList.remove(color);
                    el.classList.remove("badge-item");
                    if (hide) {
                        el.classList.add("fade");
                    }                
                });
                document.getElementById(`${id}-link`).classList.remove(color);
                this.classList.remove(color);
            } else {
                this.classList.add("active");
                document.querySelectorAll(`.${htmlClass}`).forEach(function(el) {
                    if (typeof cssClass === "object") {
                        el.classList.add(cssClass[0]);
                        el.classList.remove(cssClass[1]);
                    } else {
                        el.classList.remove(cssClass);
                    }                 
                    el.classList.add(color);
                    el.classList.add("badge-item");
                    if (hide) {
                        el.classList.remove("fade");
                    }   
                });
                document.getElementById(`${id}-link`).classList.add(color);
                this.classList.add(color);
                
            }
            /*
                If all or not all text features are selected the main original text features
                link will automatically be switched on or off.
            */
            for (let i = 0; i < objKeys.length; i++) {
                if (document.getElementById(objKeys[i]).checked === true && 
                    document.getElementById(objKeys[i + 1]).checked === true && 
                    document.getElementById(objKeys[i + 2]).checked === true && 
                    document.getElementById(objKeys[i + 3]).checked === true)
                {
                    document.getElementById("text-features").checked = true;
                    document.getElementById("text-features").classList.add("active");
                } else {
                    document.getElementById("text-features").checked = false;
                    document.getElementById("text-features").classList.remove("active");
                }
            }
        }
    }

    render() {
        const opt = this.getAttribute('opt');
        const feat = titles[opt];
        this.innerHTML = `
            <label>${feat}</label>
            <label class="switch">
                <input title="${feat}"
                    type="checkbox"
                    id="${opt}"/>
                <span id="${opt}-link" class="i-slider round"></span>                                                                        
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