require 'pry'
require 'pry-debugger'
require 'pry-stack_explorer'

def sum(a,b)
  a + b
end

def square(a)
  a ** 2
end

def cube(a)
  a * square(a)
end

x = cube(3)

def factorial(a)
  a == 1 ? a : (a * factorial(a-1))
end

def fib(x, a = 0, b = 1, c = 0)
  if x < 2
    c
  else
    c = a + b
    a = b
    b = c
    x -= 1
    fib(x,a,b,c)
  end
end

def better_fib(n)
  if (n == 0 || n == 1)
    n
  else
    better_fib(n - 2) + better_fib(n - 1)
  end
end

class Node
  attr_accessor :data, :prv, :nxt

  def initialize(data)
    self.data = data
    self.prv = self.nxt = nil
  end
end

binding.pry