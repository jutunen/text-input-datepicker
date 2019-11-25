var fs = require("fs");

var args = process.argv.slice(2);

//console.log(JSON.stringify(args));

var data = fs.readFileSync(args[0]);

//console.log(data.toString());

//var newStr = data.toString().replace(/`(.|\n)*`/,"Heh");
//var newStr = data.toString().replace(/(`)\n(<style>)/,"$1$2");
//var newStr = data.toString().replace(/(.*;)\n(.*)/g,"$1$2");
var newStr = data.toString().replace(/\\n\s*/g,"");
newStr = newStr.replace(/\s{/g,"{");

//console.log(newStr);

fs.writeFile(args[1], newStr, function (err) {
  if (err) throw err;
});
