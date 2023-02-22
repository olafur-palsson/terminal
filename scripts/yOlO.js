var str = process.argv[2];
var outString = ''
process.argv.forEach((str, i) => {
  if (i < 2) {
    return;
  }
  if (i > 2) {
    outString += ' '
  }
  outString += str.split('').map((v, i) => i % 2 == 0 ? v.toLowerCase() : v.toUpperCase()).join('');
})

console.log(outString);
