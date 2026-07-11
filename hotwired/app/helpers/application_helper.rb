module ApplicationHelper
    def flash_class(type)
        case type.to_sym
        when :notice
            "bg-emerald-500/90 backdrop-blur"
        when :alert
            "bg-rose-500/90 backdrop-blur"
        when :error
            "bg-red-600/90 backdrop-blur"
        else
            "bg-zinc-900/90 backdrop-blur"
        end
    end
end
