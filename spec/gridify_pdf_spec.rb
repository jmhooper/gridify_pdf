# frozen_string_literal: true

RSpec.describe GridifyPdf do
  it "works" do
    input = File.read('./spec/pdfs/test_input.pdf')
    result = GridifyPdf::Gridifier.new(input).gridify
    File.write('./tmp/test_output.pdf', result)
  end
end
