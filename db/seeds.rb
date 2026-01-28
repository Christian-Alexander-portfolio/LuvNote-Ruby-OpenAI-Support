SupportPage.delete_all

SupportPage.create!([
  {
    slug: "finding-events",
    title: "Finding events",
    summary: "How to browse events and fix 'no events showing'.",
    in_app_url: "https://app.luvnotedating.com/events",
    tags: "events,calendar,genres,distance",
    body_md: <<~MD
    ## Finding events

    1. Open the **Events** page.
    2. Select more **Genres**.
    3. Increase your **Distance** filter.
    4. Refresh the list.

    **If no events show:** try selecting 5+ genres and increasing distance (e.g. 50–100 miles).
    MD
  },
  {
    slug: "connect-spotify",
    title: "Connect Spotify",
    summary: "How to connect your Spotify account to LuvNote.",
    in_app_url: "https://app.luvnotedating.com/settings/music",
    tags: "spotify,connect,oauth,music",
    body_md: "## Connect Spotify\n\nGo to Settings → Music → Connect Spotify and follow the prompts."
  },
  {
    slug: "connect-apple-music",
    title: "Connect Apple Music",
    summary: "How to connect Apple Music to LuvNote.",
    in_app_url: "https://app.luvnotedating.com/settings/music",
    tags: "apple music,connect,music",
    body_md: "## Connect Apple Music\n\nGo to Settings → Music → Connect Apple Music and follow the prompts."
  }
])
