defmodule ExJsTest do
  use ExUnit.Case
  doctest ExJs

  test "greets the world" do
    assert ExJs.hello() == :world
  end
end
