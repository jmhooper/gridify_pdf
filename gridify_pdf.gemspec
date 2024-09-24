# frozen_string_literal: true

require_relative "lib/gridify_pdf/version"

Gem::Specification.new do |spec|
  spec.name = "gridify_pdf"
  spec.version = GridifyPdf::VERSION
  spec.authors = ["Jonathan Hooper"]
  spec.email = ["jon9820@gmail.com"]

  spec.summary = "Add gridlines to PDF documents"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.homepage = "https://github.com/jmhooper/gridify_pdf"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jmhooper/gridify_pdf"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = ["gridify_pdf"]
  spec.require_paths = ["lib"]

  spec.add_dependency "prawn", "~> 2.5.0"
  spec.add_dependency "combine_pdf", "~> 1.0.0"
end
