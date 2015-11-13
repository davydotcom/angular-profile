(function() {
    'use strict';

    angular
        .module("${packageName}")
        .provider("${name}", ${name});

    function ${name}() {
        return {
            \$get: function() {

            }
        };
    }

})();

