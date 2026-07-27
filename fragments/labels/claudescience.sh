claudescience)
    name="Claude Science"
    type="dmg"
    if [[ $(arch) == "arm64" ]]; then
        downloadURL="https://downloads.claude.ai/claude-science/latest/mac-arm64.dmg"
    elif [[ $(arch) == "i386" ]]; then
        downloadURL="https://downloads.claude.ai/claude-science/latest/mac-x64.dmg"
    fi
    # "latest" ships dev builds (e.g. 0.1.15-dev.20260701.t220242.shaaa553de); appCustomVersion
    # strips the suffix so the installed version matches the manifest base version (e.g. 0.1.15).
    appNewVersion=$(getJSONValue "$(curl -fsL https://downloads.claude.ai/claude-science/latest/manifest.json)" "version")
    appCustomVersion(){ if [ -d "/Applications/Claude Science.app" ]; then /usr/bin/defaults read "/Applications/Claude Science.app/Contents/Info.plist" CFBundleShortVersionString | cut -d- -f1; fi }
    expectedTeamID="Q6L2SF6YDW"
    ;;
