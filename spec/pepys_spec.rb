require "spec_helper"
require "stringio"

describe Pepys do
  let(:fakeio) { StringIO.new }
  let(:progname) { "bunion" }
  subject(:pepys) { Pepys::Logger.new(progname, fakeio) }

  Pepys::Formatter::LEVEL_MAPPINGS.each do |level_name, level|
    it "logs #{level_name} messages to io" do
      pepys.public_send(level_name.downcase, "ZOMGWTFBBQ")

      expect(JSON.parse(fakeio.string)).to eq(loghash("ZOMGWTFBBQ", level, progname))
    end
  end

  it "refuses to forward #formatter= message" do
    expect { pepys.formatter = -> (*_) { "Uh oh" } }.to raise_error(NoMethodError)
  end

  private

  def loghash(message, level, name)
    {
      "name" => name,
      "pid" => Process.pid,
      "hostname" => Socket.gethostname,
      "level" => level,
      "time" => Time.now.utc.iso8601,
      "msg" => message,
      "v" => 0,
    }
  end
end
