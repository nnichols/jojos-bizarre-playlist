# JoJo's Bizarre Playlist

Terraform for a Spotify Playlist containing songs corresponding to every music reference in JoJo's Bizarre Adventure.
In the case a particular reference was to a band or a singular performer, for example King Crimson and Bill Bruford, I've selected a track which is either widely known by said artist or a song closely related to their character.

Each track is partnered with comments explaining the connection and the particular reference selection.

For obvious reasons, the source code of this repository does contains spoilers.
Read at your own risk.

## Listen

The generated playlist is available on [Spotify.](https://open.spotify.com/playlist/0vVK42c48lGpisE3kEIEvg)

## Usage

First, create a file named `.env` with a `SPOTIFY_CLIENT_ID` and a `SPOTIFY_CLIENT_SECRET`:
The values for these keys can be generated by creating a new app in the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/applications).

```txt
SPOTIFY_CLIENT_ID=some_long_secret
SPOTIFY_CLIENT_SECRET=dont_commit_me
```

Prior to executing any terraform, run the Spotify Auth Proxy image:

```bash
docker run --rm -it -p 27228:27228 --env-file ./.env ghcr.io/conradludgate/spotify-auth-proxy
```

Follow the `Auth URL:` link in the Docker image's output to authorize Terraform against Spotify.
Then copy the `APIKey` from the Docker image's output into a `terraform.tfvars` file:

```hcl
spotify_api_key = "SOME LONG SECRET KEY"
```

With the Auth proxy still running, you may plan and apply your terraform.

```bash
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
  + create

Terraform will perform the following actions:

# spotify_playlist.playlist will be created
  + resource "spotify_playlist" "playlist" {
      + description = "Every song/artist referenced by JoJo's Bizarre Adventure. This playlist is managed by Terraform. To request updates or changes, please visit https://github.com/nnichols/jojos-bizarre-playlist"
      + id          = (known after apply)
      + name        = "JoJo's Bizarre Playlist"
      + public      = true
      + snapshot_id = (known after apply)
      + tracks      = [
          + "4MLBqAEzNN89o2M9h92Z26",
          + "0oKpBiPwHMi2VTT9sYjaPe",
          + "5GjPQ0eI7AgmOnADn1EO6Q",
          + "4rcHWl68ai6KvpXlc8vbnE",
          + "78lgmZwycJ3nzsdgmPPGNx",
          + "5yAu4njFSdM47dfsTkQPZ2",
          + "26tWBbtjvgi0tipRL2VQ2X",
          + "1tKpF6q0kAnygzncAgMgat",
          + "1JVqe1eyr9eJZSw1SP4PuU",
          + "6BYULU1d4pbArOI3Y67k1N",
          + "7gC6Rbllqf1yXNC02e5jz2",
          + "4p8QcNkaq2FQj8uGJ7HEDK",
          + "3qx0e7BAXSR02fBE0GKTeo",
          + "0PsbWiVtix5FoTZ1s00mEl",
        ]
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + playlist_url = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

spotify_playlist.playlist: Creating...
spotify_playlist.playlist: Creation complete after 1s [id=0vVK42c48lGpisE3kEIEvg]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

playlist_url = "https://open.spotify.com/playlist/0vVK42c48lGpisE3kEIEvg"
```

## License

Copyright © Nick A. Nichols

This software is provided for free, public use as outlined in the [MIT License](https://github.com/Wall-Brew-Co/brew-bot/blob/master/LICENSE)
