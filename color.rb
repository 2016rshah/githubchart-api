#http://www.redguava.com.au/2011/10/lighten-or-darken-a-hexadecimal-color-in-ruby-on-rails/

COLOR_SCHEMES = {
    default: ['#eeeeee', '#d6e685', '#8cc665', '#44a340', '#1e6823'],
    halloween: ['#EEEEEE', '#FFEE4A', '#FFC501', '#FE9600', '#03001C'],
    teal: ['#EEEEEE', "#7FFFD4", "#76EEC6", "#66CDAA", "#458B74"]
}

# Amount should be a decimal between 0 and 1. Lower means darker
def darken_color(hex_color, amount=0.4)
  hex_color = hex_color.gsub('#','')
  rgb = hex_color.scan(/../).map {|color| color.hex}
  rgb[0] = (rgb[0].to_i * amount).round
  rgb[1] = (rgb[1].to_i * amount).round
  rgb[2] = (rgb[2].to_i * amount).round
  "#%02x%02x%02x" % rgb
end
  
# Amount should be a decimal between 0 and 1. Higher means lighter
def lighten_color(hex_color, amount=0.6)
  hex_color = hex_color.gsub('#','')
  rgb = hex_color.scan(/../).map {|color| color.hex}
  rgb[0] = [(rgb[0].to_i + 255 * amount).round, 255].min
  rgb[1] = [(rgb[1].to_i + 255 * amount).round, 255].min
  rgb[2] = [(rgb[2].to_i + 255 * amount).round, 255].min
  "#%02x%02x%02x" % rgb
end