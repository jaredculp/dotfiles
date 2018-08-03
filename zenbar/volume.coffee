command: "osascript -e 'get volume settings' | cut -f2 -d':' | cut -f1 -d',';"

refreshFrequency: 1000 # ms

render: (output) ->
  "vol <span>#{output}</span>"

style: """
  top: 18px
  right: 220px
  font: 9px Menlo
  color: #458588
  font-weight: bold
  span
    color: #ebdbb2
    font-weight: normal
"""
