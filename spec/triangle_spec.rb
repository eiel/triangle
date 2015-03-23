describe do
  [
   ['2, 3, 4','不等辺三角形ですね！'],
   ['2, 2, 1','二等辺三角形ですね！'],
   ['1, 1, 1','正三角形ですね！'],
   ['1, 2, 3','三角形じゃないです＞＜'],
  ].each do |arg,message|
    context "引数が #{arg}" do
      it do
        expect {
          system("ruby triangle.rb #{arg}")
        }.to output("#{message}\n").to_stdout_from_any_process
      end
    end
  end
end

require_relative '../triangle'

describe Triangle do
  subject { Triangle.new(*args).type }

  context do
    let(:args) { [2,2,2] }
    it { is_expected.to eq :regular }
  end

  context do
    let(:args) { [2,2,3] }
    it { is_expected.to eq :isosceles }
  end

  context do
    let(:args) { [3,2,2] }
    it { is_expected.to eq :isosceles }
  end

  context do
    let(:args) { [2,2,4] }
    it { is_expected.to eq :no }
  end

  context do
    let(:args) { [2,3,4] }
    it { is_expected.to eq :scalene }
  end

  context do
    let(:args) { [4,3,2] }
    it { is_expected.to eq :scalene }
  end

  context do
    let(:args) { [2,3,5] }
    it { is_expected.to eq :no }
  end

  context do
    let(:args) { [1,3,4] }
    it { is_expected.to eq :no }
  end
end
