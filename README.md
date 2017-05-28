Copyright (C) 2016-2017 Apavayan Sinha <info@apavayan.com>

Copyright (C) 2017 Alexeev Alexander <alexax66@gmail.com>

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

## TWRP device tree for Galaxy A3 (2016 Exynos)

To get started with LineageOS sources to build TWRP, you'll need to get
familiar with [Git and Repo](http://source.android.com/download/using-repo).

To initialize your local repository using the LineageOS trees to build TWRP, use a command like this:

    repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_lineageos.git -b twrp-14.1

Add to `.repo/local_manifests/a3xeltexx.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <project path="device/samsung/a3xeltexx" name="alexax66/android_device_samsung_a3xeltexx" remote="github" revision="twrp" />
</manifest>
```

Then to sync up:

    repo sync

Then go to  `<source-dir>/bootable/recovery` and apply patch:

    git fetch https://gerrit.omnirom.org/android_bootable_recovery refs/changes/68/22768/1 && git cherry-pick FETCH_HEAD

Then to build:

     cd <source-dir>; . build/envsetup.sh; lunch lineage_a3xeltexx-userdebug; mka recoveryimage


Kernel sources are available at: https://github.com/alexax66/android_kernel_samsung_exynos7580-common/tree/cm-14.1

