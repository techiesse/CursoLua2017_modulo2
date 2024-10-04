require 'oop'

--Pair = newClass()
class 'Pair'


function Pair.init(self, x, y)
    self.x = x
    self.y = y
end

function Pair:__tostring()
    return string.format('Pair(%s, %s)', self.x, self.y)
end


function Pair:abs()
    return math.sqrt(self.x^2 + self.y^2)
end

function Pair:scale(factor)
    return Pair(self.x * factor, self.y * factor)
end


--public void translate(double x, double y) {
--    this.x += x;
--    this.y += y; // this.y = this.y + y;
--}