defmodule BM25.MixProject do
  use Mix.Project

  @version "1.0.0"
  @repo_url "https://github.com/elliotekj/bm25"

  def project do
    [
      app: :bm25,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      docs: docs()
    ]
  end

  def application, do: []

  defp deps, do: [{:ex_doc, "~> 0.31", only: :dev, runtime: false}]

  defp package do
    [
      maintainers: ["Elliot Jackson"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @repo_url}
    ]
  end

  defp description do
    """
    BM25 is a ranking algorithm for search.
    """
  end

  defp docs do
    [
      name: "BM25",
      main: "BM25",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/bm25",
      source_url: @repo_url
    ]
  end
end
