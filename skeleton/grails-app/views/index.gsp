<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Welcome to Grails</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript">
        window.contextPath = "${request.contextPath}";
    </script>
    <style type="text/css" media="screen">
        #status {
            background-color: #eee;
            border: .2em solid #fff;
            margin: 2em 2em 1em;
            padding: 1em;
            width: 12em;
            float: left;
            -moz-box-shadow: 0px 0px 1.25em #ccc;
            -webkit-box-shadow: 0px 0px 1.25em #ccc;
            box-shadow: 0px 0px 1.25em #ccc;
            -moz-border-radius: 0.6em;
            -webkit-border-radius: 0.6em;
            border-radius: 0.6em;
        }

        #status ul {
            font-size: 0.9em;
            list-style-type: none;
            margin-bottom: 0.6em;
            padding: 0;
        }

        #status li {
            line-height: 1.3;
        }

        #status h1 {
            text-transform: uppercase;
            font-size: 1.1em;
            margin: 0 0 0.3em;
        }

        #page-body {
            margin: 2em 1em 1.25em 18em;
        }

        h2 {
            margin-top: 1em;
            margin-bottom: 0.3em;
            font-size: 1em;
        }

        p {
            line-height: 1.5;
            margin: 0.25em 0;
        }

        #controller-list ul {
            list-style-position: inside;
        }

        #controller-list li {
            line-height: 1.3;
            list-style-position: inside;
            margin: 0.25em 0;
        }

        @media screen and (max-width: 480px) {
            #status {
                display: none;
            }

            #page-body {
                margin: 0 1em 1em;
            }

            #page-body h1 {
                margin-top: 0;
            }
        }
    </style>
</head>
<body ng-app="index" ng-controller="IndexController as idxCtrl">
    <div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>
    <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div id="status" role="complementary">
        <h1>Application Status</h1>
        <ul>
            <li>Environment: {{idxCtrl.applicationData.environment}}</li>
            <li>App profile: {{idxCtrl.applicationData.appprofile}}</li>
            <li>App version: {{idxCtrl.applicationData.appversion}}</li>
            <li>Grails version: {{idxCtrl.applicationData.grailsversion}}</li>
            <li>Groovy version: {{idxCtrl.applicationData.groovyversion}}</li>
            <li>JVM version: {{idxCtrl.applicationData.jvmversion}}</li>
            <li>Reloading active: {{idxCtrl.applicationData.reloadingagentenabled}}</li>
        </ul>
%{--        <h1>Artefacts</h1>
        <ul>
            <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
            <li>Domains: ${grailsApplication.domainClasses.size()}</li>
            <li>Services: ${grailsApplication.serviceClasses.size()}</li>
            <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
        </ul>--}%
        <h1>Installed Plugins</h1>
        <ul>
            <li ng-repeat="plugin in idxCtrl.applicationData.plugins">{{plugin.name}} - {{plugin.version}}</li>
        </ul>
    </div>
    <div id="page-body" role="main">
        <h1>Welcome to Grails</h1>
        <p>Congratulations, you have successfully started your first Grails application! At the moment
        this is the default page, feel free to modify it to either redirect to a controller or display whatever
        content you may choose. Below is a list of controllers that are currently deployed in this application,
        click on each to execute its default action:</p>

        <div id="controller-list" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <li ng-repeat="c in idxCtrl.applicationData.controllers | orderBy:'fullName'" class="controller">
                    <a ng-href="{{idxCtrl.contextPath}}/{{c.logicalPropertyName}}">{{c.fullName}}</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="footer" role="contentinfo"></div>
    <asset:javascript src="angular/angular" />
    <script type="text/javascript">
        angular.module("index", [])
            .constant("contextPath", window.contextPath)
            .controller("IndexController", IndexController);

        IndexController.$inject = ["contextPath", "$http"];

        function IndexController(contextPath, $http) {
            var vm = this;

            vm.contextPath = contextPath;

            $http({method: "GET", url: contextPath + "/application/index"})
                .then(function(data) {
                    vm.applicationData = data;
                });
        }
    </script>
</body>
</html>