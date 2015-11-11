class FallbackMap
	class << self
		def walk(op, map, path)
			return map if path.length == 0

			got_next = false
			n = nil
			if map.respond_to? :has_path? and map.respond_to? :get
				if map.has_path? path[0]
					n = map.get(path[0])
					got_next = true
				end
			elsif map.respond_to? :has_key? and map.respond_to? :[]
				if map.has_key? path[0]
					n = map[ path[0] ]
					got_next = true
				end
			end

			if !got_next
				return (op == :get) ? nil : false
			end

			return walk(op, n, path[1..-1])
		end
	end

	def initialize
		@fallbacks = []
	end

	def attach(other)
		@fallbacks.push other
	end

	def override(other)
		@fallbacks.unshift other
	end

	def has_path?(path)
		@fallbacks.each do |map|
			if self.class.walk(:has_path?, map, path)
				return true
			end
		end

		return false
	end

	def get(path)
		@fallbacks.each do |map|
			if self.class.walk(:has_path?, map, path)
				return self.class.walk(:get, map, path)
			end
		end

		return nil
	end

	def [](pathspec)
		return get(pathspec.split ':')
	end

	def has_key?(pathspec)
		return has_path?(pathspec.split ':')
	end
end
