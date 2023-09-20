resource "spotify_playlist" "playlist" {
  name        = "JoJo's Bizarre Playlist"
  description = "Every song/artist referenced by JoJo's Bizarre Adventure. This playlist is managed by Terraform. To request updates or changes, please visit https://github.com/nnichols/jojos-bizarre-playlist"
  public      = true

  tracks = flatten([
    # Part 1: Phantom Blood
    data.spotify_search_track.jonathan_joestar.tracks[0].id,
    data.spotify_search_track.dio_brando.tracks[0].id,
    data.spotify_search_track.erina_pendleton.tracks[0].id,
    data.spotify_search_track.robert_eo_speedwagon.tracks[0].id,
    data.spotify_search_track.william_zeppeli.tracks[0].id,
    data.spotify_search_track.tonpetty.tracks[0].id,
    data.spotify_search_track.dire_straizo.tracks[0].id,
    data.spotify_search_track.poco.tracks[0].id,
    data.spotify_search_track.wang_chan.tracks[0].id,
    data.spotify_search_track.tarkus.tracks[0].id,
    data.spotify_search_track.bruford.tracks[0].id,
    data.spotify_search_track.plant_jones_page_bornnam.tracks[0].id,
    data.spotify_search_track.jeff_back.tracks[0].id,
    data.spotify_search_track.father_styx.tracks[0].id,

    # Part 2: Battle Tendency
    data.spotify_search_track.joseph_joestar.tracks[0].id,
    data.spotify_search_track.lisa_lisa.tracks[0].id,
    data.spotify_search_track.loggins.tracks[0].id,
    data.spotify_search_track.messina.tracks[0].id,
    data.spotify_search_track.suzi_q.tracks[0].id,
    data.spotify_search_track.wired_beck.tracks[0].id,
    data.spotify_search_track.santana.tracks[0].id,
    data.spotify_search_track.wamuu.tracks[0].id,
    data.spotify_search_track.esidisi.tracks[0].id,
    data.spotify_search_track.kars.tracks[0].id,
    data.spotify_search_track.smokey.tracks[0].id,
    data.spotify_search_track.brown.tracks[0].id,
    data.spotify_search_track.caesar_zeppeli.tracks[0].id,
    data.spotify_search_track.red_stone_of_aja.tracks[0].id,
    data.spotify_search_track.donovan.tracks[0].id,
    data.spotify_search_track.air_supplena_island.tracks[0].id,
    data.spotify_search_track.get_back.tracks[0].id,
  ])
}
