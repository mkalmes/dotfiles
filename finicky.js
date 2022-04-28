module.exports = {
  defaultBrowser: "Safari",
  handlers: [
    {
      match: [
        "mail.google.com/*",
        "meet.google.com/*",
        "calendar.google.com/*"
      ],
      browser: "Google Chrome"
    }
  ]
};