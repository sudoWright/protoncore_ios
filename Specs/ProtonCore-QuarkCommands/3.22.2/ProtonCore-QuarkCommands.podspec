require_relative 'pods_configuration'

Pod::Spec.new do |s|
    
    s.name             = 'ProtonCore-QuarkCommands'
    s.version          = $version
    s.summary          = 'shared frameworks'
    
    s.description      = <<-DESC
    ios shared frameworks for all client apps
    DESC
    
    s.homepage         = $homepage
    s.license          = $license
    s.author           = $author
    s.source           = $source
    
    s.ios.deployment_target = $ios_deployment_target
    s.osx.deployment_target = $macos_deployment_target
    
    s.swift_versions = $swift_versions

    s.pod_target_xcconfig = { 'APPLICATION_EXTENSION_API_ONLY' => 'NO' }

    s.dependency 'ProtonCore-Doh', $version
    s.dependency 'ProtonCore-Log', $version

    make_subspec = ->(spec, networking) {
        spec.subspec "#{networking_subspec(networking)}" do |subspec|
            subspec.dependency "ProtonCore-Networking/#{networking_subspec(networking)}", $version
            subspec.dependency "ProtonCore-Services/#{networking_subspec(networking)}", $version
            subspec.source_files = "libraries/QuarkCommands/Sources/**.swift"
            subspec.test_spec 'Tests' do |test_spec|
                test_spec.dependency 'ProtonCore-TestingToolkit/UnitTests/Doh', $version
                test_spec.source_files = 'libraries/QuarkCommands/Tests/**/*.swift'
                test_spec.resource = 'libraries/QuarkCommands/Tests/Mocks/Resources/*'
            end
        end
    }

    no_default_subspecs(s)
    make_subspec.call(s, :alamofire)
    make_subspec.call(s, :afnetworking)
    
end
