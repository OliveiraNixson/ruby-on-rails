module ApplicationHelper
    def format_volume(volume)
        volume >=1000? "#{volume/1000}L" : "#{volume}ML"
    end
end
