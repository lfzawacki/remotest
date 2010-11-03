def hidden_element text, options = {}
	"<div style=\"display: none;\" id=\"#{options[:id]}\">" + text + "</div>"
end

def toggle_hidden_element id, options = {}

  	show = options[:show] || "Show"
  	hide = (options[:hide] || options[:show]) || "Hide"

  	text = "<span id=\"id\">" + show + "</span>"

  	options[:onclick] = "toggleText('#{id}','#{show}','#{hide}')"
	mapped = options.map{|k,v| "#{k}=\"#{v}\"" }

  	"<a href=\"javascript:void(0);\" #{mapped} } >" + text +"</a>"
end

def hide_and_toggle str, options = {}
	result = hidden_element(str, options)
	result += toggle_hidden_element(options[:id], options)
	result
end
