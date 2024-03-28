require "rails_helper"

describe DictionaryService do
  let(:service) { described_class.new(file_name) }

  context "#tokens_for_word" do
    let(:file_name) { "./spec/fixtures/dict_endpoint_1.txt" }
    let(:word) { "jacket"}

    subject { service.tokens_for_word(word) }

    it "tokens are returns properly" do
      expect(subject).to eq(["ck", "et", "ja", "cket", "jacket"])
    end
  end

  context "#words_for_tokens" do
    let(:file_name) { "./spec/fixtures/dict_endpoint_2.txt" }
    let(:word) { "rocket"}

    subject { service.words_for_tokens }

    it "tokens are returns properly" do
      expect(subject).to eq(["rocket"])
    end
  end
end
