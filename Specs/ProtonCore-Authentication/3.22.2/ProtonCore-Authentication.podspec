require_relative 'pods_configuration'

Pod::Spec.new do |s|
    
    s.name             = 'ProtonCore-Authentication'
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

    make_subspec = ->(spec, crypto, networking) {
        spec.subspec "#{crypto_and_networking_subspec(crypto, networking)}" do |subspec|
            subspec.dependency "#{crypto_module(crypto)}", $version
            subspec.dependency "ProtonCore-APIClient/#{networking_subspec(networking)}", $version
            subspec.dependency "ProtonCore-Services/#{networking_subspec(networking)}", $version
            subspec.source_files = "libraries/Authentication/Sources/*.swift", "libraries/Authentication/Sources/**/*.swift"
            
            subspec.test_spec 'Tests' do |test_spec|
                test_spec.source_files = "libraries/Authentication/Tests/**/*.swift"
                test_spec.dependency "ProtonCore-TestingToolkit/UnitTests/Authentication/#{crypto_and_networking_subspec(crypto, networking)}", $version
                test_spec.dependency "OHHTTPStubs/Swift"
            end
        end
    }

    no_default_subspecs(s)
    make_subspec.call(s, :crypto, :alamofire)
    make_subspec.call(s, :crypto, :afnetworking)
    make_subspec.call(s, :crypto_vpn, :alamofire)
    make_subspec.call(s, :crypto_vpn, :afnetworking)
        
end
