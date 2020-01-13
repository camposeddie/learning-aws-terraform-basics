//NOTE- This method of parsing a file name to seperate will not work for "complex" file extensions such as .tar.gz

const path = require('path');

exports.rename = function (originalFileName) {
    try {
        let filename = path.parse(originalFileName).name;
        let extension = path.parse(originalFileName).ext;
        if(filename && extension) {
            return `${filename}_renamed${extension}`;
        } else {
            console.log(new Error(`Error: Filename missing name or extension`));
        }
    }
    catch(err) {
        console.log(new Error(`Error: ${err}`));
    }
}