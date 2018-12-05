platform :ios, '10.0'

def common_pods
    pod 'Moya'
end

target 'Github' do
    use_frameworks!(true)
    common_pods

    target 'GithubTests' do
        inherit! :search_paths
    end
end



post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', 'AF_APP_EXTENSIONS=1']
            config.build_settings['ENABLE_BITCODE'] = 'YES'
            #config.build_settings['OTHER_LDFLAGS'] ||= ['$(inherited)']
            config.build_settings['OTHER_LDFLAGS'] = '$(inherited) "-ObjC"'
            if config.name == 'Debug'
                config.build_settings['ENABLE_TESTABILITY'] = 'YES'
            end
        end
    end
end
