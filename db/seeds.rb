# db/seeds.rb

puts "Seeding SupportPages..."

SupportPage.delete_all

pages = [
  # --------------------------------------------------------------------------
  # EVENTS
  # --------------------------------------------------------------------------
  {
    slug: "finding-events",
    title: "Finding events",
    summary: "Browse events near you and fix 'no events showing' issues.",
    in_app_url: "https://app.luvnotedating.com/calendar",
    tags: "events,calendar,shows,concerts,nearby,search,find,genres,distance,filters,none showing,empty list",
    body_md: <<~MD
    ## Finding events

    **Goal:** See concerts and events near you based on your genres and distance.

    ### Steps
    1. Open **Events / Calendar** in the app.
    2. Set a **Distance** range (start with 25–100 miles if you’re testing).
    3. Select **multiple Genres** (try 5+).
    4. Refresh the events list (pull-to-refresh or re-open the page).

    ### If no events show
    - Increase **Distance** (e.g. 50–200 miles)
    - Add more **Genres**
    - Ensure you are not filtering too narrowly (only 1 genre + 5 miles often returns nothing)
    - Try switching to a broader genre category (e.g. “Electronic” instead of a niche subgenre)

    ### Common questions
    - “Why is the list empty?” → Your filters are too strict (genres + distance).
    - “Events don’t load” → refresh, check internet, and retry later.

    If you still can’t find any events, try the **Expand event filters** guide.
    MD
  },
  {
    slug: "expand-event-filters",
    title: "Expand event filters (genres + distance)",
    summary: "How to broaden your search so events appear.",
    in_app_url: "https://app.luvnotedating.com/calendar",
    tags: "events,filters,expand,broaden,genres,distance,miles,empty,no events",
    body_md: <<~MD
    ## Expand event filters

    If your events list is empty, the fastest fix is to broaden your filters:

    1. Open the **Events** page.
    2. Increase **Distance**:
       - Testing: 50–200 miles
       - Real usage: whatever makes sense for you
    3. Increase **Genres** selected:
       - Select at least 5 genres.
       - Include a few broader genres.

    **Tip:** If you pick only 1 niche genre and 5 miles, it’s normal to see 0 results.
    MD
  },
  {
    slug: "event-details",
    title: "Viewing event details",
    summary: "How to open an event and see its details and actions.",
    in_app_url: "https://app.luvnotedating.com/calendar",
    tags: "event details,open event,details,calendar,venue,time,info",
    body_md: <<~MD
    ## Viewing event details

    1. Go to **Events**.
    2. Tap an event card to open details.
    3. Review:
       - Venue, date/time, location
       - Genres / tags (if shown)
       - Actions like **Harmonize** or invite options (depending on the event)

    If tapping the event does nothing, refresh the list and try again.
    MD
  },

  # --------------------------------------------------------------------------
  # HARMONIES (MATCHES)
  # --------------------------------------------------------------------------
  {
    slug: "finding-harmonies",
    title: "Finding Harmonies (matches)",
    summary: "How to find Harmonies and improve match results.",
    in_app_url: "https://app.luvnotedating.com/home",
    tags: "harmonies,matches,find,discover,people,compatible,shared taste,genre matches,near me",
    body_md: <<~MD
    ## Finding Harmonies

    **Goal:** Find people with shared musical culture / taste.

    ### Steps
    1. Open the **Harmonies** page.
    2. Make sure your **Genres** are set (see “Change genre preferences”).
    3. Browse Harmonies and open profiles to see shared taste.

    ### If you don’t see many Harmonies
    - Add more genres (5+)
    - Expand distance (if applicable)
    - Connect Spotify/Apple Music to improve music-based matching

    If you’re trying to find people for a **specific event**, use the “Harmonies for a specific event” guide.
    MD
  },
  {
    slug: "harmonies-for-specific-event",
    title: "Finding Harmonies for a specific event",
    summary: "How to find and connect with people going to the same event.",
    in_app_url: "https://app.luvnotedating.com/calendar",
    tags: "harmonies for event,event harmonies,going to event,attendees,meet people at event,match for event",
    body_md: <<~MD
    ## Harmonies for a specific event

    **Goal:** Find people who are also interested in / going to the event.

    ### Steps
    1. Open **Events**.
    2. Tap the event to open the event details.
    3. Look for an option like **Harmonize** or “Find Harmonies” (depending on the UI).
    4. Browse Harmonies tied to that event and open profiles.

    ### Tip
    If you can’t find the event, broaden genres + distance first.
    MD
  },

  # --------------------------------------------------------------------------
  # INVITES / HARMONIZE BUTTON
  # --------------------------------------------------------------------------
  {
    slug: "invite-harmony-to-event",
    title: "Inviting a Harmony to an event",
    summary: "How to invite your Harmonies to an event and confirm it sent.",
    in_app_url: "https://app.luvnotedating.com/calendar",
    tags: "invite,inviting,invite harmony,event invite,harmonize button,send invite",
    body_md: <<~MD
    ## Inviting a Harmony to an event

    **Goal:** Invite a Harmony to a specific event.

    ### Steps
    1. Go to **Events** and open the event details.
    2. Tap **Harmonize** (or Invite).
    3. Select the Harmony you want to invite.
    4. Confirm the invite.

    ### If you don’t see the Harmonize button
    - Make sure you are viewing the event details page (not just the list)
    - Try refreshing the events page
    - Ensure you’re logged in

    If inviting fails, check your internet connection and try again.
    MD
  },
  {
    slug: "harmonize-button",
    title: "Using the Harmonize button",
    summary: "What Harmonize does and how to use it.",
    in_app_url: "https://app.luvnotedating.com/calendar",
    tags: "harmonize,button,what is harmonize,invite,connect,event",
    body_md: <<~MD
    ## Using the Harmonize button

    **Harmonize** helps you connect with Harmonies around an event.

    ### Common uses
    - Invite a Harmony to attend an event
    - Find people with compatible music taste for an event

    ### How to use it
    1. Open an event’s detail page.
    2. Tap **Harmonize**.
    3. Follow the prompts to invite or connect.

    If you can’t find it, refresh the event page and try again.
    MD
  },

  # --------------------------------------------------------------------------
  # MUSIC CONNECTIONS
  # --------------------------------------------------------------------------
  {
    slug: "connect-spotify",
    title: "Connect Spotify",
    summary: "Link your Spotify account to use music matching and playlist features.",
    in_app_url: "https://app.luvnotedating.com/my-music",
    tags: "spotify,connect,link,oauth,login,authorize,permissions,music provider",
    body_md: <<~MD
    ## Connect Spotify

    **Goal:** Link Spotify so LuvNote can use your library for matching and playlist generation.

    ### Steps
    1. Go to **Settings** → **Music**.
    2. Tap **Connect Spotify**.
    3. Log in to Spotify (if prompted).
    4. Approve permissions.
    5. Return to LuvNote and confirm it shows “Connected”.

    ### If Spotify won’t connect
    - Make sure you are using an updated browser / in-app flow
    - Try logging out and back in
    - Try again on a different network (sometimes strict networks block redirects)
    MD
  },
  {
    slug: "connect-apple-music",
    title: "Connect Apple Music",
    summary: "Link Apple Music to enable matching and playlist features.",
    in_app_url: "https://app.luvnotedating.com/my-music",
    tags: "apple music,connect,link,authorize,music provider,ios",
    body_md: <<~MD
    ## Connect Apple Music

    **Goal:** Link Apple Music so LuvNote can use your library for matching and playlist generation.

    ### Steps
    1. Go to **Settings** → **Music**.
    2. Tap **Connect Apple Music**.
    3. Follow the prompts to authorize access.
    4. Confirm it shows “Connected”.

    ### If Apple Music won’t connect
    - Ensure you are signed in to Apple Music on the device
    - Retry the authorization flow
    - Check that you have an active Apple Music subscription (if required)
    MD
  },
  {
    slug: "disconnect-music",
    title: "Disconnect Spotify or Apple Music",
    summary: "How to unlink your music provider and reconnect.",
    in_app_url: "https://app.luvnotedating.com/my-music",
    tags: "disconnect,unlink,remove spotify,remove apple music,reconnect",
    body_md: <<~MD
    ## Disconnect a music provider

    ### Steps
    1. Go to **Settings** → **Music**.
    2. Find your connected provider (Spotify / Apple Music).
    3. Tap **Disconnect** (or Remove).
    4. If needed, reconnect using the connect guides.

    If reconnecting doesn’t work, try restarting the app/browser.
    MD
  },

  # --------------------------------------------------------------------------
  # PLAYLIST GENERATION
  # --------------------------------------------------------------------------
  {
    slug: "generate-playlist",
    title: "Generate a collaborative playlist",
    summary: "How to generate playlists from both users’ libraries based on selected genres.",
    in_app_url: "https://app.luvnotedating.com/my-playlists",
    tags: "playlist,generate,collaborative,shared playlist,spotify playlist,apple playlist,genres,create playlist",
    body_md: <<~MD
    ## Generate a collaborative playlist

    **Goal:** Build a playlist using music from both people, filtered by selected genres.

    ### Requirements
    - At least one music provider connected (Spotify or Apple Music)
    - You have a Harmony (match)

    ### Steps
    1. Go to **Playlists** (or the playlist generator feature).
    2. Select your Harmony (if prompted).
    3. Choose one or more **Genres** to shape the playlist.
    4. Tap **Generate**.
    5. Wait for generation to complete and open the playlist.

    ### If generation is slow or fails
    - Try fewer genres
    - Retry the generation
    - Confirm your music provider is still connected
    MD
  },
  {
    slug: "playlist-not-showing",
    title: "Playlist not showing / stuck generating",
    summary: "Troubleshooting playlist generation issues.",
    in_app_url: "https://app.luvnotedating.com/my-playlists",
    tags: "playlist not showing,stuck,loading,generate failed,timeout,retry",
    body_md: <<~MD
    ## Playlist not showing / stuck generating

    ### Try this
    1. Refresh the playlists page.
    2. Try again with fewer genres.
    3. Confirm Spotify/Apple Music is still connected.
    4. Log out and back in if needed.

    If it continues, it may be a temporary service issue — retry later.
    MD
  },

  # --------------------------------------------------------------------------
  # GENRE PREFERENCES
  # --------------------------------------------------------------------------
  {
    slug: "change-genre-preferences",
    title: "Change your genre preferences",
    summary: "Update genres to improve both event discovery and Harmony matching.",
    in_app_url: "https://app.luvnotedating.com/profile/genres",
    tags: "genres,preferences,change genres,update genres,filters,music taste,interests",
    body_md: <<~MD
    ## Change your genre preferences

    Your genres affect:
    - Which events you see
    - Which Harmonies you match with
    - Playlist generation filters

    ### Steps
    1. Open **Settings**.
    2. Find **Genres** (or Music Preferences).
    3. Add or remove genres.
    4. Save changes.
    5. Go back to Events/Harmonies and refresh.

    **Tip:** Selecting more genres usually increases results.
    MD
  },

  # --------------------------------------------------------------------------
  # MESSAGING
  # --------------------------------------------------------------------------
  {
    slug: "messaging",
    title: "Messaging a Harmony",
    summary: "How to message, find your inbox, and troubleshoot missing messages.",
    in_app_url: "https://app.luvnotedating.com/messages",
    tags: "messages,messaging,chat,inbox,dm,send message,reply,conversation",
    body_md: <<~MD
    ## Messaging

    ### Send a message
    1. Open a Harmony’s profile.
    2. Tap **Message** (or Chat).
    3. Type your message and send.

    ### Find your inbox
    1. Go to **Messages**.
    2. Select a conversation to continue chatting.

    ### If messages are missing
    - Refresh the messages page
    - Confirm you’re logged in to the correct account
    - Try again later if service is temporarily delayed
    MD
  },
  {
    slug: "notifications",
    title: "Notifications for messages and invites",
    summary: "How notifications work and what to check if you’re not seeing them.",
    in_app_url: "https://app.luvnotedating.com/profile/settings",
    tags: "notifications,banner,push,message notifications,invite notifications,not getting notifications",
    body_md: <<~MD
    ## Notifications

    ### If you’re not seeing notifications
    1. Check **app notification settings** inside LuvNote (if available).
    2. Check your **device notification settings**:
       - Android: Settings → Apps → LuvNote → Notifications
       - iOS: Settings → Notifications → LuvNote
    3. Make sure “Do Not Disturb” is off.

    If you only see notifications inside the app, confirm OS-level notifications are enabled.
    MD
  },

  # --------------------------------------------------------------------------
  # PURCHASES / SUBSCRIPTIONS
  # --------------------------------------------------------------------------
  {
    slug: "purchases-and-subscriptions",
    title: "Purchases and subscriptions",
    summary: "How premium/subscriptions work and how to restore purchases.",
    in_app_url: "https://app.luvnotedating.com/shop",
    tags: "purchases,subscription,premium,backstage pass,restore,restore purchases,receipt,upgrade",
    body_md: <<~MD
    ## Purchases and subscriptions

    ### Manage your subscription
    - Subscriptions are managed through your platform store:
      - Android: Google Play
      - iOS: Apple App Store

    ### Restore purchases (if available)
    1. Go to **Premium** in the app.
    2. Tap **Restore Purchases** (if shown).
    3. Wait for confirmation.

    ### If premium doesn’t unlock
    - Ensure you’re logged into the same Apple/Google account used to purchase
    - Try restoring purchases
    - Restart the app and try again
    MD
  },
  {
    slug: "restore-purchases",
    title: "Restore purchases",
    summary: "What to do when you already paid but features aren’t enabled.",
    in_app_url: "https://app.luvnotedating.com/premium",
    tags: "restore purchases,already paid,premium missing,subscription not active,receipt",
    body_md: <<~MD
    ## Restore purchases

    If you paid but premium isn’t enabled:

    1. Open **Premium** in the app.
    2. Tap **Restore Purchases** (if available).
    3. Confirm you are on the same Apple/Google account used to purchase.
    4. Restart the app and check again.

    If it still doesn’t work, it may take a few minutes to sync — retry shortly.
    MD
  },

  # --------------------------------------------------------------------------
  # ACCOUNT / LOGIN BASIC
  # --------------------------------------------------------------------------
  {
    slug: "login-and-account",
    title: "Logging in and managing your account",
    summary: "Basic account access, login, and troubleshooting.",
    in_app_url: "https://app.luvnotedating.com/login",
    tags: "login,sign in,account,password,email,reset password,cant log in",
    body_md: <<~MD
    ## Logging in and account help

    ### Login
    1. Go to the login screen.
    2. Enter email + password.
    3. Tap **Sign In**.

    ### If you can’t log in
    - Check for typos in email/password
    - Try resetting your password (if available)
    - Make sure you’re on the correct environment/app

    If your account is locked out, try again later.
    MD
  },

  # --------------------------------------------------------------------------
  # TROUBLESHOOTING / GENERAL
  # --------------------------------------------------------------------------
  {
    slug: "app-not-loading",
    title: "App not loading / white screen",
    summary: "Basic troubleshooting if the app page won’t load properly.",
    in_app_url: "https://app.luvnotedating.com",
    tags: "app not loading,white screen,stuck,loading,refresh,cache,browser",
    body_md: <<~MD
    ## App not loading / white screen

    Try these fixes:
    1. Refresh the page (Ctrl+R)
    2. Hard refresh (Ctrl+Shift+R)
    3. Clear site cache/cookies for LuvNote
    4. Try a different browser (Chrome recommended)
    5. Disable browser extensions temporarily

    If you’re on mobile, try switching between Wi-Fi and cellular.
    MD
  },
  {
    slug: "report-a-bug",
    title: "Report a bug or send feedback",
    summary: "How to send feedback when something isn’t working.",
    in_app_url: "https://app.luvnotedating.com/profile/settings",
    tags: "bug,report,feedback,issue,not working,error",
    body_md: <<~MD
    ## Report a bug / feedback

    When reporting an issue, include:
    - What you were trying to do
    - What happened
    - Your device (Android/iOS/Web)
    - Screenshot if possible

    If you can reproduce it, include the steps.
    MD
  }
]

SupportPage.create!(pages)

puts "Seeded #{SupportPage.count} SupportPages ✅"
