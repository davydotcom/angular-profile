import grails.util.*
import org.codehaus.groovy.runtime.MetaClassHelper

description( "Creates an Angular service" ) {
    usage "grails create-ng-service [NAME]"
    argument name:'Service Name', description:"The name of the Angular controller to create", required:true
    flag name:'type', description:"The type of service to create. Possible values are service, factory, value, provider, and constant"
    flag name:'force', description:"Whether to overwrite existing files"
}

def model = model(args[0])
boolean overwrite = flag('force')

final String type = MetaClassHelper.capitalize(flag('type') ?: "factory")
String name = model.propertyName + type

if (["Constant", "Value"].contains(type)) {
    name = model.propertyName
}

final String basePath = "grails-app/assets/javascripts/${model.packagePath}"
if (!file(basePath).exists()) {
    createNgModule(args[0])
}

render template: template("services/Ng${type}.groovy"),
       destination: file("${basePath}/services/${name}.js"),
       model: [packageName: model.packageName, name: name],
       overwrite: overwrite
