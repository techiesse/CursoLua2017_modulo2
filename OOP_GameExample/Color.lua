require 'oop'

local Color = newClass()


function Color.init(self, r, g, b)
    self.r = r
    self.g = g
    self.b = b
end


function Color:asarray()
    return {self.r, self.g, self.b}
end


Color.WHITE =        Color(1, 1, 1)
Color.LIGHT_YELLOW = Color(1, 1, 0.5)
Color.YELLOW =       Color(1, 1, 0)
Color.RED =          Color(1, 0, 0)
Color.GREEN =        Color(0, 1, 0)
Color.BLUE =         Color(0, 0, 1)
Color.BLACK =        Color(0, 0, 0)

return Color
