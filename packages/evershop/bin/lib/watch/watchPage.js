// packages/evershop/bin/lib/watch/watchPage.js

const touch = require('touch');
const { resolve } = require('path');
const { CONSTANTS } = require('@evershop/evershop/src/lib/helpers');

// Fonksiyona isim verildi
function watchPage(event) {
  if (event === 'add') {
    // TODO: Touching this file will trigger a rebuild of all pages. This is not optimized
    touch(
      resolve(
        CONSTANTS.MOLDULESPATH,
        '../components/common/react/client/Index.jsx'
      )
    );
  }
}

module.exports.watchPage = watchPage;

