#!/usr/bin/env ruby
require_relative 'file_buddy'
require_relative 'flip_flap'

include FileBuddy

tsv_filename, yml_filename = validate_filenames(ARGV)

tsv = safe_load_file(tsv_filename)
flipper = FlipFlap.new
flipper.take_tsv(tsv)

write_out(yml_filename, flipper.to_yaml)
