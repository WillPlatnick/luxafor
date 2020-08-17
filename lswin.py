#!/usr/bin/env python

import Quartz

windows = Quartz.CGWindowListCopyWindowInfo(Quartz.kCGWindowListExcludeDesktopElements|Quartz.kCGWindowListOptionOnScreenOnly,Quartz.kCGNullWindowID);

for window in windows:
    print(f"{window[Quartz.kCGWindowOwnerName]}: {window.get(Quartz.kCGWindowName, '<no name>')}")
