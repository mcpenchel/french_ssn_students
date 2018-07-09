require_relative "../french_ssn"

describe "#ssn_check" do
  it "returns class String" do
    expect(ssn_check("1 84 12 76 451 089 46").class).to eq(String)
  end
  it "has correct result" do
    expect(ssn_check("1 84 12 76 451 089 46")).to eq("a man, born in December, 1984 in Seine-Maritime.")
  end
  it "has wrong result" do
    expect(ssn_check("3 84 12 76 451 089 46")).to eq("The number is invalid")
  end
  it "has wrong result" do
    expect(ssn_check("1 84 12 76 451 089 99")).to eq("The number is invalid")
  end
end


