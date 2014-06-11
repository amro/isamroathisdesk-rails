# isamroathisdesk

I hacked together a little Rails app for http://isamroathisdesk.heroku.com. I've done a few things wrong here, like auth, which basically involves a secret passed from the client. That secret should be an environment variable server side. That said, it's a decent proof of concept.

The index action in the Status controller just grabs the latest status and displays it. An iOS app handles updating status when a given iBeacon is detected. Leaving the beacon range works great. After 30 seconds or so, the status changes to unavailable. Entering beacon range works great if the app is in the foreground. If it's in the background, it could take up to 15-20 minutes before iOS wakes the app up to let it know it's entered the beacon range. `locationManager:didEnterRegion:` seems to be called when the device's radios wake up. This makes a lot of sense from a power-saving perspective. Also, it doesn't seem that iOS calls `locationManager:didRangeBeacons:inRegion:` when the app is in the background.

That's all there is to it.