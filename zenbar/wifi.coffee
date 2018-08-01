command: "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep SSID | grep -v BSSID | cut -d: -f2 | xargs"

refreshFrequency: 1000 # ms

render: (output) ->
  "ssid <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  font: 9px Menlo
  top: 16px
  left: 180px
  color: #eee
  span
    color: #aaa
"""

