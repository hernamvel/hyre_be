class DictionaryController < ApplicationController
  def endpoint1
    service = DictionaryService.new("dictionary.txt")
    results = service.tokens_for_word(params[:word])
    render json: { words: results }, status: :ok
  end

  def endpoint2
    service = DictionaryService.new("dictionary.txt")
    results = service.words_for_tokens
    render json: { words: results }, status: :ok
  end
end
