import AppKit
from AppKit import NSWorkspace, NSApplication
import Quartz
import time

def app_event_listener():
    workspace = NSWorkspace.sharedWorkspace()
    running_apps = {}

    while True:
        active_app = workspace.frontmostApplication()
        app_name = active_app.localizedName()

        # Check if the app has no windows open
        if app_name not in running_apps:
            running_apps[app_name] = active_app

        app_windows = Quartz.CGWindowListCopyWindowInfo(
            Quartz.kCGWindowListOptionOnScreenOnly,
            Quartz.kCGNullWindowID,
        )

        # Filter windows belonging to the active app
        app_windows = [
            w for w in app_windows
            if w.get("kCGWindowOwnerName") == app_name
        ]

        if not app_windows:
            print(f"Quitting app: {app_name}")
            NSApplication.sharedApplication().terminate()
        
        time.sleep(1)  # Check every second

if __name__ == "__main__":
    app_event_listener()