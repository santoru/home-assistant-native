# Home Assistant - Native iOS SwiftUI Application

### Screenshots
<p align="center">
<img width="30%" src="img/screenshot/1.png" />
<img width="30%" src="img/screenshot/2.png" />
<img width="30%" src="img/screenshot/3.png" />
</p>

## Description
The current [Home Assistant](https://github.com/home-assistant/iOS) iOS app provides the same experience of the Home Assistant web interface along with additional features such as the device tracking integration, notifications, actions etc.
Although the Home Assistant iOS app provides the fully customizable Lovelace UI, this is not a native interface on iOS and the overall experience feels like browsing a webpage rather than using a mobile application.
Apart from the personal feeling, the native SwiftUI application has several advantage over the original Home Assistant iOS app, for example:

- Faster loading time due to native rendering of SwiftUI components
- Better resource consumption
- Improved animation responsiveness

The goal of this application is not to implement 1:1 features parity with the original Home Assistant iOS app but to have a minimal, fast and native companion app to be used to quickly monitor the status of the Home and perform basic operations on the devices.

### Known issues
- The NavigationView Sections have a collapsable button, this should be deleted

### TODO List
- [ ] Implement API calls for Home Assistant
- [ ] Implement settings to allow people to configure the application
- [ ] Find better icons as the SF symbols kit is limited

### Palette
- https://coolors.co/bee9e8-62b6cb-1b4965-cae9ff-5fa8d3
