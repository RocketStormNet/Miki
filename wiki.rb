require "sinatra"

get("/") do
	erb :welcome	
end

get("/:title") do
	@title = params[:title]
	@content = page_content(@title)
	erb :show
end

def page_content(title)
	File.read("pages/#{title}.txt")
rescue Errno::ENOENT
	return "404"
end