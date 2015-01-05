module Puppet::Parser::Functions
  newfunction(:pw_hash, type: :rvalue) do |args|
    raise Puppet::ParseError, "pw_hash takes exactly two arguments, #{args.length} provided" if args.length != 2
    # SHA512 ($6), default number of rounds (5000)
    # rounds could be specified by prepending rounds=<n>$ parameter before the salt, i.e.
    # args[0].crypt("$6$rounds=50000$#{args[1]}")
    args[0].crypt("$6$#{args[1]}")
  end
end
