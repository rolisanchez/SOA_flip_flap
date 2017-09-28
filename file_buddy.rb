# Module that can be included (mixin) for input and output of files
module FileBuddy
  USAGE = 'USAGE: ruby tsv_to_yml.rb <TSV_file> [<YML_file>]'.freeze
  def validate_filenames(arguments)
    raise USAGE unless arguments.count == 2
    input_filename, output_filename = arguments
    raise 'output file exists' if File.exist? output_filename
    [input_filename, output_filename]
  end

  def safe_load_file(filename)
    File.read(filename)
  rescue StandardError
    raise 'Input file could not be read properly'
  end

  def write_out(filename, data)
    filename ? File.write(filename, data) : puts(data)
  rescue StandardError
    raise "Could not save to file #{filename}"
  end
end
