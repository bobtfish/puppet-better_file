module Puppet::Parser::Functions
  newfunction(:better_file, :type => :rvalue, :doc => <<-'ENDHEREDOC'
    A better_file function, which understands puppet:///modules/xxx/foo uris as well as full pathnames

    ENDHEREDOC
    ) do |args|

    unless args.length == 1 then
      raise Puppet::ParseError, ("better_file(): wrong number of arguments (#{args.length}; must be 1)")
    end
    arg = args[0]
    unless arg.respond_to?('to_s') then
      raise Puppet::ParseError, ("#{arg.inspect} is not a string. It looks to be a #{arg.class}")
    end
    arg = arg.to_s
    fn = arg
    if arg =~ /^puppet:\/\/\/modules\/([^\/]+)\/(.*)$/
      mod = $1
      file   = $2
      if module_path = Puppet::Module.find(mod, compiler.environment.to_s)
        module_path = module_path.path
      else
        raise(Puppet::ParseError, "Could not find module #{args[0]} in environment #{compiler.environment}")
      end
      fn = "#{module_path}/files/#{file}"
    end
    if !File.exists? arg
      raise Puppet::ParseError, ("better_file('#{arg}') could not find file '#{fn}'")
    end
    IO.read(fn)
  end
end

