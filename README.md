# Frameloft by Light and Alley

**A lightweight, open-source photo browser and digital asset manager for macOS, Windows and Linux.**

> **Frameloft (formerly Lumio).** Lumio was renamed Frameloft after version 2.0.0. If you have Lumio installed, it updates to Frameloft as usual and keeps your catalogue, settings and keys; see [Updating from Lumio](docs/updates.md#updating-from-lumio).

Frameloft is for photographers who want something simple: browse folders of photos on your computer, external drives and network drives, rate and tag them, group them, put them on a map, and find them again, without importing them into a heavy catalogue or editing suite. Frameloft doesn't edit pixels. It hands photos to the editor you already use and picks up the result when you save.

[![Watch the Frameloft video on YouTube (1.5 minutes)](docs/promo-video.jpg)](https://youtu.be/QQ-7Alhn4x4)

▶ **[Watch Frameloft in action on YouTube](https://youtu.be/QQ-7Alhn4x4)** (about a minute and a half).

## Download

| System | Installer |
|---|---|
| **macOS** (Apple Silicon: M1 and later) | [Frameloft-macOS-AppleSilicon.dmg](https://github.com/frameloft/Frameloft/releases/latest/download/Frameloft-macOS-AppleSilicon.dmg) |
| **macOS** (Intel) | [Frameloft-macOS-Intel.dmg](https://github.com/frameloft/Frameloft/releases/latest/download/Frameloft-macOS-Intel.dmg) |
| **Windows** 10 or 11 | [Frameloft-Windows-x64-setup.exe](https://github.com/frameloft/Frameloft/releases/latest/download/Frameloft-Windows-x64-setup.exe) (or the [.msi](https://github.com/frameloft/Frameloft/releases/latest/download/Frameloft-Windows-x64.msi)) |
| **Linux** | [AppImage](https://github.com/frameloft/Frameloft/releases/latest/download/Frameloft-Linux-x86_64.AppImage) · [.deb](https://github.com/frameloft/Frameloft/releases/latest/download/Frameloft-Linux-amd64.deb) (Ubuntu, Debian) · [.rpm](https://github.com/frameloft/Frameloft/releases/latest/download/Frameloft-Linux-x86_64.rpm) (Fedora) |

These links always fetch the newest version. Checksums: [SHA256SUMS.txt](https://github.com/frameloft/Frameloft/releases/latest/download/SHA256SUMS.txt). What changed: [CHANGELOG.md](CHANGELOG.md). Installing and first-launch warnings: [Installing](#installing).

![Frameloft](docs/screenshot.png)

**New to Frameloft?** Read the [user guide](docs/user-guide.md): installing, adding your photos, shortcuts and troubleshooting, in about ten minutes.

## Why I built Frameloft

I wanted a simple way to organise a large photo library, and the tools I tried didn't suit me.

Adobe Bridge is free, but I didn't want to install Creative Cloud, create an Adobe account and sign in just to browse my own photos. digiKam is an excellent program, but it crashed often for me, and indexing my library of more than 55,000 photos on a network drive took days.

So I built something lightweight that does one job well: organising your library. Add folders from your computer, external drives or network drives, move photos in bulk between them, build a folder structure, rate photos and group shots of the same subject.

Frameloft is open source. You can use it, change it and share it. It has no account, no advertisements and no tracking. Nothing leaves your computer unless you use the map (which loads OpenStreetMap tiles) or switch on the AI photo finder. The one exception is the update check: about twice a day Frameloft asks GitHub whether a newer version is out, sending nothing about you or your photos (switch it off in Settings → General).

## Features

| | |
|---|---|
| **Menu bar** | Every command has a place in the menu bar (File, Edit, View, Photo, Window and Help; the menu at the top of the screen on a Mac, inside the window on Windows and Linux), with its shortcut beside it, so nothing is hidden behind right-click. **Help → Keyboard Shortcuts** (`⌘/` / `Ctrl+/`) lists every key. |
| **Updates** | Frameloft tells you when a new version is out, shows what's new, and (for releases signed with the updater key) installs it and restarts with one click. **Frameloft → Check for Updates…** (Help menu on Windows and Linux) checks straight away ([details](docs/updates.md)). |
| **Browse** | Fast thumbnail grid for very large folders, a folder tree, smart views (recently added, rated, on the map, without location), search by name, keyword, caption, place, camera or lens, and filters for rating and colour label. |
| **Views** | Thumbnail grid, a sortable list, and a filmstrip view with one large photo above a strip of thumbnails (`G`, `L`, `F` keys). |
| **Layout** | Drag the edge of the folder sidebar to make it narrower or wider (double-click the edge for the standard width); Frameloft remembers it. Hide the info panel on the right with the small tab on its edge, the Info button or `I`, to give the photos the whole window, and bring it back the same way. |
| **Histogram** | At the top of the info panel, switch between the photo and its histogram: red, green and blue levels with a brightness line, plus a warning when shadows are pure black or highlights are clipped. It's counted from the preview Frameloft keeps, so it's instant and works with the drive unplugged. |
| **Tabs** | Open folders in tabs inside the app (`⌘T` / `Ctrl+T`) and drag photos from one tab to another to move them. |
| **Offline previews** | Frameloft keeps a small catalogue, thumbnails and (for external, network and cloud drives) a sharp 1600 px preview of every photo on your computer, so folders on unplugged drives can still be browsed and viewed large, and the large view looks crisp before the original has loaded. Choose normal (1600 px) or high quality (2560 px, sharp full screen), or turn it off, in Settings > General. |
| **Move while offline** | Move photos to or from a drive that isn't connected: they show in their new folder straight away, and the files follow when the drive is back (Frameloft checks every minute). Nothing is overwritten; a clash gets a name like "IMG_0001 (2).jpg". See or cancel waiting moves from the status bar. |
| **Viewer** | Full-screen viewer with zoom and pan and a **black / grey / light grey / white** background switch (press `B`). |
| **Video preview** | Videos show up next to your photos with their length on the thumbnail. Open one to play it with a simple player: play/pause (`Space` or `K`), back and forward 10 seconds (`J` / `L`), a position bar, and volume (`M` mutes). It uses the video support already built into your system, so it adds nothing to the download. See [docs/video.md](docs/video.md) for which formats play where. |
| **Ratings, labels & keywords** | 0–5 stars (`0`–`5` keys), colour labels (`6` red, `7` yellow, `8` green, `9` blue; purple from the menu) and keywords, with suggestions from keywords you already use. Keyword hierarchies such as `Places > France > Paris` are saved the way Lightroom keeps them. Everything is standard XMP, so Lightroom, Bridge, Capture One, digiKam and darktable see the same stars, labels and keywords, and changes made there show up in Frameloft ([details](docs/metadata.md)). |
| **Rotate & flip** | Rotate left or right (`⌘[` / `⌘]`, `Ctrl+[` / `Ctrl+]`) and flip horizontally or vertically, from the right-click menu, the filmstrip or the viewer. Lossless: only the orientation tag changes (in an XMP sidecar for RAW files), so the image itself is never re-saved. |
| **Groups (stacks)** | Select shots of the same subject and press `⌘G` / `Ctrl+G` to group them. A closed group shows one cover photo with a count; click the count or press `S` to open it. Make any shot the cover, take shots out, or ungroup with `⇧⌘G` / `Ctrl+Shift+G`. Groups move together. They're kept in Frameloft's catalogue, not written into the files. |
| **Metadata editing** | Title, caption, keywords, creator and copyright, for one photo or many at once. Saved into the file (EXIF/IPTC/XMP) or, for RAW files, into an XMP sidecar by default. If you'd rather Frameloft never touched an original, Settings can send every edit to sidecars. |
| **Geotagging** | Map view (OpenStreetMap). Drag photos onto the map, or select photos and click a spot. Place search, clustering, and GPS written into the files. |
| **File management** | Drag photos or folders onto a folder to move them (hold `Alt`/`⌥` to copy), or use Move to… / Copy to… for any destination, including other drives and network shares. Cross-drive moves are copied and checked byte for byte before the original is removed. Nothing is ever overwritten, sidecars included: a clash gets a name like "IMG_0001 (2).jpg". New folder, rename, and Move to Trash (sidecars travel with their photos; a sidecar a RAW and its JPEG share stays with the one left behind). |
| **Undo history** | Every move, copy, rename and new folder goes into an edit history (the clock button in the toolbar), kept between sessions. `⌘Z` / `Ctrl+Z` undoes the latest change; undo any older one and the changes after it are undone first, newest first. Undo never overwrites a file and leaves alone anything you've changed since. Photos sent to the Trash are listed too, and come back from the system Trash. |
| **Renaming** | Press `F2` (or right-click, Rename…) to rename a photo. Select several to rename them in one go, either from a pattern such as `{date} Iceland {n}` (date taken, time, number, folder, camera, title, current name) or by finding and replacing text, with a live preview before anything changes. RAW + JPEG pairs keep matching names, ratings, labels, metadata and groups stay with each photo, XMP sidecars are renamed too, and Undo puts the old names back. |
| **Smart collections** | Saved searches that keep themselves up to date, such as "5 stars from 2024", "Canon RAW files without keywords" or "portraits taken in December". Click **+** next to Smart collections in the sidebar, pick rules (rating, date taken, colour label, keyword, folder, camera, lens, file type, location, shape, ISO, focal length, aperture and more), match all or any of them, and see the count as you go. Nothing is copied: photos join and leave as you rate, label, add and move them. ([details](docs/smart-collections.md)) |
| **Duplicate finder** | **Find duplicates…** in the sidebar (or right-click a folder) finds exact copies (same contents, any name) and look-alikes (the same picture resized, re-saved or exported). Each group shows a suggested photo to keep; you tick what goes, at least one photo always stays, and ticked photos go to the Trash so they can be restored. Nothing is ever removed on its own. ([details](docs/duplicates.md)) |
| **Open with…** | Right-click a photo to see every app the operating system says can open it (Photoshop, Affinity, GIMP, Preview, Photos…). |
| **Share** | Right-click (or use the Share button) to send photos through the system share menu (AirDrop, Messages, Mail on a Mac; Windows share), by email with the photos attached, through WhatsApp or WhatsApp Web, or to Facebook, Instagram, X, Bluesky, Pinterest, Flickr and others in your browser. Frameloft never signs in to these services. RAW and HEIC photos are sent as JPEG copies, and you can choose smaller copies that leave out the location. |
| **Picks up edits** | Frameloft watches your library folders. When an editor saves or exports a file there, the thumbnail and metadata refresh and new files appear automatically. |
| **SmugMug upload** | Right-click photos and choose **Upload to SmugMug…**. Pick one of your galleries or make a new one (public, unlisted or private), choose originals or smaller copies, and watch the progress. Titles, captions and keywords go along. RAW and TIFF files are sent as full-size JPEGs. You sign in once; it needs a free SmugMug API key, which the window walks you through ([details](docs/smugmug.md)). |
| **Web-ready copies** | **Export web-ready copies…** saves upright, resized JPEGs (2500 px by default, Squarespace's recommended size) into a folder of your choice, with captions and copyright kept and the GPS location removed if you like. Your originals are not changed. |
| **AI photo finder** | "Show me sunsets from last summer rated 4 stars or more." Ask in plain language and the assistant searches the catalogue (dates, places, keywords, ratings, cameras) and can look at thumbnails for visual questions. Works with **Claude** (your own Anthropic API key) or a **local model** through Ollama / LM Studio, so nothing leaves your computer. |

Supported formats: JPEG, PNG, WebP, GIF, BMP, TIFF, HEIC/HEIF, AVIF, and RAW (DNG, CR2, CR3, NEF, ARW, RAF, ORF, RW2, PEF, SRW and more).
Videos: MP4, MOV, M4V and WebM play on every system; MKV, AVI, MTS, MPG, WMV and others are listed and can be opened in your video player, and play inside Frameloft where the system supports them ([details](docs/video.md)).

## Installing

Download the installer for your system from the [Download](#download) table above, or from the [**Releases** page](https://github.com/frameloft/Frameloft/releases/latest):

- **macOS**: `Frameloft-macOS-AppleSilicon.dmg` (M1 and later) or `Frameloft-macOS-Intel.dmg`. Open the .dmg and drag Frameloft to Applications.
- **Windows 10 or 11**: `Frameloft-Windows-x64-setup.exe` or `.msi`.
- **Linux**: `.AppImage` (any distro), `.deb` (Ubuntu/Debian) or `.rpm` (Fedora).

To check a download, compare its SHA-256 with `SHA256SUMS.txt` on the release page. Each installer also carries a GitHub build attestation: `gh attestation verify <file> --repo frameloft/Frameloft` shows it was built by Frameloft's release workflow from this repository.

If a build isn't code-signed, the first launch shows a warning (release notes say whether a build is signed):

- **macOS**: open Frameloft from Applications. When macOS says it can't verify the app, click **Done**, go to **System Settings → Privacy & Security**, scroll down and click **Open Anyway** next to Frameloft, then confirm. This is needed once. (On macOS 14 and earlier, right-clicking Frameloft and choosing **Open** also works.) Frameloft 2.1.0 and earlier weren't signed at all, so macOS called them "damaged"; for those, run `xattr -cr /Applications/Frameloft.app` in Terminal once.
- **Windows**: on the SmartScreen prompt, click **More info**, then **Run anyway**.

## Using the AI finder

Open **Settings → AI assistant**:

- **Claude**: paste an API key from [console.anthropic.com](https://console.anthropic.com). It's stored in your system keychain. Usage is billed by Anthropic; a search typically costs a fraction of a cent at the default "low" effort.
- **Local model**: install [Ollama](https://ollama.com), run `ollama pull llama3.1`, and choose "Local or OpenAI-compatible model" (default address `http://localhost:11434/v1`).

By default the assistant sees only catalogue text: file and folder names, dates, places, keywords, captions and camera details. It sees small thumbnails only when you leave "Let the assistant look at thumbnails" switched on.

## Where Frameloft keeps its data

Your photos are never moved or changed unless you ask. Frameloft's own catalogue (`catalogue.sqlite`) and thumbnails live in:

- macOS: `~/Library/Application Support/app.lumio.photos/`
- Windows: `%APPDATA%\app.lumio.photos\`
- Linux: `~/.local/share/app.lumio.photos/`

The folder keeps its name from when Frameloft was called Lumio, so existing libraries carry on after the update.

If a network or cloud drive (SMB, pCloud, Dropbox…) stops answering while Frameloft is indexing it, for example because the computer went to sleep, Frameloft pauses and carries on when the drive is back, instead of cataloguing empty entries. Problems are written to `frameloft.log` in the same folder.

Deleting that folder resets Frameloft. Your photos and the metadata written into them stay.

## Building from source

Requirements: [Rust](https://rustup.rs) (stable), [Node.js](https://nodejs.org) 20+, and the [Tauri prerequisites](https://v2.tauri.app/start/prerequisites/) for your OS (Xcode Command Line Tools on macOS; WebView2 and the MSVC build tools on Windows; `libwebkit2gtk-4.1-dev` and friends on Linux).

```bash
npm install
npm run fetch-exiftool   # downloads ExifTool into src-tauri/resources/exiftool
npm run app              # run in development mode
npm run dist             # build an installer for this computer (src-tauri/target/release/bundle/)
```

To build installers for all three systems at once, push the repository to GitHub and run the **Build installers** workflow (`.github/workflows/release.yml`) from the Actions tab. It produces a draft release with every installer attached. It signs and notarises the macOS builds (and signs Windows builds) when the signing secrets are set; see [docs/code-signing.md](docs/code-signing.md). How releases are made, and the plan for 1.0, are in [docs/release-1.0.md](docs/release-1.0.md).

## How it's built

- **Rust** back end ([Tauri 2](https://tauri.app)) using the system's own web view, so the app stays small (about 15 MB installed versus hundreds of MB for Qt or Electron apps).
  - `src-tauri/src/db.rs`: SQLite catalogue
  - `indexer.rs`: background scanning, metadata reading and thumbnail building
  - `thumbs.rs`: thumbnails and previews (the `image` crate, embedded RAW previews, `sips` for HEIC on macOS, Quick Look for video thumbnails on macOS)
  - `exiftool.rs` / `metadata.rs`: metadata reading and writing via a persistent ExifTool process
  - `fileops.rs`: move, copy, rename folders and trash, keeping the catalogue in sync
  - `rename.rs`: renaming photos, one or many (pattern or find-and-replace, preview, undo)
  - `history.rs`: the undo history (multi-step undo of moves, copies, renames and folder changes)
  - `pending.rs`: moves made while a drive is away, done when it's back
  - `watcher.rs`: file-system watching for edits made in other apps
  - `openwith.rs`: "Open with" on macOS (Launch Services), Windows (Shell association handlers) and Linux (.desktop files)
  - `share.rs`: sharing on macOS (share sheet and Mail via AppKit), Windows (share sheet, email through Simple MAPI) and Linux (`xdg-email`), plus clipboard copies
  - `smugmug.rs`: SmugMug sign-in (OAuth 1.0a), galleries and uploads; `webexport.rs`: resized JPEG copies
  - `collections.rs`: smart collections (rules turned into catalogue queries)
  - `duplicates.rs`: the duplicate finder (file fingerprints and thumbnail look-alike hashes)
  - `ai.rs`: the AI finder (Claude Messages API with tool use, or any OpenAI-compatible server)
  - `appmenu.rs`: the native menu bar (its commands run in `src/lib/menubar.svelte.ts`)
  - `updates.rs`: the update check against GitHub Releases and in-app install ([docs/updates.md](docs/updates.md))
- **Svelte 5 + TypeScript** front end in `src/`, with [Leaflet](https://leafletjs.com) for maps and [Lucide](https://lucide.dev) icons.

## Contributing and support

Frameloft is a hobby project. I have a full-time and very different day job, so I fix things in my free time and replies can be slow.

- **Found a problem or have an idea?** Open an [issue](https://github.com/frameloft/Frameloft/issues). Feedback and suggestions are welcome.
- **Want to work on Frameloft?** Pull requests are welcome, and so are people who would like to help maintain it. Read [CONTRIBUTING.md](CONTRIBUTING.md) first, and open an issue to say hello. Please keep Frameloft light: no pixel editing, no heavy dependencies, and every change that touches files should be safe on external and network drives.
- **Found a security problem?** Please report it privately, as described in [SECURITY.md](SECURITY.md).

Everyone taking part is asked to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Credits & licence

Frameloft is © Light and Alley and the Frameloft contributors, and is MIT licensed (see `LICENSE`). It bundles [ExifTool](https://exiftool.org) by Phil Harvey (Perl Artistic Licence / GPL). Map data © [OpenStreetMap](https://www.openstreetmap.org/copyright) contributors. Feature ideas were inspired by digiKam and Adobe Bridge; Frameloft shares no code or design with them.
