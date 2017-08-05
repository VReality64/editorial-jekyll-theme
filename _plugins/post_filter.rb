module Jekyll
  module DecorateFilter
    def post(base, name)
      if name
        "#{base}/post/#{name}.html"
      else
        "post/#{base}.html"
      end
    end

    def posts(base)
      "#{base}/post/"
    end

    def dir(base, dir)
      "#{base}/#{dir}"
    end

    def title(title)
      # get _config data
      deco = @context.registers[:site].config['subtitle']
      "#{title} #{deco}"
    end

    def root(url)
      "/#{url}"
    end

    def image(url)
      "assets/images/#{url}"
    end
  end

  module SomeFilter
    def some(items, size)
      some = []
      idx = 0

      for item in items
        break if idx >= size || !item
        some.push(item)
        idx = idx + 1
      end

      some
    end

  end

  module DefaultFilter
    def default(data, type)
      default = handle_title(data) if type == "title"

      for asset in ['image', 'thumb']
        if asset == type
          default = handle_assets(data, type)
          break;
        end
      end

      default
    end

    def handle_title(data)
      default = data if data
      # get _config data
      default = @context.registers[:site].config['title'] if !data

      default
    end

    def handle_assets(data, type)
      if data
        return default = "/#{data}"
      end

      if type == "image"
        return "/assets/images/basic.jpg"
      elsif type == "thumb"
        return "/assets/images/thumb_basic.jpg"
      end
    end
  end

  module FilteringFilter
    def filter(items, type)
      filtered = []

      for item in items
        splited = item.name.split(".")
        len = splited.length
        name = splited[len - 2]

        filtered.push(item) if name != type
      end

      filtered
    end

    def inside(items, dir)
      directory_filter(items, dir, true)
    end

    def exclude(items, dir)
      directory_filter(items, dir, false)
    end

    def directory_filter(items, dir, equal)
      filtered = []

      for item in items
        dirs = item.dir.split("/")
        cwd = dirs[dirs.length - 1]

        if equal
          filtered.push(item) if cwd == dir
        else
          filtered.push(item) if cwd != dir
        end
      end

      filtered
    end
  end
end

Liquid::Template.register_filter(Jekyll::DecorateFilter)
Liquid::Template.register_filter(Jekyll::SomeFilter)
Liquid::Template.register_filter(Jekyll::DefaultFilter)
Liquid::Template.register_filter(Jekyll::FilteringFilter)