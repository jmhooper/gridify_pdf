# frozen_string_literal: true

module GridifyPdf
  Options = Struct.new(
    :cell_width,
    :input,
    :output,
    :open_after_gridification,
    keyword_init: true,
  ) do
    def self.build_options_with_defaults(
      input: STDIN,
      output: STDOUT,
      cell_width: 50,
      open_after_gridification: false
    )
      self.new(input:, output:, cell_width:, open_after_gridification:)
    end
  end
end
