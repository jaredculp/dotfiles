command: "date +\"%H:%M:%S\""

refreshFrequency: 1000

render: (output) ->
  "time <span>#{output}</span>"

style: """
  top: 18px
  left: 90px
  font: 9px Menlo
  color: #98971a
  font-weight: bold
  span
    color: #ebdbb2
    font-weight: normal
"""
