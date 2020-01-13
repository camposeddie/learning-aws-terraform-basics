const chai = require('chai');
const assert = chai.assert;
const renameFileScript = require('../inputs/renameFileScript.js');

describe('RenameFile', function() {
    it('renameFile should return test_renamed.txt', function() {
        assert.equal(renameFileScript.rename('test.txt'), 'test_renamed.txt');
    });
});

describe('RenameFile', function() {
    it('renameFile should return 12_renamed.txt', function() {
        assert.equal(renameFileScript.rename('12.txt'), '12_renamed.txt');
    });
});

describe('RenameFile', function() {
    it('renameFile should return test.tar_renamed.gz', function() {
        assert.equal(renameFileScript.rename('test.tar.gz'), 'test.tar_renamed.gz');
    });
});

//Assume that any file name without an extension is an invalid type name
// describe('RenameFile', function() {
//     it('renameFile should return test_renamed', function() {
//         assert.equal(renameFileScript.handler('test'), 'test_renamed');
//     });
// });

describe('RenameFile', function() {
    it('renameFile should return _renamed.txt', function() {
        assert.equal(renameFileScript.rename('.txt'), 'Error: Invalid input filename.');
    });
});

describe('RenameFile', function() {
    it('renameFile should return input error', function() {
        assert.equal(renameFileScript.rename(''), 'Error: Invalid input filename.');
    });
});