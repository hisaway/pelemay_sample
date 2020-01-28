defmodule PelemaySample do
  import Pelemay
  require Pelemay

  @compile {:inline, calc: 1}

  @moduledoc """
  ```elixir
  defpelemay do
    def cal(list) do
      list
      |> Enum.map(& &1 + 2)
    |> Enum.map(fn x -> x * 2 end)
  end

  #=>
  def cal(list) do
    list
    |> PelemayNif.map_mult
    |> PelemayNif.map_plus
  end
  ```
  """
  defpelemay do
    def list_minus_2(list) do
      list
      |> Enum.map(&(&1 - 2))
    end

    def list_plus_1(list) do
      list
      |> Enum.map(fn x -> x + 1 end)
    end

    def list_plus_2(list) do
      list
      |> Enum.map(fn x -> x + 2 end)
    end

    def list_mult_2(list) do
      list
      |> Enum.map(fn x -> x * 2 end)
    end

    def list_div_2(list) do
      list
      |> Enum.map(&(&1 / 2))
    end

    def list_mod_2(list) do
      list |> Enum.map(&rem(&1, 2))
    end

    def list_mod2_plus1(list) do
      list |> Enum.map(&(rem(&1, 2) + 1))
    end

    def logistic_map(list) do
      list
      |> Enum.map(&rem(22 * &1 * (&1 + 1), 6_700_417))
      |> Enum.map(&rem(22 * &1 * (&1 + 1), 6_700_417))
      |> Enum.map(&rem(22 * &1 * (&1 + 1), 6_700_417))
      |> Enum.map(&rem(22 * &1 * (&1 + 1), 6_700_417))
      |> Enum.map(&rem(22 * &1 * (&1 + 1), 6_700_417))
      |> Enum.map(&rem(22 * &1 * (&1 + 1), 6_700_417))
      |> Enum.map(&rem(22 * &1 * (&1 + 1), 6_700_417))
      |> Enum.map(&rem(22 * &1 * (&1 + 1), 6_700_417))
      |> Enum.map(&rem(22 * &1 * (&1 + 1), 6_700_417))
      |> Enum.map(&rem(22 * &1 * (&1 + 1), 6_700_417))
    end
  end

  def calc(x), do: rem(22 * x * (x + 1), 6_700_417) 

  def enum_logistic_map(list) do
    list
    |> Enum.map(&calc(&1))
    |> Enum.map(&calc(&1))
    |> Enum.map(&calc(&1))
    |> Enum.map(&calc(&1))
    |> Enum.map(&calc(&1))
    |> Enum.map(&calc(&1))
    |> Enum.map(&calc(&1))
    |> Enum.map(&calc(&1))
    |> Enum.map(&calc(&1))
    |> Enum.map(&calc(&1))
  end

  def fusion_flow_logistic_map(list, stage_num) do
    list
    |> Flow.from_enumerable(stages: stage_num)
    |> Flow.map(& (&1
      |> calc()
      |> calc()
      |> calc()
      |> calc()
      |> calc()
      |> calc()
      |> calc()
      |> calc()
      |> calc()
      |> calc()
    ))
    |> Enum.sort()
  end

  def flow_logistic_map(list, stage_num) do
    list
    |> Flow.from_enumerable(stages: stage_num)
    |> Flow.map(&calc(&1))
    |> Flow.map(&calc(&1))
    |> Flow.map(&calc(&1))
    |> Flow.map(&calc(&1))
    |> Flow.map(&calc(&1))
    |> Flow.map(&calc(&1))
    |> Flow.map(&calc(&1))
    |> Flow.map(&calc(&1))
    |> Flow.map(&calc(&1))
    |> Flow.map(&calc(&1))
    |> Enum.sort()
  end

  def stream_logistic_map(list) do
    list
    |> Stream.map(&calc(&1))
    |> Stream.map(&calc(&1))
    |> Stream.map(&calc(&1))
    |> Stream.map(&calc(&1))
    |> Stream.map(&calc(&1))
    |> Stream.map(&calc(&1))
    |> Stream.map(&calc(&1))
    |> Stream.map(&calc(&1))
    |> Stream.map(&calc(&1))
    |> Stream.map(&calc(&1))
    |> Enum.to_list()
  end
end
