command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 150000 # ms

render: (output) ->
  "bat <span>#{output}</span>"

style: """
  top: 18px
  right: 30px
  font: 9px Menlo
  color: #d65d0e
  font-weight: bold
  span
    color: #ebdbb2
    font-weight: normal
"""
