#!/usr/local/bin/ruby -w

class Range
   alias :old_initialize :initialize
   alias :old_each :each

  def skip
    if defined? @skip then
      return @skip
    else
      return false
    end
  end

  def initialize(*args)
     count = args.length

     if count == 3 and args[2].kind_of? Fixnum then
       old_initialize(args[0], args[1], false)
       @skip = args[2]
     else
       old_initialize(*args)
     end
   end

   def each(&block)
     unless self.skip then
       old_each(&block)
     else
       max = self.last
       current = self.first
       skip = self.skip
       count = 0
       while current <= max do
	 if count % skip == 0 then
	   block.call(current)
	 end
	 count += 1
	 current = current.succ
       end
     end
   end

   alias :old_to_s :to_s
   def to_s
     return self.old_to_s + (self.skip ? "(skip: #{self.skip})" : "")
   end

end

class Array
  alias :old_index :[]

  def [](*args)
    count = args.length
    arg0 = args.old_index(0)
    if (   (count == 1 and not (arg0.kind_of? Range and arg0.skip)) \
	or (count == 2 and arg0.kind_of? Fixnum \
	               and args.old_index(1).kind_of? Fixnum)) then
      return old_index(*args)
    end

    # otherwise...
    result = []
    max = self.length
    args.each do | arg |
      if arg.kind_of? Range then
	arg.each { |index|
	  if index < max then
	    result.push(self.old_index(index))
	  end
	}
      else
	result.push(self.old_index(arg))
      end
    end
    return result
  end

end
