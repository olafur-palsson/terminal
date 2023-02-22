let isoString = new Date().toISOString();
isoString += ' | '
process.argv.forEach((value, i) => {
    if (i < 2) {
        return;
    }
    if (i > 2) {
        isoString += ', '
    }
    isoString += value
});
console.log(isoString)
