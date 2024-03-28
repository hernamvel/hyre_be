class DictionaryService

  def initialize(dictionary_file)
    @file = dictionary_file
  end

  def tokens_for_word(word)
    results = []
    combinations = { word => 1 }
    [(0..1),(2..3),(4..5),(0..2),(3..5),(0..3),(2..5)].each do |range|
      combinations[word.slice(range)] = 1
    end
    File.open(@file, "r") do |f|
      f.each_line do |line|
        line.strip!
        results << line if combinations[line] == 1
      end
    end
    results
  end

  def words_for_tokens
    complete_words = []
    tokens = {}
    File.open(@file, "r") do |f|
      f.each_line do |line|
        line.strip!
        line_length = line.length
        if line_length == 6
          complete_words << line
        else
          tokens[line] = 1
        end
      end
    end
    complete_words.select do |word|
      combinations = [
        [word.slice(0..1), word.slice(2..3), word.slice(4..5)],
        [word.slice(0..2), word.slice(3..5)],
        [word.slice(0..1), word.slice(2..5)],
        [word.slice(0..3), word.slice(4..5)],
      ]
      combinations.any? do |combination|
        combination.all? { |tok| tokens[tok] == 1}
      end
    end
  end
end
