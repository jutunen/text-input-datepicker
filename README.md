
# text-input-datepicker

A web component that wraps a text input element and adds date-picker functionality to it.

## Features
Text-input-datepicker is a stand-alone vanilla JS web component that does not use shadow DOM. The component wraps a text input element and adds date-picker functionality to it. The calendar will appear when the input element gets focus.

Component features include:

- highly customizable calendar layout
- configurable names of months and week days
- first day of week selection: sunday or monday
- date format customization
- initial date setting
- written date input & validation
- keyboard accessible calendar (tabindex)
- rapid month/year switching with long press

## Including the component to an HTML file

1. Import polyfill, this is not needed for modern browsers:

    ```html
    <script src="https://cdnjs.cloudflare.com/ajax/libs/custom-elements/1.2.4/custom-elements.min.js"></script>
    ```

2. Import custom element:

    ```html
    <script defer src='text-input-datepicker.min.js'></script>
    ```

3. Start using it!

    ```html
    <text-input-datepicker>
      <input type='text'>
    </text-input-datepicker>
    ```
## Including the component from NPM

1. Install and import polyfill, this is not needed for modern browsers:

   See https://www.npmjs.com/package/@webcomponents/custom-elements

2. Install text-input-datepicker NPM package:

    ```console
    npm i text-input-datepicker
    ```

3. Import custom element:

    ```javascript
    import 'text-input-datepicker'
    ```

4. Start using it:

   ```javascript
   var picker = document.createElement('text-input-datepicker')
   var input = document.createElement("input")
   input.setAttribute('type', 'text')
   picker.appendChild(input)
   document.body.appendChild(picker)
   ```
## Attributes

Currently component has only one custom attribute that can be assigned a value in the HTML tag:

Name            | Type      | Description             | Unit / Values                                | Default value
---             | ---       | ---                     | ---                                          | ---
init-date       | String   | Initial date in the input field       |Date in "dd.mm.yyyy" format or<br>"current" to select current date                     | None


Following component attributes are boolean attributes, also known as valueless attributes. The presence of a boolean attribute in the HTML tag represents the true value, and the absence of the attribute represents the false value.
Name | Description | if attribute is defined | If attribute is not defined
-------|---------|--------|-------
ignore-on-focus| Calendar appearance after the input element gets focus| Calendar won't appear| Calendar appears
sunday-first|First day of the calendar week | Sunday is first | Monday is first
persist-on-select | Calendar visibility after the date has been selected | Calendar won't disappear | Calendar disappears
show-close-icon | Calendar close icon visibility | Icon is visible | Icon is hidden

Examples:

   ```html
    <text-input-datepicker init-date='28.12.2005' sunday-first>
      <input type='text'>
    </text-input-datepicker>
   ```

   ```html
    <text-input-datepicker init-date='current' persist-on-select>
      <input type='text'>
    </text-input-datepicker>
   ```


Following custom attributes can be specified at build time or dynamically at runtime:

Name            | Type      | Description             | Unit / Values                                | Default value
---             | ---       | ---                     | ---                                          | ---
dayNames       | Array of strings   | Week day names       |Week day names from Monday to Sunday                     | Mon, Tue, Wed, Thu, Fri, Sat, Sun
monthNames       | Array of strings   | Month names       |Month names from January to December                     | Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
ignoreOnFocus       | Boolean   | Calendar appearance after the input element gets focus       |true for not appearing<br>false for appearing                     | false
sundayFirst       | Boolean   | Starting day of the week       |true for Sunday<br>false for Monday                     | false
persistOnSelect       | Boolean   | Calendar visibility after the date has been selected       |true for visible<br>false for hidden                     | false
showCloseIcon       | Boolean   | Calendar close icon visibility       |true for visible<br>false for hidden                     | false
initDate       | String   | Initial date in the input field       |Date in "dd.mm.yyyy" format or "current" to select current date                     | None
longPressThreshold       | Number   | Month/year switch long press threshold        |Milliseconds                     | 500
longPressInterval       | Number   | Long press month/year switch interval        |Milliseconds                     | 150

