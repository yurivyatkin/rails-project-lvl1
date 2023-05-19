module HexletCode
  class TextArea
    def initialize(name, value, **attributes)
      @name = name
      @value = value
      @attributes = attributes
    end

    def build
      cols = @attributes[:cols] || 20
      rows = @attributes[:rows] || 40
      HexletCode::Tag.build('textarea', name: @name, cols: cols, rows: rows, **@attributes) { @value }
    end
  end
end
