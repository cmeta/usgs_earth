# USGS Earth Data Download Helper

Use GitHub Actions as a bridge to download large files from USGS.gov when direct access is slow.

## How it works

```
USGS.gov (slow) → GitHub Actions (fast) → GitHub Release / Artifact
```

## Usage

### Option 1: Manual Download (Artifact)

1. Go to **Actions** tab
2. Select **Download USGS Data**
3. Click **Run workflow**
4. Fill in:
   - **USGS download URL**: The full URL from USGS
   - **Name for this download**: Optional friendly name
5. Download the artifact after completion

### Option 2: Automated Download via Release

When a new release is created, the workflow automatically downloads the configured URLs and attaches them.

## Configure Download Links

Edit `.github/workflows/release.yml` and update the `URLS` array:

```yaml
env:
  URLS: |
    https://dds.cr.usgs.gov/download-staging/eyJpZCI6OTc3NTc2NTM1LCJjb250YWN0SWQiOjI2MjM2MjEyfQ==
```

## Check USGS Accessibility

Run locally:

```bash
curl -I https://dds.cr.usgs.gov
curl -I https://www.usgs.gov
```

## Current Download

| Name | URL |
|------|-----|
| DS1105-1086DA138 | `https://dds.cr.usgs.gov/download-staging/eyJpZCI6OTc3NTc2NTM1LCJjb250YWN0SWQiOjI2MjM2MjEyfQ==` |