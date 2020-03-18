RSpec.describe Lolruby do
  it "has a version number" do
    expect(Lolruby::VERSION).not_to be nil
  end

  it "has a CLI subclass" do
    expect(Lolruby::CLI).not_to be nil
  end

  it "has an API subclass" do
    expect(Lolruby::API).not_to be nil
  end
end
