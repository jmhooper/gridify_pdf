# frozen_string_literal: true

RSpec.describe GridifyPdf::Gridifier do
  describe '#gridify!' do
    it 'creates a valid pdf document' do
      input = File.read('./spec/pdfs/test_input.pdf')
      result = GridifyPdf::Gridifier.new(input).gridify

      parsed_result = CombinePDF.parse(result)
      expect(parsed_result.pages.length).to eq(4)
    end
  end
end
