command: "/usr/local/bin/chunkc tiling::query --desktop id"

refreshFrequency: 500

render: (output) ->
  "space <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  font: 9px Menlo
  color: #eee
  top: 16px
  left: 30px
  span
    color: #aaa
"""
