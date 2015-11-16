//= require /angular/angular
//= require /angular/angular-resource
//= require_self
//= require_tree services
//= require_tree controllers
//= require_tree directives
//= require_tree domain
//= require_tree templates

(function() {
    'use strict';

    angular.module("${propertyName}", ["ngResource"])
           .constant('contextPath', window.contextPath)
           .config(function (\$httpProvider) {
        \$httpProvider.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
        \$httpProvider.interceptors.push(httpRequestInterceptor);
    });

    function httpRequestInterceptor(contextPath) {
        return {
            request: function (config) {
                config.url = contextPath + '/' + config.url;
                return config;
            }
        };
    }
})();