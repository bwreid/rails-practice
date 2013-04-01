require 'pry'
require 'pry-debugger'
require 'pry-stack_explorer'

class Node
  attr_accessor :d, :p, :n

  def initialize(data)
    self.d = data
    self.p = self.n = nil
  end

  def to_s
    nxt = self.n.nil? ? '(empty)' : self.n.d
    prv = self.p.nil? ? '(empty)' : self.p.d
    "#{prv} <- #{self.d} -> #{nxt}"
  end
end

class Tree
  attr_accessor :root, :current

  def to_s
  @names = []
  add_to_names(self.root)
  "#{@names.join(', ')}"
  end

  def add_to_names(node)
    add_to_names(node.p) if !node.p.nil?
    @names << node.d if !node.d.nil?
    add_to_names(node.n) if !node.n.nil?
  end

  def insert(name)
    if self.root.nil?
      self.root = Node.new(name)
    else
      self.current = self.root if self.current.nil?
      if name > self.current.d
        if self.current.n
          self.current = self.current.n
          self.insert(name)
        else
          self.current.n = Node.new(name)
          self.current = nil
        end
      else
        if self.current.p
          self.current = self.current.p
          self.insert(name)
        else
          self.current.p = Node.new(name)
          self.current = nil
        end
      end
    end
  end

  def find(name)
    if self.root.d == name
      self.root
    else
      self.current = self.root if self.current.nil?
      if name > self.current.d && !self.current.n.nil?
        if self.current.n.d != name
          self.current = self.current.n
          self.find(name)
        else
          self.current.n
        end
      elsif name < self.current.d && !self.current.p.nil?
        if self.current.p.d != name
          self.current = self.current.p
          self.find(name)
        else
          self.current.p
        end
      else
        nil
      end
    end
  end

  def delete(name)
  end
end

tree = Tree.new
tree.insert('mary')
tree.insert('tom')
tree.insert('alex')
tree.insert('bryan')
tree.insert('emmett')
tree.insert('zach')

binding.pry
