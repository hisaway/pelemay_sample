defmodule LogisticMapBench do
  use Benchfella

  @range_0x1000 (1..0x1000)
  @stages System.schedulers_online()

  setup_all do
    IO.inspect @stages
    {:ok, []}
  end

  bench "Enum" do
    @range_0x1000
    |> PelemaySample.enum_logistic_map
  end

  # bench "HiPE Enum" do
  #   @range_0x1000
  #   |> HipeSample.logistic_map
  # end

  bench "Pelemay" do
    @range_0x1000
    |> PelemaySample.logistic_map
  end

  bench "Flow 32" do
    @range_0x1000
    |> PelemaySample.flow_logistic_map(@stages)
  end

  bench "Flow 1" do
    @range_0x1000
    |> PelemaySample.flow_logistic_map(1)
  end

    bench "Fusion Flow 32" do
    @range_0x1000
    |> PelemaySample.fusion_flow_logistic_map(@stages)
  end

  bench "Fusion Flow 1" do
    @range_0x1000
    |> PelemaySample.fusion_flow_logistic_map(1)
  end

  bench "Stream" do
    @range_0x1000
    |> PelemaySample.stream_logistic_map
  end
end