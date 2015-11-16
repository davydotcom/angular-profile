import grails.util.*
import org.codehaus.groovy.runtime.MetaClassHelper

description( "Creates an Angular domain" ) {
    usage "grails create-ng-domain [NAME]"
    argument name:'Domain Name', description:"The name of the Angular domain to create", required:true
    flag name:'force', description:"Whether to overwrite existing files"
}

def model = model(args[0])
boolean overwrite = flag('force')

final String basePath = "grails-app/assets/javascripts/${model.packagePath}"
if (!file(basePath).exists()) {
    createNgModule(args[0])
}

render template: template("NgDomain.groovy"),
       destination: file("${basePath}/domain/${model.className}.js"),
       model: model,
       overwrite: overwrite
