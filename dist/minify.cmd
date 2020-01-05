terser text-input-datepicker-node.js -c -m --mangle-props reserved=[constructor,observedAttributes,disconnectedCallback,attributeChangedCallback,Datepicker,connectedCallback,enable,disable,setFocusOnCal,getDateString,getDateObject,dayNames,monthNames,sundayFirst,persistOnSelect,ignoreOnFocus,initDate,longPressThreshold,longPressInterval,showCloseIcon] -o _temp-file.js
node template_minifier.js _temp-file.js text-input-datepicker-node.min.js
rm _temp-file.js
terser text-input-datepicker.js -c -m --mangle-props reserved=[constructor,observedAttributes,disconnectedCallback,attributeChangedCallback,Datepicker,connectedCallback,enable,disable,setFocusOnCal,getDateString,getDateObject,dayNames,monthNames,sundayFirst,persistOnSelect,ignoreOnFocus,initDate,longPressThreshold,longPressInterval,showCloseIcon] -o _temp-file.js
node template_minifier.js _temp-file.js text-input-datepicker.min.js
rm _temp-file.js
