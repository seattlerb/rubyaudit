#!/usr/local/bin/ruby -w

module Enumerable
  def deepfreeze
    self.each do |o|
      if o != self then
        o.deepfreeze
      else
        o.freeze
      end
    end
    self.freeze
  end
end

class Object
  def deepfreeze
    self.freeze
  end
end

class Tuple < Array
  def initialize(*stuff)
    super()
    self.push(*stuff)
    self.deepfreeze
  end
end
