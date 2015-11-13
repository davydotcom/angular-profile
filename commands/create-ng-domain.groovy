import grails.util.*
import org.codehaus.groovy.runtime.MetaClassHelper

description( "Creates an Angular domain" ) {
    usage "grails create-ng-domain [NAME]"
    argument name:'Domain Name', description:"The name of the Angular domain to create", required:true
    flag name:'force', description:"Whether to overwrite existing files"
}

def model = model(args[0])
boolean overwrite = flag('force')

render template: template("NgDomain.groovy"),
       destination: file("grails-app/assets/javascripts/${model.packagePath}/domain/${model.className}.js"),
       model: model,
       overwrite: overwrite
