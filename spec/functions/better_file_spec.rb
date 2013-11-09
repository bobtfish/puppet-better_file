require 'spec_helper'
require 'tempfile'

describe 'better_file' do
  before :each do
    @tf = Tempfile.new('puppet-better_file')
    @tf.write 'foobar'
    @tf.close
  end
  it 'should fail with no args' do
    expect { subject.call([]) }.to raise_error(Puppet::ParseError)
  end
  it 'should fail with many args' do
    expect { subject.call(['foo', 'bar']) }.to raise_error(Puppet::ParseError)
  end
  it 'should fail if given insane data type' do
    expect { subject.call([ [] ]) }.to raise_error(Puppet::ParseError)
  end
  
  it 'should work if given a normal path' do
    expect { subject.call([@tf.path]) }.not_to raise_error()
  end
  it { should run.with_params(@tf.path).and_return('foobar') }
end

