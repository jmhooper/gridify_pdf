# gridify_pdf

This is a tool that I wrote to lay a grid over PDF files.

I was working on an app that adds text boxes to PDFs using [Prawn](https://github.com/prawnpdf/prawn) and [CombinePDF](https://github.com/boazsegev/combine_pdf). I got frustrated with the guess-and-check method to find the right coordinates.

Given a PDF that looks like this:

![A PDF without a grid overlay](https://raw.githubusercontent.com/jmhooper/gridify_pdf/refs/heads/main/docs/before.png)

It will make this:

![A PDF with a grid overlay](https://raw.githubusercontent.com/jmhooper/gridify_pdf/refs/heads/main/docs/after.png)

## Installation

This can be installed with RubyGems:

```
gem install gridify_pdf
```

## CLI

This is primarily intended to be used as a CLI tool

This will read the file at `document.pdf` and output a version with a grid overlay at `gridified_document.pdf`.

```shell
gridify_pdf document.pdf gridified_document.pdf
```

You can also have the PDF written to a temporary file and opened in your default PDF viewer:

```shell
gridify_pdf document.pdf --open
```

## Usage in code

If, for some reason, you want to use this tool in your own code, that is also possible:

```ruby
require 'gridify_pdf'

input = File.read('input.pdf')
result = GridifyPdf::Gridifier.new(input).gridify
File.write('output.pdf', result)
```
