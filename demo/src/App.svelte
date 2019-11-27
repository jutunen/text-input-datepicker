<script>

  import Highlight from 'svelte-highlight';
  import { xml } from 'svelte-highlight/languages';
  import { javascript } from 'svelte-highlight/languages';
  import { github } from 'svelte-highlight/styles';
  import 'text-input-datepicker'

  var html_code = 'HTML code:'

  function toggle_calendar() {
    var picker = document.getElementById('picker')
    picker.setFocusOnCal()
  }

</script>

<svelte:head>
  {@html github}
</svelte:head>

<main>
  <div id="description">
    text-input-datepicker web component is available from <a href="https://github.com/jutunen/text-input-datepicker" target="_blank">GitHub</a> and <a href="https://www.npmjs.com/package/text-input-datepicker" target="_blank">NPM registry</a>
  </div>
  <div id='header'>
    text-input-datepicker demo
  </div>
  <div class='container'>
    <div class='description'>
    Default behaviour, calendar appears when input element gets focus:
    </div>
    <text-input-datepicker>
      <input type='text' placeholder='Click me!'>
    </text-input-datepicker>
    <div class='code_heading'>
      {html_code}
    </div>
    <div class='code'>
      <Highlight language={xml}>
      {` <text-input-datepicker>`}
      <br>
      {`  <input type='text'>`}
      <br>
      {`</text-input-datepicker>`}
      </Highlight>
    </div>
  </div>
  <div class='container'>
    <div class='description'>
    Setting current date as initial date:
    </div>
    <text-input-datepicker init-date='current'>
      <input type='text' placeholder='Click me!'>
    </text-input-datepicker>
    <div class='code_heading'>
      {html_code}
    </div>
    <div class='code'>
      <Highlight language={xml}>
      {` <text-input-datepicker init-date='current'>`}
      <br>
      {`  <input type='text'>`}
      <br>
      {`</text-input-datepicker>`}
      </Highlight>
    </div>
  </div>
  <div class='container'>
    <div class='description'>
    Sunday first:
    </div>
    <text-input-datepicker sunday-first>
      <input type='text' placeholder='Click me!'>
    </text-input-datepicker>
    <div class='code_heading'>
      {html_code}
    </div>
    <div class='code'>
      <Highlight language={xml}>
      {` <text-input-datepicker sunday-first>`}
      <br>
      {`  <input type='text'>`}
      <br>
      {`</text-input-datepicker>`}
      </Highlight>
    </div>
  </div>
  <div class='container'>
    <div class='description'>
    Persist on select:
    </div>
    <text-input-datepicker persist-on-select>
      <input type='text' placeholder='Click me!'>
    </text-input-datepicker>
    <div class='code_heading'>
      {html_code}
    </div>
    <div class='code'>
      <Highlight language={xml}>
      {` <text-input-datepicker persist-on-select>`}
      <br>
      {`  <input type='text'>`}
      <br>
      {`</text-input-datepicker>`}
      </Highlight>
    </div>
  </div>
  <div class='container'>
    <div class='description'>
    Show close icon:
    </div>
    <text-input-datepicker show-close-icon>
      <input type='text' placeholder='Click me!'>
    </text-input-datepicker>
    <div class='code_heading'>
      {html_code}
    </div>
    <div class='code'>
      <Highlight language={xml}>
      {` <text-input-datepicker show-close-icon>`}
      <br>
      {`  <input type='text'>`}
      <br>
      {`</text-input-datepicker>`}
      </Highlight>
    </div>
  </div>
  <div class='container'>
    <div class='description'>
    Ignore on focus, call setFocusOnCal() instead:
    </div>
    <div class='alternative'>
      <text-input-datepicker id='picker' ignore-on-focus>
        <input type='text' placeholder='Click the icon -->'>
      </text-input-datepicker>
      <div id='cal_button' on:click={toggle_calendar}>
        &#128197;
      </div>
    </div>
    <div class='code_heading'>
      {html_code}
    </div>
    <div class='code'>
      <Highlight language={xml}>
      {` <text-input-datepicker id='picker' ignore-on-focus>`}
      <br>
      {`  <input type='text'>`}
      <br>
      {`</text-input-datepicker>`}
      <br>
      {`<div onclick="toggle_calendar()">`}
      <br>
        {`  &#128197;`}
      <br>
      {`</div>`}
      </Highlight>
    </div>
    <div class='code_heading'>
      Javascript code:
    </div>
    <div class='code'>
      <Highlight language={javascript}>
         {`function toggle_calendar() {
  var picker = document.getElementById('picker')
  picker.setFocusOnCal()
}`}
      </Highlight>
    </div>
  </div>
  <div id="footer">
    this page was made with &heartsuit; and  <a href="https://svelte.dev/" target="_blank">Svelte</a>
  </div>
</main>

<style>

#cal_button{
  width:25px;
  height: 25px;
  background-color: white;
  margin-left:5px;
  font-size: 24px;
}

#cal_button:hover{
  cursor: pointer;
}

.alternative {
  display:flex;
  align-items:center;
  justify-content:center;
}

.description{
  margin:10px;
}

.code{
  padding:1px 20px 1px 20px;
  margin:0px 5px 10px 5px;
  width:480px;
  background-color: white;
  font-family: "Courier New", Courier, monospace;
  font-size: 14px;
  text-align: left;
}

.code_heading{
  width:516px;
  background-color: white;
  font-family: Arial;
  padding:2px;
  margin:10px 5px 0px 5px;
  color:gray;
  font-style: italic;
  font-size: 14px;
}

.container, #header{
  padding: 10px 20px;
  margin:10px auto;
  width:500px;
  display:flex;
  align-items:center;
  justify-content:center;
  background-color: #ebf6f9;
  flex-direction: column;
  font-family: Arial;
  box-shadow: 4px 4px 4px lightgrey;
}

#header {
  font-size: 20px;
}

#description, #footer {
  width: 600px;
  padding: 10px 20px;
  margin:10px auto;
  font-size: 16px;
  font-style: italic;
  font-family: Arial;
  text-align: center;
}

#footer{
  margin-top:30px;
}

input {
  width:110px;
}

</style>
