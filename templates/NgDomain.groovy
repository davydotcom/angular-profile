(function() {
    'use strict';

    angular
        .module("${packageName}")
        .factory("${className}", ${className});

    function ${className}(\$resource) {
        return \$resource(
                    "${propertyName}/:id",
                    null,
                    {"update": {method: "PUT"}, "list": {method: "GET", isArray: true}}
               );
    }

})();
