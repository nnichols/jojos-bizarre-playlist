terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.7"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

resource "spotify_playlist" "playlist" {
  name        = "JoJo's Bizarre Playlist"
  description = "Every song/artist referenced by JoJo's Bizarre Adventure. This playlist is managed by Terraform. To request updates or changes, please visit https://github.com/nnichols/jojos-bizarre-playlist"
  public      = true

  tracks = flatten([
    data.spotify_search_track.jonathan_joestar.tracks[0].id
  ])
}