Example:

   ```javascript
   var picker = document.createElement('text-input-datepicker')
   picker.dayNames = ['Mo','Tu','We','Th','Fr','Sa','Su']
   picker.initDate = 'current'
   var input = document.createElement("input")
   input.setAttribute('type', 'text')
   picker.appendChild(input)
   document.body.appendChild(picker)
   ```
**Regarding dynamic and runtime usage of the component, custom attributes should always be set before the datepicker element is appended to DOM or initialized.**
Although init() method can be called multiple times, not all attributes can be changed after the initial init.
Regarding init-date (InitDate) attribute, notice that the initial date format is determined by _returnDateString() and _parseAndValidateInputStr() methods, see chapter Date format and validation below.

## Methods

### init()
Initializes date-picker functionality. This method is called automatically when the datepicker element is appended to DOM. This method has no effect, if the element does not have an input element as a child. If the datepicker is appended to DOM before the input element is appended to datepicker, init() must be called to make datepicker work.
### setFocusOnCal()
The calendar will appear and get the focus when this method is called. On touch UIs this method can be used to prevent the keyboard from appearing, as the text input field won't get the focus. This method has no effect, if init() has not been called. If ignoreOnFocus has been set to true, this method is the only way to make the calendar appear.
### getDateString()
Returns the date as string. Default format is "mm.dd.yyyy".
Returns null if the input field does not contain a valid date.
Date format and validity is determined by _returnDateString() and _parseAndValidateInputStr() methods.
### getDateObject()
Returns the date as standard JS date object.
Returns null if the input field does not contain a valid date.
Notice:
Since datepicker returns the object date in local time, UTC getter methods should not be used when processing the returned date further. Neither Date.toJSON() nor Date.toISOString() methods should be used, as they return the date in UTC format too.
## Date format and validation
Default format is "mm.dd.yyyy".
Date format can be changed by modifying _returnDateString() method.
When date is written to input field, it is validated automatically if datepicker is initialized.
If the date format to be used is changed, then the validating method must be modified also.
The validating method to be modified is _parseAndValidateInputStr()
It must return an object with either 1 or 4 properties:
* valid - boolean value indicating whether the date string is valid or not
* day - number value indicating the day of month (1 - 31) of the valid date string
* month - number value indicating the month (0-11) of the valid date string
* year - number value indicating the year of the valid date string

Methods getDateString() and getDateObject() can also be used for validating the date, see above.
## Events
If the input element loses focus and the date string is not valid, datepicker shall dispatch invalid event.

When the date string is changed to a new valid date or a new date is selected from the calendar, datepicker shall dispatch datechanged event.

datechanged is a custom event. It can be replaced with a more standard change event by changing the following code line:
   ```javascript
   this.dispatchEvent(new CustomEvent('datechange'))
   ```
to this:
   ```javascript
   this.dispatchEvent(new Event('change'))
   ```
Notice:
The input element dispatches change events too. If datepicker and its input element both dispatch change events, the event handler must examine the event in further detail in order to determine its origin.
## Style and layout
The style is defined in the HTML template string inside the component's contructor. Styling can be moved to an external CSS file by cutting and pasting everything that's inside style tags and then removing the void tags.

Calendar's adjacent month day numbers can be changed to invisible by replacing the color definition in .calAdjacentMonthDay with
```css
visibility:hidden;
```

## Building
Unminified scripts in the dist folder can be used and modified as such, there are no build scripts available for them.
Building is done by executing the minifier script minify.cmd, which is a Linux bash shell script.
Minify.cmd can be found from dist folder.
Building (minifying) requires terser command line tool to be installed. It can be installed with following command:
```console
 npm install terser -g
   ```


## License
Copyright (c) 2019 Jussi Utunen

Licensed under the MIT License
