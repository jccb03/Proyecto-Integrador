package turismo

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class CfgInterceptorSpec extends Specification implements InterceptorUnitTest<CfgInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test cfg interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"cfg")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
