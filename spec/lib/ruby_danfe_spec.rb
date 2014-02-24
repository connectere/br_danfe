require "spec_helper"

describe BrDanfe do
  let(:base_dir) { "./spec/fixtures/"}
  let(:output_pdf) { "#{base_dir}output.pdf" }

  before { File.delete(output_pdf) if File.exist?(output_pdf) }

  describe ".generate" do
    it "saves the PDF document to file based on a xml file" do
      expect(File.exist?(output_pdf)).to be_false

      BrDanfe.generate(output_pdf, "#{base_dir}nfe_with_ns.xml")

      expect("#{base_dir}nfe_with_ns.xml.fixture.pdf").to be_same_file_as(output_pdf)
    end
  end

  describe ".render" do
    it "renders the PDF document to string based on a xml string" do
      xml_string = File.new("#{base_dir}nfe_with_ns.xml")

      pdf_string = BrDanfe.render(xml_string)

      expect(pdf_string).to include "%PDF-1.3\n%"
    end
  end

  describe ".render_file" do
    it "renders the PDF document to file based on a xml string" do
      expect(File.exist?(output_pdf)).to be_false

      xml_string = File.new("#{base_dir}nfe_with_ns.xml")

      BrDanfe.render_file(output_pdf, xml_string)

      expect("#{base_dir}nfe_with_ns.xml.fixture.pdf").to be_same_file_as(output_pdf)
    end
  end
end
