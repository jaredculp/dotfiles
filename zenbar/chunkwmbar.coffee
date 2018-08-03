command: "/usr/local/bin/chunkc tiling::query --desktop id"

refreshFrequency: 500

render: (output) ->
  "space <span>#{output}</span>"

style: """
  top: 18px
  left: 30px
  font: 9px Menlo
  color: #cc241d
  font-weight: bold
  span
    color: #ebdbb2
    font-weight: normal !important
"""
