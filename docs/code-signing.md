# Code signing and notarisation

Unsigned apps work, but macOS and Windows warn people before they open them. For a public release that warning puts people off, so the **Build installers** workflow (`.github/workflows/release.yml`) can sign the installers. Signing switches on by itself when the secrets below exist in the repository, and is skipped (with a warning in the run log) when they don't, so nothing breaks while they're missing.

Secrets go in **GitHub → the Frameloft repository → Settings → Secrets and variables → Actions → New repository secret**. Only people with admin rights on the repository can see or change them, and they never appear in logs.

## macOS without an Apple account: ad-hoc signature

Until there is a Developer ID certificate, the workflow gives the Mac app an *ad-hoc* signature (`src-tauri/tauri.macos-adhoc.json`). It says nothing about who made the app, but it seals the app's files, so macOS can tell the download is intact. People then get the usual "Apple could not verify Frameloft" prompt and can open it with **System Settings → Privacy & Security → Open Anyway**. Without any signature, macOS on Apple Silicon reports a downloaded app as "damaged" and offers only to move it to the Bin.

After building, the workflow checks the `.dmg` and the in-app update file as a download would be checked (`scripts/check-macos-app.sh`), and the **Mac app signature** check does the same on pull requests that change the Mac build. To check a downloaded copy by hand:

```bash
codesign --verify --deep --strict --verbose=2 /Applications/Frameloft.app   # "valid on disk", "satisfies its Designated Requirement"
codesign -dv /Applications/Frameloft.app 2>&1 | grep -E 'Signature|Sealed'  # "Signature=adhoc", "Sealed Resources version=2"
```

Once the secrets below are added, the Developer ID signature is used instead.

## macOS: Developer ID signing and notarisation

This removes the "Apple could not verify Frameloft is free of malware" warning and the `xattr -cr` workaround.

### What you need

1. **Apple Developer Program membership** (US$99 a year, or local equivalent): <https://developer.apple.com/programs/enroll/>. Enrol as an individual with your own Apple ID, or as an organisation (needs a D-U-N-S number) if you want the certificate to say "Light and Alley" instead of your name. Approval usually takes one to two days.
2. A Mac with Xcode or the Xcode Command Line Tools (you already have this).

### Step 1: make a Developer ID Application certificate

1. On the Mac, open **Keychain Access → Certificate Assistant → Request a Certificate From a Certificate Authority…**. Enter your email, choose **Saved to disk**, and save the `.certSigningRequest` file.
2. Go to <https://developer.apple.com/account/resources/certificates/add>, choose **Developer ID Application**, upload the request, and download the certificate.
3. Double-click the downloaded `.cer` so it goes into your login keychain.
4. In Keychain Access, under **My Certificates**, find "Developer ID Application: *Your Name* (*TEAMID*)", right-click it, **Export…**, and save it as `frameloft-signing.p12` with a strong password.
5. Turn the file into text for GitHub:

   ```bash
   base64 -i frameloft-signing.p12 | pbcopy
   ```

   The certificate text is now on the clipboard.

### Step 2: make an app-specific password for notarisation

1. Sign in at <https://account.apple.com>, go to **Sign-In and Security → App-Specific Passwords**, and create one called "Frameloft notarisation".
2. Find your **Team ID** (ten letters and digits) at <https://developer.apple.com/account> under **Membership details**.

### Step 3: add the secrets

| Secret | Value |
|---|---|
| `APPLE_CERTIFICATE` | the base64 text from step 1.5 |
| `APPLE_CERTIFICATE_PASSWORD` | the password you gave the `.p12` file |
| `APPLE_SIGNING_IDENTITY` | optional: the full certificate name, e.g. `Developer ID Application: Jane Doe (AB12CD34EF)` |
| `APPLE_ID` | the email address of your Apple developer account |
| `APPLE_PASSWORD` | the app-specific password from step 2 (not your normal password) |
| `APPLE_TEAM_ID` | your Team ID |

Then delete `frameloft-signing.p12` from your Downloads folder; the certificate stays safe in your keychain.

### Checking it worked

Run the workflow. In the log of each macOS job you should see "macOS: signing with the Developer ID certificate." and "macOS: notarising with Apple." Notarisation usually adds a few minutes. On a Mac, after downloading the new `.dmg`:

```bash
spctl -a -vvv -t install /Applications/Frameloft.app   # "accepted, source=Notarized Developer ID"
```

The certificate lasts five years. The membership must be renewed every year, or new builds can't be notarised (already-notarised builds keep working).

## Windows: Azure Artifact Signing (optional)

Signing on Windows replaces "Unknown publisher" with your name. SmartScreen's "Windows protected your PC" screen can still appear for a while with any certificate until enough people have downloaded the app, so Windows signing is worth doing but less urgent than the Mac.

The workflow supports **Azure Artifact Signing** (formerly called Trusted Signing), Microsoft's own service, which costs about US$10 a month and needs no hardware token. **Check eligibility first:** Microsoft has only offered it to individual developers in some countries (the US and Canada at first) and to organisations with a verifiable history of a few years. See <https://azure.microsoft.com/products/artifact-signing/>.

If you're eligible:

1. Create an Azure account, then an **Artifact Signing account** and an **identity validation** (individual or organisation) in the Azure portal. Validation can take a few days.
2. Create a **certificate profile** (type *Public Trust*).
3. Create an **app registration** in Microsoft Entra ID, make a client secret for it, and give it the **Certificate Profile Signer** role on the signing account (listed as "Artifact Signing Certificate Profile Signer" or, in older portals, "Trusted Signing Certificate Profile Signer").
4. Add these secrets:

| Secret | Value |
|---|---|
| `AZURE_CLIENT_ID` | the app registration's Application (client) ID |
| `AZURE_CLIENT_SECRET` | the client secret's value |
| `AZURE_TENANT_ID` | your Directory (tenant) ID |
| `AZURE_SIGNING_ENDPOINT` | the account's endpoint, e.g. `https://weu.codesigning.azure.net` |
| `AZURE_SIGNING_ACCOUNT` | the signing account name |
| `AZURE_SIGNING_PROFILE` | the certificate profile name |

The workflow then installs [`trusted-signing-cli`](https://github.com/Levminer/trusted-signing-cli) and Tauri signs `Frameloft.exe`, the `.msi` and the setup `.exe` with it.

**If you aren't eligible:** once the repository is public, apply to the [SignPath Foundation](https://signpath.org), which signs open-source projects for free. It works differently (the built files are sent to SignPath to be signed after approval), so the workflow would need a small change at that point. Until then, the README explains how to get past SmartScreen.

## Linux

Linux packages aren't signed in the same way. GitHub shows a SHA-256 checksum for every release file, which is enough for now.
