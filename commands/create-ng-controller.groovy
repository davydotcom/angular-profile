import grails.util.*

description( "Creates an Angular controller" ) {
    usage "grails create-ng-controller [NAME]"
    argument name:'Controller Name', description:"The name of the Angular controller to create", required:true
    flag name:'force', description:"Whether to overwrite existing files"
}

def model = model(args[0])
boolean overwrite = flag('force')

String type = "Controller"

render template: template('NgController.groovy'),
       destination: file("grails-app/assets/javascripts/${model.packagePath}/controllers/${model.propertyName}${type}.js"),
       model: [packageName: model.packageName, name: model.convention(type)],
       overwrite: overwrite
