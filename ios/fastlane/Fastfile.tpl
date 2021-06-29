default_platform(:ios)

DEVELOPER_APP_ID = ENV["DEVELOPER_APP_ID"]
DEVELOPER_APP_IDENTIFIER = ENV["DEVELOPER_APP_IDENTIFIER"]
PROVISIONING_PROFILE_SPECIFIER = ENV["PROVISIONING_PROFILE_SPECIFIER"]
TEMP_KEYCHAIN_USER = ENV["TEMP_KEYCHAIN_USER"]
TEMP_KEYCHAIN_PASSWORD = ENV["TEMP_KEYCHAIN_PASSWORD"]

def delete_temp_keychain(name)
  delete_keychain(
    name: name
  ) if File.exist? File.expand_path("~/Library/Keychains/#{name}-db")
end

def create_temp_keychain(name, password)
  create_keychain(
    name: name,
    password: password,
    unlock: false,
    timeout: false
  )
end

def ensure_temp_keychain(name, password)
  delete_temp_keychain(name)
  create_temp_keychain(name, password)
end

platform :ios do
  lane :closed_beta do
    # keychain_name = TEMP_KEYCHAIN_USER
    # keychain_password = TEMP_KEYCHAIN_PASSWORD
    # ensure_temp_keychain(keychain_name, keychain_password)
    create_keychain(
        name: ENV['TEMP_KEYCHAIN_USER'],
        password: ENV["TEMP_KEYCHAIN_PASSWORD"],
        default_keychain: true,
        unlock: true,
        timeout: 3600,
        lock_when_sleeps: false
      )

    match(
      type: 'development',
      app_identifier: "#{DEVELOPER_APP_IDENTIFIER}",
      git_basic_authorization: Base64.strict_encode64(ENV["GIT_AUTHORIZATION"]),
      readonly: true,
      keychain_name: ENV['MATCH_KEYCHAIN_NAME'],
      keychain_password: ENV["MATCH_KEYCHAIN_PASSWORD"], 
    )

    gym(
      configuration: "Release",
      workspace: "Runner.xcworkspace",
      scheme: "Runner",
      export_method: "app-store",
      export_options: {
        provisioningProfiles: { 
            DEVELOPER_APP_ID => PROVISIONING_PROFILE_SPECIFIER
        }
      }
    )

    pilot(
      apple_id: "#{DEVELOPER_APP_ID}",
      app_identifier: "#{DEVELOPER_APP_IDENTIFIER}",
      skip_waiting_for_build_processing: true,
      skip_submission: true,
      distribute_external: false,
      notify_external_testers: false,
      ipa: "./Runner.ipa"
    )

    # delete_temp_keychain(keychain_name)
  end
end