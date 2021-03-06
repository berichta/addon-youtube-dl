#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: youtube-dl
#
# Launch youtube-dl
# ------------------------------------------------------------------------------

main() {
    bashio::log.trace "${FUNCNAME[0]}"
    OPTIONS=$(bashio::config 'options')
    URL=$(bashio::config 'URL')

    # Run youtube-dl
    if bashio::config.has_value 'options'; then
        bashio::log.info "Run: youtube-dl '${OPTIONS}' '${URL}'"
        youtube-dl "${OPTIONS}" "${URL}"
    else
        bashio::log.notice "No options found"
        bashio::log.info "Run: youtube-dl '${URL}'"
        youtube-dl "${URL}"
    fi
}
main "$@"
