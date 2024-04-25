defmodule BM25 do
  @moduledoc """
  BM25 is an algorithm used to rank documents based on their relevance to a
  given search query.

  BM25 calculates a score for each document based on a given search query,
  indicating how relevant each document is to that query. The higher the BM25
  score, the more relevant the document is considered.
  """

  @doc """
  Score documents against the given keywords.

  ## Options

    - `k1`: Float. Controls the scaling of the term frequency component. A
    higher `k1` value allows the term frequency to increase the document score
    more significantly. `k1` typically ranges between 1.2 and 2.0. Default: `1.2`.

    - `b`: Float. Adjusts how much the length of a document affects the final
    relevance score. `b` ranges from 0 to 1. Default: `0.75`.

  ## Example

      iex> documents = [
      iex>   "BM25 is a ranking function",
      iex>   "used by search engines",
      iex>   "to rank matching documents"
      iex> ]
      iex> query = ["ranking", "search", "function"]
      iex> BM25.bm25(documents, query)
      [1.8455076734299591, 1.0126973514850315, 0.0]
  """
  @spec bm25(list(String.t()), list(String.t()), keyword()) :: list(float())
  def bm25(documents, keywords, opts \\ []) do
    k1 = Keyword.get(opts, :k1) || 1.2
    b = Keyword.get(opts, :b) || 0.75

    documents = Enum.reduce(documents, [], &[{&1, get_word_count(&1)} | &2])
    avg_doc_length = Enum.reduce(documents, 0, &(elem(&1, 1) + &2)) / length(documents)

    Enum.reduce(documents, [], fn {doc, doc_len}, scores ->
      score = score_doc(documents, doc, doc_len, avg_doc_length, keywords, k1, b)
      [score | scores]
    end)
  end

  defp score_doc(documents, doc, doc_len, avg_doc_length, keywords, k1, b) do
    Enum.reduce(keywords, 0, fn keyword, score ->
      idf = get_idf(keyword, documents)
      tf = get_tf(keyword, doc)

      idf * (tf * (k1 + 1)) / (tf + k1 * (1 - b + b * doc_len / avg_doc_length)) + score
    end)
  end

  defp get_word_count(corpus) do
    Regex.scan(~r/\w+/, corpus) |> length()
  end

  defp get_idf(keyword, documents) do
    relevant_docs = Enum.filter(documents, &String.contains?(elem(&1, 0), keyword)) |> length()
    :math.log((length(documents) - relevant_docs + 0.5) / (relevant_docs + 0.5) + 1.0)
  end

  defp get_tf(keyword, document) do
    Regex.scan(~r/#{keyword}/, document) |> length()
  end
end
