import grails.util.*

description( "Creates an Angular controller" ) {
    usage "grails create-ng-controller [NAME]"
    argument name:'Controller Name', description:"The name of the Angular controller to create", required:true
    flag name:'force', description:"Whether to overwrite existing files"
}

def model = model(args[0])
boolean overwrite = flag('force')

render template: template('grails-app/assets/javascripts/controllers/NgController.groovy'),
       destination: file("grails-app/assets/javascripts/${model.packagePath}/controllers/${model.simpleName}.js"),
       model: model,
       overwrite: overwrite
