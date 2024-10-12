#!/usr/bin/fish

set -g currentDir (pwd)
echo $currentDir
function increment_version
    set ver (sed -n 's/^version: //p' pubspec.yaml)
    set major (echo $ver | cut -d '+' -f 1 | cut -d '.' -f 1)
    set minor (echo $ver | cut -d '+' -f 1 | cut -d '.' -f 2)
    set patch (echo $ver | cut -d '+' -f 1 | cut -d '.' -f 3)
    set build (echo $ver | cut -d '+' -f 2)


    switch $minor
        case 9
            set major (math $major + 1)
            set minor 0
            set patch 0
        case '*'
            set minor (  math $minor + 1)
    end

    switch $patch
        case 9
            set minor (math $minor + 1)
            set patch 0
        case '*'
            set patch (math $patch + 1)
    end

    set build (math $build + 1)
    echo "$major.$minor.$patch+$build"
end


function get_name
    set -l file "$currentDir/android/app/src/main/AndroidManifest.xml"
    set name (sed -n 's/android:label="\(.*\)"/\1/p' $file | string trim)
    echo $name
end

set -l new_version (increment_version)

echo "New version: $new_version"
set -l app_name (get_name)
echo "App name: $app_name"

# Update pubspec.yaml
sed -Ei "s/^version: (.*)/version: $new_version/" pubspec.yaml

# Build the app
flutter build apk --release

# Find the APK file
set -l apk_file "$currentDir/build/app/outputs/flutter-apk/app-release.apk"

if test -n "$apk_file"
    # Rename the APK file
    cp $apk_file "$app_name-v$new_version.apk"

    echo "APK renamed to $app_name-v$new_version.apk"
else
    echo "No APK file found"
end
