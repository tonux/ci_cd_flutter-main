git_url("https://github.com/khaled-ha/certifications.git")

storage_mode("git")

type("development") # The default type, can be: appstore, adhoc, enterprise or development
app_identifier(["test.app.dx",])

username("khaledhadjali1@gmail.com") # Your Apple Developer Portal username

ENV["MATCH_PASSWORD"] = "[test]" # Password for the .p12 files saved in git repo.

# app_identifier(["tools.fastlane.app", "tools.fastlane.app2"])
# username("user@fastlane.tools") # Your Apple Developer Portal username

# For all available options run `fastlane match --help`
# Remove the # in the beginning of the line to enable the other options

# The docs are available on https://docs.fastlane.tools/actions/match
