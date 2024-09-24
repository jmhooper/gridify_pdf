# frozen_string_literal: true

module GridifyPdf
  class Gridifier
    attr_reader :input, :cell_width

    def initialize(input, cell_width: 50)
      @input = input
      @cell_width = cell_width
    end

    def gridify
      output_pdf = CombinePDF.new
      parsed_input.pages.each do |input_page|
        output_pdf << input_page
      end

      parsed_overlay = CombinePDF.parse(overlay_document.render)
      parsed_overlay.pages.slice(1..).each_with_index do |overlay_page, index|
        output_pdf.pages[index] << overlay_page
      end

      output_pdf.to_pdf
    end

    private

    def overlay_document
      @overlay_document ||= Prawn::Document.new(margin: 0).tap do |pdf|
        parsed_input.pages.each do |input_page|
          media_box = input_page[:MediaBox]
          page_width = media_box[2] - media_box[0]
          page_height = media_box[3] - media_box[1]

          pdf.start_new_page(size: [page_width, page_height])

          (0..(page_height + cell_width)).step(cell_width) do |y|
            (0..(page_width + cell_width)).step(cell_width) do |x|
              pdf.dash(1, space: 9)
              pdf.stroke_rectangle [x, y], cell_width, cell_width
              pdf.draw_text "(#{x}, #{y})", at: [x + 5, y - 10], size: 5
            end
          end
        end
      end
    end

    def parsed_input
      @parsed_input ||= CombinePDF.parse(input)
    end
  end
end
