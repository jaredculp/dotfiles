command: "$HOME/now-playing"

refreshFrequency: 500

render: (output) ->
  "#{output}"

style: """
  top: 18px
  width: 100%
  text-align: center
  font: 9px Menlo
  color: #d79921
  font-weight: bold
  span
    color: #ebdbb2
    font-weight: normal !important
"""
