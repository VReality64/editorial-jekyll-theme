module Jekyll
  module PostFilter
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
  end

  module SomeFilter
    def some(items, size)
      some = []
      idx = 0

      while idx < size do
        some.push(items[idx])
        idx = idx + 1
      end

      some
    end
  end

  module DefaultFilter
    def default(data, type)
      default = data

      if !data
        if type == "image"
          default = "assets/images/basic.jpg"
        end
      end

      default
    end
  end
end

Liquid::Template.register_filter(Jekyll::PostFilter)
Liquid::Template.register_filter(Jekyll::SomeFilter)
Liquid::Template.register_filter(Jekyll::DefaultFilter)