#!/usr/bin/env ruby
require_relative 'file_buddy'
require_relative 'flip_flap'

include FileBuddy

yml_filename, tsv_filename = validate_filenames(ARGV)

yml = safe_load_file(yml_filename)
flipper = FlipFlap.new
flipper.take_yaml(yml)

write_out(tsv_filename, flipper.to_tsv)
