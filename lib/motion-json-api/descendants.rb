# Taken from https://github.com/rubymotion/motion-support/blob/master/motion/descendants_tracker.rb

# Copyright (c) 2005-2013 David Heinemeier Hansson
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module MotionJsonApi
  # This module provides an internal implementation to track descendants
  # which is faster than iterating through ObjectSpace.
  module Descendants
    @@direct_descendants = {}

    class << self
      def direct_descendants(klass)
        @@direct_descendants[klass] || []
      end

      def descendants(klass)
        arr = []
        accumulate_descendants(klass, arr)
        arr
      end

      def clear
        @@direct_descendants.clear
      end

      # This is the only method that is not thread safe, but is only ever called
      # during the eager loading phase.
      def store_inherited(klass, descendant)
        (@@direct_descendants[klass] ||= []) << descendant
      end

      private
      def accumulate_descendants(klass, acc)
        if direct_descendants = @@direct_descendants[klass]
          acc.concat(direct_descendants)
          direct_descendants.each { |direct_descendant| accumulate_descendants(direct_descendant, acc) }
        end
      end
    end

    def inherited(base)
      Descendants.store_inherited(self, base)
      super
    end

    def direct_descendants
      Descendants.direct_descendants(self)
    end

    def descendants
      Descendants.descendants(self)
    end
  end
end
