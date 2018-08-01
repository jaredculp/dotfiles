command: "date +\"%H:%M:%S\""

refreshFrequency: 1000

render: (output) ->
  "time <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  color: #eee
  font: 9px Menlo
  top: 16px
  left: 90px

  span
    color: #aaa
"""
