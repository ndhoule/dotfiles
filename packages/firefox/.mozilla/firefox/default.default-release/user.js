// Hide about:config warning
user_pref("browser.aboutConfig.showWarning", false);

// Set start page (0=blank, 1=home, 2=last visited page, 3=resume previous session)
user_pref("browser.startup.page", 3);

// Disable about:addons Recommendations pane (uses Google Analytics) ***/
user_pref("extensions.getAddons.showPane", false); // [HIDDEN PREF]

// Disable unused Firefox Sync features
user_pref("services.sync.engine.addresses", false);
user_pref("services.sync.engine.addresses.available", false);
user_pref("services.sync.engine.creditcards", false);
user_pref("services.sync.engine.passwords", false);

// Send Do Not Track header to websites
user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.introCount", 20);

// Turn off sending data servers when leaving pages
user_pref("beacon.enabled", false);

// Turn off telemetry related to opening new tabs
user_pref("browser.newtabpage.enhanced", false);

// Disable DNS-over-HTTPS (DoH) in favor of the OS's DNS resolver
user_pref("network.trr.mode", 5);

// Disable Pocket
user_pref("extensions.pocket.enabled", false);

// Enable HTTPS-only mode
user_pref("dom.security.https_only_mode", true);
