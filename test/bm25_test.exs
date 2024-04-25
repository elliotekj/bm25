defmodule BM25Test do
  use ExUnit.Case
  doctest BM25

  describe "bm25/4" do
    test "irrelevant queries return 0" do
      documents = ["foo", "bar", "baz"]
      query = ["qwerty"]
      assert [0, 0, 0] == BM25.bm25(documents, query)
    end

    test "relevant queries return scores greater than 0" do
      documents = [
        "In a galaxy torn by conflict, rebel forces battle against a despotic space empire. Heroes emerge as they navigate through epic space battles and political intrigue.",
        "A seasoned detective in a sprawling city investigates a series of mysterious crimes linked to a powerful underground syndicate, uncovering deep political corruption.",
        "In an enchanted jungle, a group of animals embark on an adventure to save their habitat from destruction caused by expanding city borders and corrupt corporate interests.",
        "A gripping historical drama that follows the tumultuous rise of a charismatic leader who challenges the political establishment, leading to revolutionary changes in their nation.",
        "A group of friends in a small city uncover an ancient evil as they investigate the mysterious history of a haunted house, leading to terrifying encounters with supernatural forces."
      ]

      query = ["political", "city", "mysterious", "adventure"]

      assert [
               0.5389965007326871,
               2.0502387423938075,
               1.8954670791388546,
               0.5476127858243288,
               1.3507080403765075
             ] ==
               BM25.bm25(documents, query)
    end
  end
end
