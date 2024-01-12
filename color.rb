COLOR_SCHEMES = {
    light: ['#eeeeee', '#d6e685', '#8cc665', '#44a340', '#1e6823'],
    dark: ['#161b22', '#0e4429', '#006d32', '#26a641', '#39d353'],
    halloween: ['#eeeeee', '#ffee4a', '#ffc501', '#fe9600', '#03001c'],
    teal: ['#eeeeee', "#7fffd4", "#76eec6", "#66cdaa", "#458b74"],
}

# http://www.redguava.com.au/2011/10/lighten-or-darken-a-hexadecimal-color-in-ruby-on-rails/

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