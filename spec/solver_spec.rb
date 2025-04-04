RSpec.describe Solver, instance_name: :solver do
  let(:solver) { described_class.new(depth, start) }

  describe ".next_states_for(board)" do
    subject(:next_states) { described_class.next_states_for(board) }

    context "when there are no more moves possible" do
      let(:board) { 666666661 }

      it { is_expected.to eq([]) }
    end

    context "when there's a single move of 1 possible" do
      let(:board) { 666666660 }

      it { is_expected.to eq([666666661]) }
    end

    context "when there's a single capture possible" do
      let(:board) { 666_663_630 }

      it { is_expected.to eq([666_660_606]) }
    end

    context "when there are a ton of captures possible in the middle" do
      let(:board) { 616_101_616 }

      it do
        is_expected.to contain_exactly(
          606_040_606, # all 4 captured
          # 4 variants of 3-captures
          606_030_616,
          606_031_606,
          606_130_606,
          616_030_606,
          # 6 variants of 2-captures
          606_021_616,
          606_120_616,
          606_121_606,
          616_020_616,
          616_021_606,
          616_120_606,
        )
      end
    end

    context "when there's a combination of captures and 1-placement" do
      let(:board) { 62_510_163 }

      it { is_expected.to contain_exactly(162510163, 60503163, 60515160, 62504160, 60506160) }
    end
  end

  describe "#call(depth, start)" do
    subject(:call) { solver.call(**options) }

    context "when there's just one move remaining" do
      it "returns its hash" do
        is_expected.to eq(TODO)
      end
    end
  end
end
