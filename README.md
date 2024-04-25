# BM25: Ranking Algorithm for Search

[![Hex.pm Version](http://img.shields.io/hexpm/v/bm25.svg?style=flat)](https://hex.pm/packages/bm25)
[![HexDocs](https://img.shields.io/badge/HexDocs-Yes-blue)](https://hexdocs.pm/bm25)
[![Hex.pm License](http://img.shields.io/hexpm/l/bm25.svg?style=flat)](https://hex.pm/packages/bm25)

BM25 is an algorithm used to rank documents based on their relevance to a given
search query. It calculates a score for each document based on a given search
query, indicating how relevant each document is to that query. The higher the
BM25 score, the more relevant the document is considered.

## Installation

The package can be installed by adding `bm25` to your list of dependencies in
`mix.exs`:

```elixir
def deps do
  [
    {:bm25, "~> 1.0"}
  ]
end
```

## Usage ([documentation](https://hexdocs.pm/bm25))

```elixir
iex> documents = [
iex>   "BM25 is a ranking function",
iex>   "used by search engines",
iex>   "to rank matching documents"
iex> ]
iex> query = ["ranking", "search", "function"]
iex> BM25.bm25(documents, query)
[1.8455076734299591, 1.0126973514850315, 0.0]
```

## License

`BM25` is released under the [`Apache License
2.0`](https://github.com/elliotekj/bm25/blob/main/LICENSE).

## About

This package was written by [Elliot Jackson](https://elliotekj.com).

- Blog: [https://elliotekj.com](https://elliotekj.com)
- Email: elliot@elliotekj.com